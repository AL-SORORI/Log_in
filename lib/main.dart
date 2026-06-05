import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _key = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _pass = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login' , style: TextStyle(color: Colors.white, fontSize: 33 , fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: _key, 
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20) , 
                      border: Border.all(color: Colors.blueAccent)
                    ),
                    child: const Icon(Icons.lock, size: 80, color: Colors.blueAccent),
                  ),
                  
                  const SizedBox(height: 30),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s'))
                    ],
                    controller: _name,
                    decoration: const InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: Colors.blueAccent),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) { 
                        return 'Do not leave the field empty';
                      }
                      if (value.length < 3) {
                        return 'Write at least three letters';
                      }
                      return null; 
                    },
                  ),
                  
                  const SizedBox(height: 20),

                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s'))
                    ],
                    controller: _pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password', 
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Do not leave the field empty';
                      }
                      if (value.length < 8) {
                        return 'Write at least eight letters';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 40),  
                  
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        debugPrint("Logged in successfully with Username: ${_name.text}");
                                                
                        _name.clear();
                        _pass.clear();
                      } else {
                        debugPrint("Error in Fields");
                      }
                    },
                    child: const Text('Log in', style: TextStyle(fontSize: 19 , fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}