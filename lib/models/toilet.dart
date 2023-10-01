class Toilet {
  final String name;
  final double point;
  final double distance;

  Toilet({
    required this.name,
    required this.point,
    required this.distance,
  });

  factory Toilet.fromJson(Map<String , dynamic> json){
      return Toilet(
        name: json['name'],
        point: json['rating'],
        distance: json['distance']
      );
  }
}
