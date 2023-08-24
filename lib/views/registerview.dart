import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/services/userlogin.dart';

class registrationview extends StatefulWidget {
  const registrationview({super.key});

  @override
  State<registrationview> createState() => _registrationviewState();
}

class _registrationviewState extends State<registrationview> {
  final _auth = userregistrationlogin();
  bool isPasswordShow = false;
  bool isRegisterPageShow = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String? _validatePwdLength(String? value) {
    if (value!.length != 8) {
      return 'Minimun 8 Chars';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
            body: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 120, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Register",
                          style: GoogleFonts.poppins(
                              fontSize: 40, fontWeight: FontWeight.w800)
                          // TextStyle(
                          //     fontSize: 35, fontWeight: FontWeight.w800),
                          ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 10),
                        child: Text(
                          "please register to continue.",
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(96, 70, 70, 70)),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextField(
                            controller: _email,
                            style: GoogleFonts.poppins(
                                color: Color.fromARGB(200, 0, 0, 0)),
                            decoration: InputDecoration(
                                label: Text("EMAIL"),
                                labelStyle: TextStyle(
                                    color: const Color.fromARGB(110, 0, 0, 0)),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _email.clear();
                                    // _emailController.text = '';
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            // validator: _validatePwdLength
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Card(
                        elevation: 2,
                        shadowColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextFormField(
                            controller: _password,
                            obscureText: !isPasswordShow,
                            obscuringCharacter: '⬤',
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                label: Text(
                                  "PASSWORD",
                                  style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(110, 0, 0, 0)),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    isPasswordShow = !isPasswordShow;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    isPasswordShow
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            validator: _validatePwdLength,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          final email = _email.text;
                          final password = _password.text;

                          await _auth.registration(regemail: email, regpassword: password);
                          Navigator.of(context).pushNamedAndRemoveUntil('/login/', (route) => false);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.blueAccent,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                              height: 50,
                              width: 130,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(28, 0, 5, 0),
                                    child: Text(
                                      "REGISTER",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w800,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          // fontWeight: FontWeight.w900,
                                          // color: Colors.white
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil('/login/', (route) => false);
                          },
                          child: const Row(
                            children: [
                              Text(
                                "have an Account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
