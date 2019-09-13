class Recipe {
  Recipe(
      {String id,
      String name,
      String imageUrl,
      int cookingTime,
      int numberOfPortions,
      String difficultyLevel}):
  this.id = id,
  this.name = name,
  this.imageUrl = imageUrl,
  this.cookingTime = cookingTime,
  this.numberOfPortions = numberOfPortions,
  this.difficultyLevel = difficultyLevel;

  String id;
  String name;
  String imageUrl;
  int cookingTime;
  int numberOfPortions;
  String difficultyLevel;

  static Recipe stub = Recipe(
      id: "123456",
      name: "Groente-pizzamuffins Groente-pizzamuffins Groente-pizzamuffins Groente-pizzamuffins Groente-pizzamuffins",
      imageUrl:
          "https://static-images.jumbo.com/product_images/Recipe_503346-01_560x560.jpg",
      cookingTime: 20,
      numberOfPortions: 4,
      difficultyLevel: "easy");
}
