// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goodwill/source/data/model/basic_model.dart';
import 'package:goodwill/source/service/auth_service.dart';
import 'package:goodwill/source/util/constant.dart';

class ArticleModel extends BasicModel {
  String? image;
  String? ownerId;
  String? title;
  String? content;
  DateTime? createdAt;
  String? type;

  ArticleModel({
    String? id,
    this.image,
    this.ownerId,
    this.title,
    this.content,
    this.createdAt,
    this.type,
  }) : super(id: id);

  ArticleModel copyWith({
    String? id,
    String? image,
    String? ownerId,
    String? title,
    String? content,
    DateTime? createdAt,
    String? type,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      image: image ?? this.image,
      ownerId: ownerId ?? this.ownerId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'ownerId': ownerId,
      'title': title,
      'content': content,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'type': type,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] != null ? map['id'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      ownerId: map['ownerId'] != null ? map['ownerId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ArticleModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final dataMap = snapshot.data();

    return ArticleModel.fromMap(dataMap ?? {});
  }

  @override
  String toString() {
    return 'Article(id: $id,image: $image, ownerId: $ownerId, title: $title, content: $content, createdAt: $createdAt, type: $type)';
  }

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.ownerId == ownerId &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.type == type;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        ownerId.hashCode ^
        title.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        type.hashCode;
  }

  static ArticleModel get sample {
    return ArticleModel(
        title: "U-table seeking",
        image: Constant.SAMPLE_AVATAR_URL,
        ownerId: AuthService.userId,
        content: "I need a table to study at home",
        createdAt: DateTime.now(),
        type: 'donate');
  }

  static List<ArticleModel> get sampleArticles {
    return [
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
      ArticleModel(
          title: "U-table seeking",
          image: Constant.SAMPLE_AVATAR_URL,
          ownerId: AuthService.userId,
          content: "I need a table to study at home",
          createdAt: DateTime.now(),
          type: 'donate'),
    ];
  }
}
