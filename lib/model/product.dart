// ignore_for_file: prefer_typing_uninitialized_variables

// class ProductModel {
//   int? id;
//   String? title;
//   var price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   ProductModel(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.rating});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     price = json['price'];
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
//   }
// }

// class Rating {
//   var rate;
//   int? count;

//   Rating({this.rate, this.count});

//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }
// }

class ProductModel {
  int? id;
  String? caption;
  String? videoUrl;
  String? createdAt;

  ProductModel({this.id, this.caption, this.videoUrl, this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['video_url'] = videoUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
