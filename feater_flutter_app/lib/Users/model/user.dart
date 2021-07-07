import 'package:feater_flutter_app/Users/model/role.dart';

class User{
  String? username;
  String? id;
  String? email;
  String? password;
  String? storyLife;
  String? birthDay;
  //Delivery Direction
  //FavoriteProducts
  //Pedidos
  //ProducedProducts
  String? rfc;
  String? company;
  bool? isMayorista;
  Role? role;
  bool? confirmed;
  bool? blocked;

  User({this.username, this.blocked, this.id, this.confirmed, this.email, this.password, this.storyLife, this.birthDay, this.rfc, this.company, this.isMayorista, this.role});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'] ?? '',
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        confirmed: json['confirmed'] ?? false,
        blocked: json['blocked'] ?? true,
        role: Role.fromJson(json['role'] ?? {})
    );
  }

  toJSON()=> {
    'id': this.id,
    'username': this.username,
    'email': this.email,
    'password': this.password,
    'confirmed': this.confirmed,
    'blocked': this.blocked,
    'role': this.role?.toJson()
  };

  toLoginMutate() => {
    'identifier': this.email,
    'password': this.password
  };

}