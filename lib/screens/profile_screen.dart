import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/constants/color.dart';
import 'package:socool/constants/constant.dart';
import 'package:socool/methods/auth_method.dart';
import 'package:socool/providers/state_provider.dart';
import 'package:socool/screens/feed_screen.dart';
import 'package:socool/screens/login_screen.dart';
import 'package:socool/widgets/show_snackbar.dart';

import '../constants/text_styles.dart';
import '../home_page.dart';
import '../providers/network_provider.dart';
import '../widgets/show_dialog_box copy.dart';
import 'no_internet_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthMethods authMethods = AuthMethods();

  @override
  void initState() {
    super.initState();

    authMethods.firebaseAuth.currentUser == null
        ? WidgetsBinding.instance.addPostFrameCallback(
            (_) => showProfileDialogBox(context: context),
          )
        : null;
  }

  void signOutUser() async {
    await authMethods.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    StateProvider userProvider = Provider.of(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Profile",
            style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: authMethods.firebaseAuth.currentUser != null
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('images/empty_user.png'),
                    ),
                    kSizedBoxHeight30,
                    ListTile(
                      tileColor: kPrimaryColorTwo,
                      leading: const Icon(
                        Icons.person,
                        size: kIconSize25,
                      ),
                      title: Text(
                        userProvider.getUser!.displayName,
                        style: kTextStyleSize15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: kIconSize15,
                      ),
                    ),
                    kSizedBoxHeight15,
                    ListTile(
                      tileColor: kPrimaryColorTwo,
                      leading: const Icon(
                        Icons.email,
                        size: kIconSize25,
                      ),
                      title: Text(
                        userProvider.getUser!.emailAddress,
                        style: kTextStyleSize15,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: kIconSize15,
                      ),
                    ),
                    kSizedBoxHeight30,
                    TextButton(
                      onPressed: () {
                        authMethods.signOut(context);
                      },
                      child: Text(
                        'Logout',
                        style: kTextStyleSize15.copyWith(
                            color: kYellowPrimaryColor),
                      ),
                    ),
                  ],
                ),
              )
            : Container());
  }
}
