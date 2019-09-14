class RecipesController < ApplicationController
  def show
    client = Redis.new(host: 'redis')
    recipe = RecipeFactory.create_from_json(client.hget('recipes', params[:id]))

    render json: recipe, adapter: :json
  end

  def index
    repository = ElasticSearch::RecipeRepository.new

    recipes = repository.search(query: {
      bool: {
        should: [
            { match: { name: params[:q] }},
            { match: { ingredients: params[:q] }}
        ]
      }
    }, size: 250).to_a

    response.headers['Access-Control-Allow-Origin'] = "*"
    render json: recipes
  end
end
