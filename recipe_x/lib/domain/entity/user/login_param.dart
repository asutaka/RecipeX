class LoginParams {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});
  factory LoginParams.fromJson(Map<String, dynamic> json) => LoginParams(
        username: json['username'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
  Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
      <String, dynamic>{
        'username': instance.username,
        'password': instance.password,
      };
}
