import 'dart:io';
import 'package:Ludus/dto/request/user_requestDTO.dart';
import 'package:Ludus/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Ludus/views/cadastro_p5_page.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class CadastroPassoQuatro extends StatefulWidget {
  final String nome;
  final int idade;
  final String email;
  final String senha;
  final int idCurso;
  final String descricao;

  @override
  const CadastroPassoQuatro({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.senha,
    required this.idCurso,
    required this.descricao,
  });
  @override
  _CadastroPassoQuatroState createState() => _CadastroPassoQuatroState();
}

class _CadastroPassoQuatroState extends State<CadastroPassoQuatro> {
  File _image = new File('');

  bool _erro = false;

  UserRepository userRepository = new UserRepository();

  validarCadastro() async {
    if (_image.path != '') {
      UserRequestDTO userRequestDTO = UserRequestDTO(
        widget.nome,
        widget.email,
        widget.idade,
        widget.senha,
        widget.descricao,
        widget.idCurso,
        _image,
      );
      try {
        userRepository.criarUsuario(userRequestDTO);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => CadastroPassoCinco()));
      } catch (erro) {
        print(erro);
      }
    } else {
      setState(() {
        _erro = true;
      });
    }
  }

  pickImageFromGallery() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 14);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this._image = imageTemporary);
    } on PlatformException catch (e) {
      print('Falha ao carregar imagem!: $e');
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
                "Carregue uma foto!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFF0F141E),
                      side: BorderSide(width: 1, color: Colors.white),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
                  onPressed: pickImageFromGallery,
                  child: _image.path != ''
                      ? ClipOval(
                          child: Image.file(
                            _image,
                            width: 190,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 80,
                        )),
            ),
            if (_image.path == '')
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                    height: 20,
                    child: _erro
                        ? Text(
                            "Carregue uma foto!",
                            style: TextStyle(
                                color: Colors.red, fontFamily: "lexend"),
                          )
                        : Text("")),
              ),
            Padding(
              padding: _image.path != ''
                  ? EdgeInsets.only(top: 175)
                  : EdgeInsets.only(top: 255),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Vamos lá! Passo 4/4.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: OutlineGradientButton(
                      child: Text('Finalizar',
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
