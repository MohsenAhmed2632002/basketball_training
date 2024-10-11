import 'package:basketball_training/core/NetWorking/API_result.dart';
import 'package:basketball_training/features/sign_up/data/models/sign_up_requestBody.dart';
import 'package:basketball_training/features/sign_up/data/models/sign_up_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpRepo(this._auth);
  Future<ApiResult<SignUpResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final UserCredential response =
          await _auth.createUserWithEmailAndPassword(
        email: signUpRequestBody.email,
        password: signUpRequestBody.password,
      );

      final user = response.user;
      if (user != null) {
        final signUpResponse = SignUpResponse(
            email: user.email ?? signUpRequestBody.email,
            password: '',
            passwordConfirmation: ''
            // name: user.displayName ?? 'Unknown',
            // email: user.email ?? signUpRequestBody.email,
            );

        return ApiResult.success(
          signUpResponse,
        );
      } else {
        return ApiResult.failure("Not Successful ");
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
