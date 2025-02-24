class Ghat {
  final String name;
  final String description;
  final String image;
  Ghat({required this.name, required this.description, required this.image});
  factory Ghat.fromJson(Map<String, dynamic> json) {
    return Ghat(
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }
}
