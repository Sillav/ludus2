import 'package:flutter/material.dart';
import 'package:Ludus/views/cadastro_p3_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CadastroPassoDois extends StatefulWidget {
  final String nome;
  final int idade;
  final String email;
  final String senha;

  @override
  const CadastroPassoDois({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.senha,
  });

  _CadastroPassoDoisState createState() => _CadastroPassoDoisState();
}

class _CadastroPassoDoisState extends State<CadastroPassoDois> {
  bool _isSelected = false;
  bool _isSelected_2 = false;
  bool _isSelected_3 = false;
  bool _isSelected_4 = false;

  int _selectedOption = 0;

  bool _nextStep = false;

  validarCadastro() {
    if (_selectedOption != 0 && _nextStep) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CadastroPassoTres(
                    nome: widget.nome,
                    idade: widget.idade,
                    email: widget.email,
                    senha: widget.senha,
                    idCurso: _selectedOption,
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
                "Qual a sua área?",
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor:
                                _isSelected ? Colors.white : Color(0xFF0F141E),
                            side: BorderSide(width: 1, color: Colors.white),
                            fixedSize: Size(210, 60)),
                        onPressed: () => setState(() => {
                              _isSelected = !_isSelected,
                              _isSelected_2 = false,
                              _isSelected_3 = false,
                              _isSelected_4 = false,
                              _selectedOption = 1,
                              _nextStep = true
                            }),
                        child: Text(
                          'Engenharias',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: _isSelected
                                  ? Color(0xFF0F141E)
                                  : Colors.white),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: _isSelected_2
                                ? Colors.white
                                : Color(0xFF0F141E),
                            side: BorderSide(width: 1, color: Colors.white),
                            fixedSize: Size(210, 60)),
                        onPressed: () => setState(() => {
                              _isSelected_2 = !_isSelected_2,
                              _isSelected = false,
                              _isSelected_3 = false,
                              _isSelected_4 = false,
                              _selectedOption = 2,
                              _nextStep = true
                            }),
                        child: Text(
                          'Humanas',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: _isSelected_2
                                  ? Color(0xFF0F141E)
                                  : Colors.white),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: _isSelected_3
                                ? Colors.white
                                : Color(0xFF0F141E),
                            side: BorderSide(width: 1, color: Colors.white),
                            fixedSize: Size(210, 60)),
                        onPressed: () => setState(() => {
                              _isSelected_3 = !_isSelected_3,
                              _isSelected = false,
                              _isSelected_2 = false,
                              _isSelected_4 = false,
                              _selectedOption = 3,
                              _nextStep = true
                            }),
                        child: Text(
                          'Saúde',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: _isSelected_3
                                  ? Color(0xFF0F141E)
                                  : Colors.white),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: _isSelected_4
                                ? Colors.white
                                : Color(0xFF0F141E),
                            side: BorderSide(width: 1, color: Colors.white),
                            fixedSize: Size(210, 60)),
                        onPressed: () => setState(() => {
                              _isSelected_4 = !_isSelected_4,
                              _isSelected = false,
                              _isSelected_2 = false,
                              _isSelected_3 = false,
                              _selectedOption = 4,
                              _nextStep = true
                            }),
                        child: Text(
                          'Tecnologia',
                          style: TextStyle(
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: _isSelected_4
                                  ? Color(0xFF0F141E)
                                  : Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 115),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 55),
                    child: Text(
                      'Vamos lá! Passo 2/4.',
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
