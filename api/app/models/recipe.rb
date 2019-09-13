class Recipe < ActiveModelSerializers::Model
  attributes :id, :name, :image_url, :cooking_time, :number_of_portions,
    :difficulty_level, :calories, :ingredients

  def to_hash
    {
      id: id,
      name: name,
      difficulty_level: difficulty_level,
      image_url: image_url,
      calories: calories,
      cooking_time: cooking_time,
      ingredients: ingredients
    }
  end
end
