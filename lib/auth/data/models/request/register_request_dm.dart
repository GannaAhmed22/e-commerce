class RegisterRequestDm{
  RegisterRequestDm({
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone,});
  String? _name;
  String? _email;
  String? _password;
  String? _rePassword;
  String? _phone;

  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get rePassword => _rePassword;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['rePassword'] = _rePassword;
    map['phone'] = _phone;
    return map;
  }

}