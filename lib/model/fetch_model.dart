class ApiFetchModel {
  String? title;
  ApiFetchModel(
    {
      this.title
    }
  );

  factory ApiFetchModel.fromJson(Map<String,dynamic>json){
    return ApiFetchModel(title: json['title']);
  }
}