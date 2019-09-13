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
end
