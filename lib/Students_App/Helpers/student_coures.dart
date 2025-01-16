class StudentCoures {
  final String image;
  final String title;
  final String author;
  final String rating;
  final String tag;
  final String details;
  bool isFavorite; // New property

  StudentCoures({
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.tag,
    required this.details,
    this.isFavorite = false, // Default value
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'author': author,
      'rating': rating,
      'tag': tag,
      'details': details,
      'isFavorite': isFavorite,
    };
  }

  // Create object from JSON
  factory StudentCoures.fromJson(Map<String, dynamic> json) {
    return StudentCoures(
      image: json['image'],
      title: json['title'],
      author: json['author'],
      rating: json['rating'],
      tag: json['tag'],
      details: json['details'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
