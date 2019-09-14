class RecipesController < ApplicationController
  def show
    client = Redis.new(host: 'redis')
    recipe = RecipeFactory.create_from_json(client.hget('recipes', params[:id]))

    render json: recipe, adapter: :json
  end

  def index
    repository = ElasticSearch::RecipeRepository.new

    terms = params[:q].split(',').map do |query|
      {
          filter: {
            term: {
              ingredients: query
            }
          },
          weight: 1
      }
    end

    should_terms = params[:q].split(',').map do |query|
      {
        match: {
          ingredients: {
            query: query,
            operator: :or
          }
        }
      }
    end
    query = {
      query: {
        function_score: {
          query: {
            match: {
              ingredients: params[:q]
            }
          },
          boost_mode: :replace,
          score_mode: :sum,
          functions: terms
        }
      },
      rescore: {
        window_size: 250,
        query: {
          rescore_query: {
            bool: {
              must: should_terms
            }
          }
        }
      },
      size: 250
    }

    recipes = repository.search(query).to_a

    response.headers['Access-Control-Allow-Origin'] = "*"
    render json: recipes
  end
end
