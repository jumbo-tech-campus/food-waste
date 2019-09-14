class RecipeFactory
  def self.create_from_json(json)
    r = JSON.parse(json)

    ingredients = r['ingredients'].inject([]) do |memo, ingredient|
      memo << ingredient['name']
    end

    Recipe.new(id: r['id'], name: r['name'], image_url: r['imageInfo']['primaryView'].first['url'],
      cooking_time: r['cookingTime'], number_of_portions: r['numberOfPortions'],
      difficulty_level: r['difficultyLevel'], calories: r['calories'], ingredients: ingredients
    )
  end
end
