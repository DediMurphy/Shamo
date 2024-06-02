class GalleryModel {
  // Properti
  int? id;
  late String url;

// Constrouctor
  GalleryModel({this.id, url});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
// Map di Dart dapat diatur dengan tipe kunci dan nilai spesifik. Misalnya,
// Map<String, int> memiliki kunci bertipe String dan nilai bertipe int.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}