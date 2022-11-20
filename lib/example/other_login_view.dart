import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool successMessage = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _phone = "";

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) _formKey.currentState!.save();

    print("$_email, $_phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              key: const Key("findEmail"),
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                var str = value ?? "";
                var pattern = RegExp(
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                if (!pattern.hasMatch(str)) {
                  return "Invalid e-mail";
                }
                return null;
              },
              onSaved: (value) => setState(() => _email = value!),
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
              onSaved: (value) => setState(() => _phone = value!),
            ),
            ElevatedButton(onPressed: _submit, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
