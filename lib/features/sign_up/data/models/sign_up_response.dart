import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String email;
  final String password;

  final String passwordConfirmation;
  
  SignUpResponse({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
   
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}
