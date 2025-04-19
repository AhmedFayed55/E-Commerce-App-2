class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({this.results, this.metadata, this.data});

  num? results;
  CategoryOrBrandMetaDataEntity? metadata;
  List<CategoryOrBrandDataEntity>? data;
}

class CategoryOrBrandDataEntity {
  CategoryOrBrandDataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class CategoryOrBrandMetaDataEntity {
  CategoryOrBrandMetaDataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
