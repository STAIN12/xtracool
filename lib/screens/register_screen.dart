import 'package:flutter/material.dart';
import 'package:socool/constants/color.dart';
import 'package:socool/constants/constant.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/home_page.dart';
import 'package:socool/methods/auth_method.dart';
import 'package:socool/screens/login_screen.dart';
import 'package:socool/widgets/custom_elevated_button.dart';
import 'package:socool/widgets/custom_text_field.dart';
import 'package:socool/widgets/show_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;
  bool loginHidePassword = true;

  AuthMethods authMethods = AuthMethods();

  void signupUser() async {
    setState(() {
      isLoading = true;
    });
    var res = await authMethods.signUpEmailPasswordForm(
        fullName: fullNameTextController.text,
        emailAddress: emailTextController.text,
        password: passwordTextController.text);

    if (res == kSuccessResult) {
      if (mounted) {}
      setState(() {
        isLoading = false;
      });
      FocusScope.of(context).unfocus();
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomePage()),
        (route) => false,
      );
    } else {
      setState(() {
        isLoading = false;
      });
      if (mounted) {}
      showSnackBar(res, Colors.redAccent, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ////////////////////////////////
              //////
              ////////////////////////////////
              const Text(
                "Sign up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              kSizedBoxHeight30,

              ////////////////////////////////
              //////
              ////////////////////////////////
              CustomTextField(
                enableBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor),
                ),
                focusBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kYellowPrimaryColor),
                ),
                controller: fullNameTextController,
                labelTextString: 'Full name',
              ),
              kSizedBoxHeight20,

              ////////////////////////////////
              //////
              ////////////////////////////////
              CustomTextField(
                enableBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor),
                ),
                focusBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kYellowPrimaryColor),
                ),
                controller: emailTextController,
                labelTextString: 'Email address',
              ),
              kSizedBoxHeight20,

              ////////////////////////////////
              //////
              ////////////////////////////////
              CustomTextField(
                enableBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGreyColor),
                ),
                focusBorderStyle: const OutlineInputBorder(
                  borderSide: BorderSide(color: kYellowPrimaryColor),
                ),
                controller: passwordTextController,
                labelTextString: 'Password',
                passwordSuffixIcon: IconButton(
                  splashRadius: 0.2,
                  onPressed: () {
                    setState(() {
                      loginHidePassword = !loginHidePassword;
                    });
                  },
                  icon: Icon(
                    loginHidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                    size: kIconSize20,
                  ),
                ),
                obscureString: loginHidePassword,
              ),
              kSizedBoxHeight15,

              ////////////////////////////////
              //////
              ////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?  ",
                    style: kTextStyleSize12.copyWith(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const LoginScreen()),
                      ),
                    ),
                    child: Text(
                      "Sign up",
                      style:
                          kTextStyleSize12.copyWith(color: kYellowPrimaryColor),
                    ),
                  )
                ],
              ),
              kSizedBoxHeight70,

              ////////////////////////////////
              //////
              ////////////////////////////////
              CustomElevatedButton(
                labelString: "Continue",
                onPressAction: () => signupUser(),
                isLoading: isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
