class Recipe < ActiveModelSerializers::Model
  attributes :id, :name, :image_url, :cooking_time, :number_of_portions,
    :difficulty_level, :calories

  def to_hash
    {
      id: id,
      name: name,
      difficulty_level: difficulty_level,
      image_url: image_url,
      calories: calories,
      cooking_time: cooking_time
    }
  end
end
