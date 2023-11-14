import 'package:Ludus/service/cadastro_service.dart';
import 'package:flutter/material.dart';
import 'package:Ludus/views/cadastro_p2_page.dart';
import 'package:flutter/services.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CadastroPassoUm extends StatefulWidget {
  @override
  _CadastroPassoUmState createState() => _CadastroPassoUmState();
}

class _CadastroPassoUmState extends State<CadastroPassoUm> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  CadastroService _cadastroService = new CadastroService();

  bool _isObscured = true;
  final _formKey = GlobalKey<FormState>();

  void validarCadastro() {
    if (_formKey.currentState!.validate()) {
      print("FORM VÁLIDO!");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CadastroPassoDois(
                    nome: _nomeController.text,
                    idade: int.parse(_idadeController.text),
                    email: _emailController.text,
                    senha: _senhaController.text,
                  )));
    } else {
      print("FORM INVÁLIDO");
    }
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      //statusBarColor:
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFF0F141E),
    ));
    super.initState();
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
        padding: EdgeInsets.only(top: 20),
        color: Color(0xFF0F141E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Criar conta",
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
                "Informe seus dados!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80.0,
                          minHeight: 80.0,
                        ),
                        child: TextFormField(
                          controller: _nomeController,
                          validator: (nome) {
                            var _valid = _cadastroService.validarNome(nome!);
                            if (_valid.runtimeType == bool) {
                              return null;
                            } else {
                              return _valid;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w200),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80.0,
                          minHeight: 80.0,
                        ),
                        child: TextFormField(
                          controller: _idadeController,
                          validator: (idade) {
                            var _valid = _cadastroService.validarIdade(idade!);
                            if (_valid.runtimeType == bool) {
                              return null;
                            } else {
                              return _valid;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Idade",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w200),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80.0,
                          minHeight: 80.0,
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            var _valid = _cadastroService.validarEmail(email!);
                            if (_valid.runtimeType == bool) {
                              return null;
                            } else {
                              return _valid;
                            }
                          },
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
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 80.0,
                          minHeight: 80.0,
                        ),
                        child: TextFormField(
                          controller: _senhaController,
                          validator: (senha) {
                            var _valid = _cadastroService.validarSenha(senha!);
                            if (_valid.runtimeType == bool) {
                              return null;
                            } else {
                              return _valid;
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          obscureText: _isObscured,
                          decoration: InputDecoration(
                              labelText: "Senha",
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.w200),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                  icon: _isObscured
                                      ? Icon(Icons.visibility_off)
                                      : Icon(
                                          Icons.visibility,
                                          color: Colors.white,
                                        ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const Text(
                    "Ao pressionar em Continuar,\nvocê concorda com os nossos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: InkWell(
                        child: Text(
                          'Termos e Política de Privacidade.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Lexend',
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                        onTap:
                            null /* () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LandingPage())),*/
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Text(
                      'Vamos lá! Passo 1/4.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: OutlineGradientButton(
                        child: Text('Continuar',
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
                        onTap: () => validarCadastro()),
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
