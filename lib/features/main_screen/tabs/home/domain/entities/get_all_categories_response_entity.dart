class GetAllCategoriesResponseEntity {
  GetAllCategoriesResponseEntity({this.results, this.metadata, this.data});

  num? results;
  MetadataEntity? metadata;
  List<DataEntity>? data;
}

class DataEntity {
  DataEntity({
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

class MetadataEntity {
  MetadataEntity({this.currentPage, this.numberOfPages, this.limit});

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
