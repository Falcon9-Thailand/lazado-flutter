class Category {
  final String id, category, image;

  Category({
    this.id,
    this.category,
    this.image,
  });

  // It create an Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      category: json["category"],
      image: json["image"],
    );
  }
}

// Our Demo Category
Category category = Category(
  id: "1",
  category: "Ferrary",
  image: "http://pngimg.com/uploads/ferrari/ferrari_PNG10680.png",
);
