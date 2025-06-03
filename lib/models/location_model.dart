class LocationModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String category; // ex: "recyclage", "compost"
  final double rating;   // optionnel: 0.0 - 5.0

  // LocationModel({
  //   required this.id,
  //   required this.title,
  //   required this.description,
  //   required this.imageUrl,
  //   required this.latitude,
  //   required this.longitude,
  //   required this.category,
  //   this.rating = 0.0,
  // });

  // Pour convertir JSON → Objet
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      category: json['category'],
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }

  // Pour convertir Objet → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'category': category,
      'rating': rating,
    };
  }
}
