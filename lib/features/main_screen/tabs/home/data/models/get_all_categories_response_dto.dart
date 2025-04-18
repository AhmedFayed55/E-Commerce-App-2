import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/entities/get_all_categories_response_entity.dart';

class GetAllCategoriesResponseDto extends GetAllCategoriesResponseEntity {
  GetAllCategoriesResponseDto({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMsg,
  });

  GetAllCategoriesResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null
            ? MetadataDto.fromJson(json['metadata'])
            : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class DataDto extends DataEntity {
  DataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  DataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({super.currentPage, super.numberOfPages, super.limit});

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
