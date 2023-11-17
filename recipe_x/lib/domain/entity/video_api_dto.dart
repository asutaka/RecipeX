class VideoAPIDTO {
  int? id;
  String? title;
  String? image;
  String? video_id;

  VideoAPIDTO({this.id, this.title, this.image, this.video_id});

  factory VideoAPIDTO.fromMap(Map<String, dynamic> json) => VideoAPIDTO(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        video_id: json["video_id"],
      );

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "image": image, "video_id": video_id};
}

class VideoAPIDTO_List {
  final List<VideoAPIDTO>? video_apis;

  VideoAPIDTO_List({
    this.video_apis,
  });

  factory VideoAPIDTO_List.fromJson(List<dynamic> json) {
    List<VideoAPIDTO> video_apis = <VideoAPIDTO>[];
    video_apis = json.map((post) => VideoAPIDTO.fromMap(post)).toList();

    return VideoAPIDTO_List(
      video_apis: video_apis,
    );
  }
}
