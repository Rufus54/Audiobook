import 'package:audiobook/userauth/firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {


  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose(){

    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white70,
                Colors.black87
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(

              child: Center(
                child: Container(
                  width: 330,
                  height: 350,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,

                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _emailController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(

                              hintText: 'Email Id',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _passwordController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(3)))),
                                onPressed: _signIn,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text(
                              'Forgot password?',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  void _signIn() async{

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email,password);

    if (user != null){
      print("user is successfully signed in");
      Navigator.pushNamed(context, "/submit");
    }
    else{
      print("Some error happened");
    }

  }
}
