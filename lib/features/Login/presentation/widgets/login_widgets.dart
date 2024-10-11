import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:basketball_training/core/Helper/app_rgex.dart';
import 'package:basketball_training/core/Routing/Routes.dart';
import 'package:basketball_training/core/Theming/Font.dart';
import 'package:basketball_training/core/Widgets/Shared_Widgets.dart';
import 'package:basketball_training/features/Login/presentation/cubit/login_cubit.dart';
import 'package:basketball_training/features/Login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyEmailAndPassword extends StatefulWidget {
  const MyEmailAndPassword({super.key});

  @override
  State<MyEmailAndPassword> createState() => _MyEmailAndPasswordState();
}

class _MyEmailAndPasswordState extends State<MyEmailAndPassword> {
  bool isObscureText = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasSpecialChar = false;
  bool hasNumber = false;
  bool minimumLength = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;

    setPasswordController();
  }

  void setPasswordController() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialChar = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        minimumLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          MyTextFormField(
            label: 'E-Mail',
            hitText: 'E-Mail',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Enter E-Mail';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          SizedBox(
            height: 15.h,
          ),
          MyTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
            hitText: 'Password',
            isObscureText: isObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter E-Mail';
              }
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          PasswordValidation(
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
    passwordController.dispose();
    super.dispose();
  }
}

class PasswordValidation extends StatelessWidget {
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasSpecialChar;
  final bool hasNumber;

  final bool hasMinimumLength;

  const PasswordValidation({
    super.key,
    required this.hasMinimumLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasSpecialChar,
    required this.hasNumber,
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

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.fixed,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  titleTextStyle: getItalicTextStyle(context: context),
                  messageTextStyle: getItalicTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  title: 'loading',
                  message: '',
                  contentType: ContentType.help,
                ),
              ),
            );
          },
          success: (loginResponse) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: "Login Success",
                  message: "Welcome",
                  contentType: ContentType.success,
                  messageTextStyle: getItalicTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  titleTextStyle: getItalicTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
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
                  titleTextStyle: getItalicTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  messageTextStyle: getItalicTextStyle(
                    context: context,
                    color: Colors.white,
                  ),
                  title: error,
                  message: error,
                  contentType: ContentType.failure,
                ),
              ),
            );

            // showDialog(
            //   barrierColor: Colors.red,
            //   context: context,
            //   builder: (context) => Center(
            //     child: Text(error),
            //   ),
            // );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
