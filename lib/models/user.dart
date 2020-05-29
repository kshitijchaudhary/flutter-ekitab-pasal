class User {
  int id;
  String name;
  String email;
  String address;
  String phone;
  String password;

  toJson(){
    return {
      'id' : id.toString(),
      'name' : name.toString(),
      'email' : email,
      'address':address,
      'phone':phone,
      'password' : password,
    };
  }
}