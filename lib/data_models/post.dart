
import 'dart:convert';

PostResponse postResponseFromJson(String str) => PostResponse.fromJson(json.decode(str));

String postResponseToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {
  PostResponse({
    this.total,
    this.limit,
    this.skip,
    this.data,
  });

  int? total;
  int? limit;
  int? skip;
  List<PostDatum>? data;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    total: json["total"],
    limit: json["limit"],
    skip: json["skip"],
    data: List<PostDatum>.from(json["data"].map((x) => PostDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "skip": skip,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Like {
  Like({
    this.id,
    this.post,
    this.likedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? post;
  String? likedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    id: json["_id"],
    post: json["post"],
    likedBy: json["likedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "post": post,
    "likedBy": likedBy,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Like && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class PostDatum {
  PostDatum({
    this.id,
    this.likeCount,
    this.commentCount,
    this.caption,
    this.attachment,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.like,
  });

  String? id;
  int? likeCount;
  int? commentCount;
  String? caption;
  String? attachment;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Like? like;

  factory PostDatum.fromJson(Map<String, dynamic> json) => PostDatum(
    id: json["_id"] ?? '',
    likeCount: json["likeCount"] ?? 0,
    commentCount: json["commentCount"] ?? 0,
    caption: json["caption"] ?? '',
    attachment: json["attachment"] ?? '',
    createdBy: json["createdBy"] ?? '',
    createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
    like: json["like"] == null ? null : Like.fromJson(json["like"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "likeCount": likeCount,
    "commentCount": commentCount,
    "caption": caption,
    "attachment": attachment,
    "createdBy": createdBy,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
    "like": like == null ? null : like!.toJson(),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostDatum && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
