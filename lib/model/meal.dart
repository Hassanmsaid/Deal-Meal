enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;

  const Meal(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.isGlutenFree,
      this.isVegan,
      this.isVegetarian,
      this.isLactoseFree,
      this.categories,
      this.ingredients,
      this.steps,
      this.complexity,
      this.affordability});

  String get getAffordability {
    return affordability.toString().substring(14);
  }

  String get getComplexity {
    return complexity.toString().substring(11);
  }
}
