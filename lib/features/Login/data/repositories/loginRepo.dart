import 'package:basketball_training/core/NetWorking/API_result.dart';
import 'package:basketball_training/features/Login/data/models/login_response.dart';
import 'package:basketball_training/features/Login/data/models/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final FirebaseAuth _auth;

  LoginRepo(this._auth);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      // تسجيل الدخول باستخدام FirebaseAuth
      final UserCredential response = await _auth.signInWithEmailAndPassword(
        email: loginRequestBody.email,
        password: loginRequestBody.password,
      );

      // استخراج بيانات المستخدم
      final user = response.user;

      if (user != null) {
        // إنشاء كائن LoginResponse
        final loginResponse = LoginResponse(
          name: user.displayName ??
              'Unknown', // إذا لم يكن الاسم موجودًا، استخدم 'Unknown'
          email: user.email ??
              loginRequestBody
                  .email, // استخدم البريد الإلكتروني من Firebase أو الطلب
        );

        // إرجاع النتيجة الناجحة
        return ApiResult.success(loginResponse);
      } else {
        return ApiResult.failure('User not found.');
      }
    } on FirebaseAuthException catch (e) {
      // معالجة مفصلة للأخطاء بناءً على رمز الخطأ
      switch (e.code) {
        case 'user-not-found':
          return ApiResult.failure('No user found for that email.');
        case 'wrong-password':
          return ApiResult.failure('Wrong password provided.');
        case 'invalid-credential':
          return ApiResult.failure(
              'The supplied auth credential is incorrect, malformed, or has expired.');
        case 'user-disabled':
          return ApiResult.failure('The user account has been disabled.');
        default:
          return ApiResult.failure(e.message ?? 'An unknown error occurred.');
      }
    } catch (error) {
      // أي خطأ آخر غير مرتبط بـ FirebaseAuth
      return ApiResult.failure(error.toString());
    }
  }
}
