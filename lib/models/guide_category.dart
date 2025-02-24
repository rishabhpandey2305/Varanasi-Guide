class GuideCategory {
  final String title;
  final String image;

  GuideCategory({required this.title, required this.image});

  factory GuideCategory.fromJson(Map<String, dynamic> json) {
    return GuideCategory(title: json['title'], image: json['image']);
  }
}
