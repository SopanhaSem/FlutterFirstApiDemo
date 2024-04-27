// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    int id;
    String slug;
    String url;
    String title;
    String content;
    String image;
    String thumbnail;
    Status status;
    Category category;
    String publishedAt;
    String updatedAt;
    int userId;

    Welcome({
        required this.id,
        required this.slug,
        required this.url,
        required this.title,
        required this.content,
        required this.image,
        required this.thumbnail,
        required this.status,
        required this.category,
        required this.publishedAt,
        required this.updatedAt,
        required this.userId,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        slug: json["slug"],
        url: json["url"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        status: statusValues.map[json["status"]]!,
        category: categoryValues.map[json["category"]]!,
        publishedAt: json["publishedAt"],
        updatedAt: json["updatedAt"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "url": url,
        "title": title,
        "content": content,
        "image": image,
        "thumbnail": thumbnail,
        "status": statusValues.reverse[status],
        "category": categoryValues.reverse[category],
        "publishedAt": publishedAt,
        "updatedAt": updatedAt,
        "userId": userId,
    };
}

enum Category {
    ELEMENTUM,
    IPSUM,
    JSONPLACEHOLDER,
    LOREM,
    RUTRUM
}

final categoryValues = EnumValues({
    "elementum": Category.ELEMENTUM,
    "ipsum": Category.IPSUM,
    "jsonplaceholder": Category.JSONPLACEHOLDER,
    "lorem": Category.LOREM,
    "rutrum": Category.RUTRUM
});

enum Status {
    PUBLISHED
}

final statusValues = EnumValues({
    "published": Status.PUBLISHED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
