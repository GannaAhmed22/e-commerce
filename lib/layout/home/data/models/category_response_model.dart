import 'package:json_annotation/json_annotation.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final int? results;
  final Metadata? metadata;
  final List<CategoryItem>? data;

  CategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class CategoryItem {
  @JsonKey(name: "_id")
  final String? id;

  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  CategoryItem({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
