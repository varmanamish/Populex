class Case {
  final String title;
  final String description;
  final int minRating;
  final String type;

  Case({
    required this.title,
    required this.description,
    required this.minRating,
    required this.type,
  });

  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      title: json['title'],
      description: json['description'],
      minRating: int.parse(json['minRating']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'minRating': minRating.toString(),
        'type': type,
      };
}
