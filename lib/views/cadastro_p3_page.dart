import 'package:Ludus/service/cadastro_service.dart';
import 'package:flutter/material.dart';
import 'package:Ludus/views/cadastro_p4_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CadastroPassoTres extends StatefulWidget {
  final String nome;
  final int idade;
  final String email;
  final String senha;
  final int idCurso;

  @override
  const CadastroPassoTres({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.senha,
    required this.idCurso,
  });
  @override
  _CadastroPassoTresState createState() => _CadastroPassoTresState();
}

class _CadastroPassoTresState extends State<CadastroPassoTres> {
  TextEditingController _descricaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  CadastroService _cadastroService = new CadastroService();

  validarCadastro() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CadastroPassoQuatro(
                    nome: widget.nome,
                    idade: widget.idade,
                    email: widget.email,
                    senha: widget.senha,
                    idCurso: widget.idCurso,
                    descricao: _descricaoController.text,
                  )));
    }
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
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                "Fale um pouco sobre você!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 40, right: 40),
                      child: TextFormField(
                        controller: _descricaoController,
                        style: TextStyle(color: Colors.white),
                        maxLines: 9,
                        validator: (descricao) {
                          var _valid =
                              _cadastroService.validarDescricao(descricao!);
                          if (_valid.runtimeType == bool) {
                            return null;
                          } else {
                            return _valid;
                          }
                        },
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
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
                          hintText: "Descrição",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Lexend',
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Vamos lá! Passo 3/4.',
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
                      onTap: () {
                        validarCadastro();
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
