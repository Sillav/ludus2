import 'package:flutter/material.dart';
import 'package:Ludus/views/login_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 220),
              child: Column(children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Column(children: [
                    const Text(
                      "Junte-se a nós e socialize\nna sua universidade!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: OutlineGradientButton(
                          child: Text('Vamos la!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lexend')),
                          gradient: LinearGradient(colors: [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow
                          ]),
                          strokeWidth: 2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          radius: Radius.circular(25),
                          onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()))),
                    ),
                  ]),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
