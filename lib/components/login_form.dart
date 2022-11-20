import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: const Key("findEmail"),
            decoration: const InputDecoration(labelText: "Email"),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              var str = value ?? "";
              if (!validateEmail(str)) {
                return "Invalid e-mail";
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key("findPhone"),
            decoration: const InputDecoration(labelText: "Phone"),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              var str = value ?? "";
              if (str.length < 11) {
                return "Invalid phone";
              }
              return null;
            },
          ),
          ElevatedButton(
            key: const Key("logSend"),
            child: const Text("Send"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  successMessage = true;
                });
              }
            },
          ),
          if (successMessage) const Text("Welcome"),
        ],
      ),
    );
  }
}
