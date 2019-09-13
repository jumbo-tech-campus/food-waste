class Recipe {
  Recipe(
      {this.id,
      this.name,
      this.imageUrl,
      this.cookingTime,
      this.numberOfPortions,
      this.difficultyLevel});

  String id;
  String name;
  String imageUrl;
  int cookingTime;
  int numberOfPortions;
  String difficultyLevel;

  static Recipe stub = Recipe(
      id: "503452",
      name: "Zoete aardappel met biet en snelle hangop",
      imageUrl: "https://static-images.jumbo.com/product_images/Recipe_503452-01_560x560.jpg",
      cookingTime: 50,
      numberOfPortions: 4,
      difficultyLevel: "easy");
}
