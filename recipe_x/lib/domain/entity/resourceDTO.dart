class ResourceDTO {
  int? id;
  String? title;
  String? image;

  ResourceDTO({this.id, this.title, this.image});

  factory ResourceDTO.fromMap(Map<String, dynamic> json) => ResourceDTO(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {"id": id, "title": title, "image": image};
}

class ListResourceDTO {
  final List<ResourceDTO>? lData;

  ListResourceDTO({
    this.lData,
  });

  factory ListResourceDTO.fromJson(List<dynamic> json) {
    List<ResourceDTO> data = <ResourceDTO>[];
    data = json.map((post) => ResourceDTO.fromMap(post)).toList();

    return ListResourceDTO(
      lData: data,
    );
  }
}
