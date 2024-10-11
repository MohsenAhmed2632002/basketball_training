// import 'package:basketball_training/features/Login/Data/Model/login_request_body.dart';
// import 'package:basketball_training/features/Login/Data/Repos/login_repo.dart';
// import 'package:basketball_training/features/Login/Logic/login_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:basketball_training/features/sign_up/data/models/sign_up_requestBody.dart';
import 'package:basketball_training/features/sign_up/data/models/sign_up_response.dart';
import 'package:basketball_training/features/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:basketball_training/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;

  SignUpCubit(this.signUpRepo) : super(const SignUpState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController passwordConfirmController1 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitSignUpState() async {
    emit(const SignUpState.loading());
    final response = await signUpRepo.signUp(
      SignUpRequestBody(
        passwordConfirmation: passwordConfirmController.text,
        
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (signUpResponse) => emit(
        SignUpState.success(
          signUpResponse,
        ),
      ),
      failure: (message) => emit(
        SignUpState.failure(
          message,
        ),
      ),
    );
  }
}
