import 'package:json_annotation/json_annotation.dart';
part 'sign_up_requestBody.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String email;
  final String password;

  final String passwordConfirmation;

  SignUpRequestBody({
    required this.passwordConfirmation,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
