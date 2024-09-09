class CompanyModel {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory CompanyModel.empty() => CompanyModel(
        name: '',
        catchPhrase: '',
        bs: '',
      );

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
