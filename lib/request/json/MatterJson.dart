class MatterJson {
  String title;
  int id;

  MatterJson({this.title, this.id});

  MatterJson.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}