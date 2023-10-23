import 'package:flutter/material.dart';
import 'package:Ludus/views/login_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CadastroPassoCinco extends StatefulWidget {
  @override
  const CadastroPassoCinco({super.key});
  _CadastroPassoCincoState createState() => _CadastroPassoCincoState();
}

class _CadastroPassoCincoState extends State<CadastroPassoCinco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF0F141E),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Color(0xFF0F141E),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF0F141E),
                      side: BorderSide(width: 4, color: Colors.white),
                      padding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 11)),
                  onPressed: null,
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 40,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Muito bem!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 310),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Você está pronto para\ncomeçar a se divertir!',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w200,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: OutlineGradientButton(
                      child: Text('Vamos lá!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Lexend')),
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange, Colors.yellow]),
                      strokeWidth: 2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      radius: Radius.circular(25),
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false, // Remove todas as rotas anteriores
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
