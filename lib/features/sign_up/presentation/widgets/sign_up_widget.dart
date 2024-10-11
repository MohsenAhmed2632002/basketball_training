import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basketball_training/core/Helper/app_rgex.dart';
import 'package:basketball_training/core/Routing/Routes.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:basketball_training/features/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEmailAndPasswordForSignUp extends StatefulWidget {
  const MyEmailAndPasswordForSignUp({super.key});

  @override
  State<MyEmailAndPasswordForSignUp> createState() =>
      _MyEmailAndPasswordForSignUpState();
}

class _MyEmailAndPasswordForSignUpState
    extends State<MyEmailAndPasswordForSignUp> {
  bool isObscureText = false;
  bool isObscureText2 = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool minimumLength = false;
  bool theSamePass = false;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    passwordConfirmController =
        context.read<SignUpCubit>().passwordConfirmController;

    setPasswordController();
  }

  void setPasswordController() {
    passwordController.addListener(updatePasswordValidation);
    passwordConfirmController.addListener(updatePasswordValidation);
  }

  void updatePasswordValidation() {
    setState(() {
      hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
      hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      minimumLength = AppRegex.hasMinLength(passwordController.text);
      theSamePass = passwordController.text == passwordConfirmController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          MyTextFormField(
            label: 'E-mail',
            hitText: 'Ahmed',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Enter E-Mail';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
            // hitText: 'E-Mail',
          ),
          SizedBox(
            height: 15.h,
          ),
          MyTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            label: 'Password',
            hitText: 'Password@123',
            isObscureText: isObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter Password';
              }
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          MyTextFormField(
            isObscureText: isObscureText2,

            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText2 = !isObscureText2;
                });
              },
              child: Icon(
                isObscureText2 ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            label: 'Password Confirm',
            hitText: 'Ahmed',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Enter Password Confirm';
              }
            },
            controller: context.read<SignUpCubit>().passwordConfirmController,
            // hitText: 'E-Mail',
          ),
          SizedBox(
            height: 15.h,
          ),
          PasswordConfirmValidation(
            theSamePass: theSamePass,
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasSpecialChar: hasSpecialChar,
            hasNumber: hasNumber,
            hasMinimumLength: minimumLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // passwordController.removeListener(updatePasswordValidation);
    // passwordConfirmController.removeListener(updatePasswordValidation);
    passwordConfirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class PasswordConfirmValidation extends StatelessWidget {
  final bool theSamePass;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialChar;
  final bool hasNumber;

  final bool hasMinimumLength;

  const PasswordConfirmValidation({
    required this.hasMinimumLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialChar,
    required this.hasNumber,
    required this.theSamePass,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(
          "At Least has 1  UpperCase Letter",
          hasUpperCase,
          // context,
        ),
        SizedBox(height: 10.h),
        buildValidationRow(
          "At Least has 1 LowerCase Letter",
          hasLowerCase,
          // context,
        ),
        SizedBox(height: 10.h),
        buildValidationRow(
          "At Least Has 1 SpecialChar Letter",
          hasSpecialChar,
          // context,
        ),
        SizedBox(height: 10.h),
        buildValidationRow(
          "At Least Has 1  Number Letter",
          hasNumber,
          // context,
        ),
        SizedBox(height: 10.h),
        buildValidationRow(
          "At Least Has 1 MinimumLength Letter",
          hasMinimumLength,
          // context,
        ),
        buildValidationRow(
          "same password",
          theSamePass,
          // context,
        ),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        hasValidated
            ? Icon(
                Icons.done_all_sharp,
                color: Colors.green,
              )
            : CircleAvatar(
                radius: 2.5,
                backgroundColor: Colors.grey,
              ),
        Text(
          text,
          style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic)
              .copyWith(
            decoration:
                hasValidated ? TextDecoration.none : TextDecoration.underline,
            color: hasValidated ? Colors.green : Colors.red,
            decorationColor: hasValidated ? Colors.green : Colors.red,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}

class LoginBlocListenerForSignUp extends StatelessWidget {
  const LoginBlocListenerForSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            CircularProgressIndicator();
          },
          success: (loginResponse) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  messageTextStyle: getBoldTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  titleTextStyle: getBoldTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  title: " Welcome ",
                  message: "SignUp Success",
                  contentType: ContentType.success,
                ),
              ),
            );
            Future.delayed(
              Duration(seconds: 5),
              () => Navigator.pushReplacementNamed(
                context,
                Routes.homeScreen,
              ),
            );
          },
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: error,
                  message: error,
                  contentType: ContentType.failure,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
