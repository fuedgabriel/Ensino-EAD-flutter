class Documents {
  String title;
  String description;
  String type;
  String link;
  String image;
  int id;

  Documents(
      {this.title,
        this.description,
        this.type,
        this.link,
        this.image,
        this.id});

  Documents.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['Description'];
    type = json['Type'];
    link = json['Link'];
    image = json['Image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Description'] = this.description;
    data['Type'] = this.type;
    data['Link'] = this.link;
    data['Image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}