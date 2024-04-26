import 'package:audiobook/login.dart';
import 'package:audiobook/userauth/firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                  height: 500,
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
                          'Signup',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _usernameController,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(

                              hintText: 'Full Name',
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
                          obscureText: true,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: 'New Password',
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
                          obscureText: true,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
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
                                onPressed: _signup,


                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to the login page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => login()),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
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

  void _signup() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email,password);

    if (user != null){
      print("user is successfully created");
      Navigator.pushNamed(context, "/home");
    }
    else{
      print("Some error happened");
    }

  }
}
