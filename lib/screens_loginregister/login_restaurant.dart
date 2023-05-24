import 'package:flutter/material.dart';
import 'package:eatngo_thesis/components/textboxs.dart';

class LoginRestaurantPage extends StatefulWidget {
  const LoginRestaurantPage({Key? key}) : super(key: key);

  @override
  State<LoginRestaurantPage> createState() => _LoginRestaurantPageState();
}

class _LoginRestaurantPageState extends State<LoginRestaurantPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login as Restaurant'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormTextBox(
                  hintText: 'Email',
                  txtctrl: emailController,
                  emailValue: _email,
                ),
                PasswTextBox(
                  hintText: 'Password',
                  txtctrl: passController,
                  passValue: _password,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      // Submit login credentials
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
