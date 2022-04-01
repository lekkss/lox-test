import 'package:flutter/material.dart';
import 'package:loxtest/services/user_dao.dart';
import 'package:loxtest/ui/widgets/app_buttons.dart';
import 'package:loxtest/ui/widgets/app_large_text.dart';
import 'package:loxtest/ui/widgets/app_text.dart';
import 'package:loxtest/ui/screens/login_screen.dart';
import 'package:loxtest/ui/widgets/text_link.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var user = {};
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 88.0,
              right: 88,
              top: 70,
            ),
            child: AppLargeText(text: 'Welcome'),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 36.0, top: 48),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    onSaved: (value) {
                      user['name'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: ' Name',
                      labelText: 'Name',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      filled: true,
                      fillColor: const Color(0X3BDCDCDC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0X3BDCDCDC),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailController,
                    onSaved: (value) {
                      user['email'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: ' Email',
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      filled: true,
                      fillColor: const Color(0X3BDCDCDC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0X3BDCDCDC),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    onSaved: (value) {
                      user['password'] = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0X3BDCDCDC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Color(0X3BDCDCDC),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const AppText(text: "Already have an account?"),
                      const SizedBox(
                        width: 20,
                      ),
                      TextLink(
                        "LogIn",
                        color: Colors.red,
                        size: 16,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LogInScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  const SizedBox(height: 20),
                  AppButtons(
                    color: Colors.white,
                    text: 'Continue',
                    size: 280,
                    height: 50,
                    backgroundColor: Colors.red,
                    borderColor: Colors.red,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        userDao.signup(
                            _emailController.text, _passwordController.text);
                      } else {
                        debugPrint("not ok");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
