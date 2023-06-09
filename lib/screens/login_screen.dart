import 'package:flutter/material.dart';
import 'package:socool/constants/color.dart';
import 'package:socool/constants/constant.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/home_page.dart';
import 'package:socool/screens/register_screen.dart';
import 'package:socool/widgets/custom_elevated_button.dart';
import 'package:socool/widgets/custom_text_field.dart';
import 'package:socool/widgets/show_snackbar.dart';

import '../methods/auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;
  bool loginHidePassword = true;

  AuthMethods authMethods = AuthMethods();

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    FocusScope.of(context).unfocus();
    var res = await authMethods.loginEmailPassword(
        email: emailTextController.text, password: passwordTextController.text);

    if (res == kSuccessResult) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {}

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            splashRadius: 0.1,
            onPressed: () => Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage()),
              (route) => false,
            ),
            icon: const Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ////////////////////////////////
              //////
              ////////////////////////////////
              const Text(
                "Login",
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
                        builder: ((context) => const RegisterScreen()),
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
                labelString: "Login",
                onPressAction: () => loginUser(),
                isLoading: isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
