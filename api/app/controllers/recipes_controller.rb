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

    recipes = repository.search(query: {
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
    }, size: 250).to_a

    response.headers['Access-Control-Allow-Origin'] = "*"
    render json: recipes
  end
end
