class Medicines {
  final int id;
  Attributes attributes;

  Medicines({
    required this.id,
    required this.attributes,
  });

  factory Medicines.fromJson(Map<String, dynamic> json) {
    return Medicines(
      id: json['id'],
      attributes: Attributes.fromJson(json['attributes']),
    );
  }
}

class Attributes {
  final String name;
  final String chName;
  final String madeIn;
  final String pack;
  final String perBox;
  final String regulatory;
  final String price;
  final String category;
  final String tags;
  final String img;
  // final String createdAt;
  // final String updatedAt;
  // final String publishedAt;

  Attributes({
    required this.name,
    required this.chName,
    required this.madeIn,
    required this.pack,
    required this.perBox,
    required this.regulatory,
    required this.price,
    required this.category,
    required this.tags,
    required this.img,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.publishedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      name: json['name'],
      chName: json['chName'],
      madeIn: json['madeIn'],
      pack: json['pack'],
      perBox: json['perBox'],
      regulatory: json['regulatory'],
      price: json['price'],
      category: json['category'],
      tags: json['tags'],
      img: json['img'],
      // createdAt: json['createdAt'] as String,
      // updatedAt: json['updatedAt'] as String,
      // publishedAt: json['publishedAt'] as String,
    );
  }
}
