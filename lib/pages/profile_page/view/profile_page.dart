import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/delete_account_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/logout_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/password_key_reset_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/password_reset_field.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/profile_picture.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/update_password_button.dart';
import 'package:flutter_project_home_manager/pages/profile_page/widgets/username_text.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});
  static const pageAddress = '/profilePage';

  @override
  ConsumerState<ProfilePage> createState() {
    return _ProfilePageState();
  }

}

  class _ProfilePageState extends ConsumerState<ProfilePage>{
    final GlobalKey<FormState>  key = GlobalKey(debugLabel: 'profile');
  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      key: UniqueKey(),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/textureBackgroundTwo.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: Center(
          child: Form(
            key: key,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfilePicture(),
                  UsernameTextProfilePage(),
                  PasswordResetInputField(),
                  PasswordKeyResetInputField(),
                  UpdatePasswordButton(),
                  LogoutButton(),
                  DeleteAccountButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
