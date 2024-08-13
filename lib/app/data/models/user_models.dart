class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? phone;
  String? address1;
  String? province;
  String? city;
  int? postCode;
  String? email;
  String? roleName;

  User(
      {this.id,
      this.username,
      this.firstname,
      this.lastname,
      this.phone,
      this.address1,
      this.province,
      this.city,
      this.postCode,
      this.email,
      this.roleName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    address1 = json['address1'];
    province = json['province'];
    city = json['city'];
    postCode = json['post_code'];
    email = json['email'];
    roleName = json['role_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['address1'] = this.address1;
    data['province'] = this.province;
    data['city'] = this.city;
    data['post_code'] = this.postCode;
    data['email'] = this.email;
    data['role_name'] = this.roleName;
    return data;
  }
}
