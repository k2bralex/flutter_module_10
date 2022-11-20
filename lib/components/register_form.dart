import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key("firstName"),
            decoration: const InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return "Enter first name";
              return null;
            },
          ),
          TextFormField(
            key: const Key("lastName"),
            decoration: const InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return "Enter last name";
              return null;
            },
          ),
          TextFormField(
            key: const Key("phone"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == '') return 'Enter phone';
              return null;
            },
          ),
          TextFormField(
            key: const Key("email"),
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Fulfill email field';
              if (!validateEmail(value!)) return 'Wrong email';
              return null;
            },
          ),
          ElevatedButton(
            key: const Key("regSend"),
            onPressed: _handleSubmit,
            child: const Text('Send'),
          ),
          if (_isSuccess) const Text('Registration successful')
        ],
      ),
    );
  }
}
