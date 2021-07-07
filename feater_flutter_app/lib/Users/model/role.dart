class Role{

  String? id;
  String? name;
  String? description;
  String? type;

  Role({this.id, this.name, this.description, this.type});

  factory Role.fromJson(Map<String, dynamic> json){

    return Role(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      type: json['type'] ?? ''
    );
  }

  toJson() => {
    'id': this.id,
    'name': this.name,
    'description': this.description,
    'type': this.type
  };


}