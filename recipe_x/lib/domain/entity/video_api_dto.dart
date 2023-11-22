class VideoAPIDTO {
  int? id;
  String? title;
  String? videoId;

  VideoAPIDTO({this.id, this.title, this.videoId});

  factory VideoAPIDTO.fromMap(Map<String, dynamic> json) => VideoAPIDTO(
        id: json["id"],
        title: json["title"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "videoId": videoId};
}

class ListVideoAPIDTO {
  final List<VideoAPIDTO>? lData;

  ListVideoAPIDTO({
    this.lData,
  });

  factory ListVideoAPIDTO.fromJson(List<dynamic> json) {
    List<VideoAPIDTO> data = <VideoAPIDTO>[];
    data = json.map((post) => VideoAPIDTO.fromMap(post)).toList();

    return ListVideoAPIDTO(
      lData: data,
    );
  }
}
