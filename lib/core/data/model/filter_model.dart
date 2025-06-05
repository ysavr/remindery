class FiltersModel {
  int? page;
  int? limit;
  int? offset;
  String? sort;

  FiltersModel({this.page, this.limit, this.offset, this.sort});

  FiltersModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['offset'] = offset;
    data['sort'] = sort;
    return data;
  }
}