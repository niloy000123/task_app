class VideosModel {
  int? id;
  String? caption;
  String? videoUrl;
  String? createdAt;

  VideosModel({this.id, this.caption, this.videoUrl, this.createdAt});

  VideosModel.fromJson(Map<String, dynamic> json) {
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
