import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/pages/login_page/widgets/title_image_widget.dart';
import 'package:flutter_project_home_manager/pages/signup_page/controller/signup_page_controller.dart';
import 'package:flutter_project_home_manager/pages/signup_page/widgets/button_widgets.dart';
import 'package:flutter_project_home_manager/pages/signup_page/widgets/text_fields_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});
  static const pageAddress = '/signupPage';

  @override
  ConsumerState<SignupPage> createState() {
    return _SignupPageState();
  }
}

  class _SignupPageState extends ConsumerState<SignupPage>{
    final GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: 'signup');
  @override
  Widget build(BuildContext context) {
    ref.read(signupPageProvider.notifier);
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    final iconWidth = width * 0.7;
    final formHeight = height * 0.9;
    return Scaffold(      
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/signup_image.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4)),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: formHeight,
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleIconWidget(width: iconWidth),
                    const UsernameFieldSignup(),
                    const PasswordFieldSignup(),
                    const PasswordHintFieldSignup(),
                    ToLoginScreenButton(validationKey: key,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
