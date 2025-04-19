import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/entities/category_or_brand_response_entity.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDto({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMsg,
  });

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null
            ? CategoryOrBrandMetaDataDto.fromJson(json['metadata'])
            : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDataDto.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class CategoryOrBrandDataDto extends CategoryOrBrandDataEntity {
  CategoryOrBrandDataDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryOrBrandDataDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class CategoryOrBrandMetaDataDto extends CategoryOrBrandMetaDataEntity {
  CategoryOrBrandMetaDataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  CategoryOrBrandMetaDataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
