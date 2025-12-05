import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormPage());
  }
}

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = FlutterSecureStorage();

  Future<void> saveCredentials() async {
    await storage.write(key: 'email', value: emailController.text);
    await storage.write(key: 'password', value: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Can\'t be empty'),
                    EmailValidator(errorText: 'Invalid email'),
                  ]).call,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.password),
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Can\'t be empty'),
                    MinLengthValidator(8, errorText: 'Password too short'),
                  ]).call,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveCredentials().then(
                        (_) => ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Saved data'))),
                      );
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () async {
          final String email =
              await storage.read(key: 'email') ?? "Nie zalogowano";
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(email)));
        },
      ),
    );
  }
}
