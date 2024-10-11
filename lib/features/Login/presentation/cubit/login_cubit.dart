// import 'package:basketball_training/core/Helper/shared_Pref_helper.dart';
// import 'package:basketball_training/features/Login/Data/Model/login_request_body.dart';
// import 'package:basketball_training/features/Login/Data/Repos/login_repo.dart';
// import 'package:basketball_training/features/Login/Logic/login_state.dart';
import 'package:basketball_training/features/Login/data/models/login_request.dart';
import 'package:basketball_training/features/Login/data/repositories/loginRepo.dart';
import 'package:basketball_training/features/Login/presentation/cubit/login_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

// FirebaseA
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    // re
    response.when(
      success: (loginResponse) async {
        emit(
          LoginState.success(
            loginResponse,
          ),
        );
      },
      failure: (message) => emit(
        LoginState.failure(
          message,
        ),
      ),
    );
  }
}
