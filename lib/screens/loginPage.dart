import 'package:flutter/material.dart';
import 'package:weather/screens/homePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Image.asset(
          "assets/light.jpeg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 340, top: 30),
          child: Icon(
            Icons.menu,
            size: 40,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, left: 30),
          child: Text(
            "SMART",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 140, left: 80),
          child: Text(
            "WEATHER",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(107),
                    topRight: Radius.circular(107)),
                gradient: LinearGradient(
                    colors: [Colors.black54, Colors.black26],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Into",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Manage Your Device & Accessory",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12))),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                  },
                    child: Container(
                      height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Don`t have an account yet?",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
