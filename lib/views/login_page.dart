import 'package:Ludus/service/login_service.dart';
import 'package:Ludus/views/teste.dart';
import 'package:flutter/material.dart';
import 'package:Ludus/views/home_page.dart';
import 'package:Ludus/views/cadastro_p1_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginService _loginService = new LoginService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  bool isObscured = true;
  bool loginValidation = false;
  final _formKey = GlobalKey<FormState>();

  validarLogin() async {
    if (_formKey.currentState!.validate()) {
      if (await _loginService.validarCredenciais(
          _emailController.text, _senhaController.text)) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Teste()),
          (route) => false, // Remove todas as rotas anteriores
        );
      } else {
        setState(() {
          loginValidation = true;
        });
      }
    } else {}
    //
  }

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
        padding: EdgeInsets.only(top: 50),
        color: Color(0xFF0F141E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Olá",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
                fontFamily: 'Lexend',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Bem vindo ao Ludus!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 80.0,
                        minHeight: 80.0,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w200,
                            fontSize: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: loginValidation
                                  ? Colors.red.shade800
                                  : Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: loginValidation
                                  ? Colors.red.shade800
                                  : Colors.white,
                            ),
                          ),
                        ),
                        validator: (email) {
                          var _valid = _loginService.validarEmail(email);
                          if (_valid.runtimeType == bool) {
                            return null;
                          } else {
                            return _valid;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80.0,
                          minHeight: 80.0,
                        ),
                        child: TextFormField(
                          controller: _senhaController,
                          style: TextStyle(color: Colors.white),
                          obscureText: isObscured,
                          decoration: InputDecoration(
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w200),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: loginValidation
                                      ? Colors.red.shade800
                                      : Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                  color: loginValidation
                                      ? Colors.red.shade800
                                      : Colors.white,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscured = !isObscured;
                                    });
                                  },
                                  icon: isObscured
                                      ? Icon(Icons.visibility_off)
                                      : Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                        ),
                                ),
                              )),
                          validator: (senha) {
                            var _valid = _loginService.validarSenha(senha);
                            if (_valid.runtimeType == bool) {
                              return null;
                            } else {
                              return _valid;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (loginValidation)
              Text(
                "* E-mail ou Senha Inválidos! *",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.red,
                  fontFamily: 'Lexend',
                ),
              ),
            Padding(
              padding: loginValidation
                  ? EdgeInsets.only(top: 185)
                  : EdgeInsets.only(top: 210),
              child: Column(
                children: [
                  const Text(
                    "Não possui uma conta?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: InkWell(
                      child: Text(
                        'Registre-se aqui!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CadastroPassoUm())),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: OutlineGradientButton(
                      child: Text('Entrar',
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
                      onTap: () => {
                        setState(() {
                          loginValidation = false;
                        }),
                        validarLogin()
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
