class RecipesController < ApplicationController
  def show
    client = Redis.new(host: 'redis')
    r = JSON.parse(client.hget('recipes', params[:id]))

    recipe = Recipe.new(id: r['id'], name: r['name'], image_url: r['imageInfo']['primaryView'].first['url'],
      cooking_time: r['cookingTime'], number_of_portions: r['numberOfPortions'],
      difficulty_level: r['difficultyLevel'], calories: r['calories']
    )
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
    render json: recipes, adapter: :json, root: :recipes
  end
end
