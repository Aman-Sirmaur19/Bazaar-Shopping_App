import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';

enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: GlobalVariables.backgroundColor,
                  ),
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(children: [
                      CustomTextField(
                          hintText: 'Name', controller: _nameController),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hintText: 'Email', controller: _emailController),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hintText: 'Password',
                          controller: _passwordController),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hintText: 'Confirm Password',
                          controller: _confirmPasswordController),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Create Account',
                        onPressed: () {},
                      ),
                    ]),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
                title: const Text(
                  'SignIn',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: GlobalVariables.backgroundColor,
                  ),
                  child: Form(
                    key: _signInFormKey,
                    child: Column(children: [
                      CustomTextField(
                          hintText: 'Email', controller: _emailController),
                      const SizedBox(height: 10),
                      CustomTextField(
                          hintText: 'Password',
                          controller: _passwordController),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign-In',
                        onPressed: () {},
                      ),
                    ]),
                  ),
                ),
            ],
          ),
        )),
      ),
    );
  }
}
