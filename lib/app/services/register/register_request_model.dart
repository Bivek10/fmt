class RegisterRequestModel {
  String? fullName;
  String? email;
  String? id;
  String? phoneNumber;
  String? password;

  RegisterRequestModel(
      {this.fullName, this.email, this.id, this.phoneNumber, this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    id = json['id'];
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    return data;
  }
}
