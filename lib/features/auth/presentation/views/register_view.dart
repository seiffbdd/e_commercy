import 'package:e_commercy/core/utils/app_colors.dart';
import 'package:e_commercy/core/utils/assets_data.dart';
import 'package:e_commercy/core/utils/constants.dart';
import 'package:e_commercy/core/utils/screen_size.dart';
import 'package:e_commercy/core/utils/styles.dart';
import 'package:e_commercy/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:e_commercy/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:e_commercy/features/splash/presentation/views/widgets/already_have_an_account_row.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: ScreenSize.screenWidth(context) * 0.75,
                  child: Image.asset(AssetsData.eCommercyWord),
                ),
                sizedBoxHeight10,
                Text(
                  'Create an account to start shopping',
                  style: Styles.textStyle20,
                  textAlign: TextAlign.center,
                ),
                sizedBoxHeight30,
                CustomTextFormField(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(Icons.person_outline),
                  controller: _nameController,
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email_outlined),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  labelText: 'Password',
                  hintText: 'Create a password',
                  prefixIcon: Icon(Icons.lock),
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                sizedBoxHeight20,
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                sizedBoxHeight30,
                AuthButton(text: 'Create Account'),
                sizedBoxHeight20,
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text('  Or continue with  ', style: Styles.textStyle16),
                    Expanded(child: Divider()),
                  ],
                ),
                sizedBoxHeight10,
                AuthButton(
                  text: 'Google',
                  width: ScreenSize.screenWidth(context) * 0.5,
                  buttonColor: AppColors.kPrimaryBackgroundColor,
                  textColor: AppColors.blackColor,
                ),
                AlreayHaveAnAccountRow(
                  textColor: AppColors.blackColor,
                  buttonColor: AppColors.blueColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
