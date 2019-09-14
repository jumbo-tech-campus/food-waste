class Recipe < ActiveModelSerializers::Model
  attributes :id, :name, :image_url, :cooking_time, :number_of_portions,
    :difficulty_level, :calories, :ingredients

  def to_hash
    @attributes
  end
end
