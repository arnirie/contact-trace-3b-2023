import 'package:contact_trace_3b/constants/style_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterClientScreen extends StatefulWidget {
  const RegisterClientScreen({super.key});

  @override
  State<RegisterClientScreen> createState() => _RegisterClientScreenState();
}

class _RegisterClientScreenState extends State<RegisterClientScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  void registerClient() async {
    //before register -> check/validate fields
    // if(_formKey.currentState!.validate()){

    // }
    EasyLoading.show(status: 'Processing...');
    //register Firebase Auth
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'a3@gmail.com', password: '123');
      EasyLoading.showSuccess('User account created.');
    } on FirebaseAuthException catch (ex) {
      EasyLoading.dismiss();
      if (ex.code == 'weak-password') {
        EasyLoading.showError(
            'Your password has weak complexity. Please enter a more secured password.');
      } else if (ex.code == 'email-already-in-use') {
        EasyLoading.showError(
            'Your email is already in use. Please enter another email. ');
      }
      print(ex.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Register an account:'),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: confirmpasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
                obscureText: obscurePassword,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // _formKey.currentState.validate
                },
                style: ElevatedButton.styleFrom(
                  shape: roundShape,
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
