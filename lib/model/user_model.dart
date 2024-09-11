import 'dart:convert';

List<Userdata> userdataFromMap(List<dynamic> json) =>
    List<Userdata>.from(json.map((x) => Userdata.fromjson(x)));

String userdataToMap(List<Userdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Userdata {
  int id;
  String? title;
  bool? readStatus;
  String? image;
  Profile? profile;

  Userdata({
    required this.id,
    required this.title,
    required this.readStatus,
    required this.image,
    required this.profile,
  });

  factory Userdata.fromjson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        title: json["title"],
        readStatus: json["read_status"],
        image: json["image"],
        profile: Profile.fromMap(json["profile"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "read_status": readStatus,
        "image": image,
        "profile": profile!.toMap(),
      };
}

class Profile {
  int id;
  String name;
  String image;

  Profile({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
