import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  void signUp(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email': email,
            'password': password
          }
      );
      if (response.statusCode == 200) {
        print('Account Created Successfully');
      } else {
        print('Failed to Create Account');
      }
    }
    catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
             GestureDetector(
               onTap: () {
                 signUp(emailController.text.toString(), passwordController.text.toString());
               },
    child: Container(
    height: 50,
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10.0)
    ),
    child: Center(child: Text('Sign Up',
    style: TextStyle(fontFamily: 'Raleway', fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold) ,)),
    ),
    ),
    ],
    ),
    ),
    );
    }
  }
