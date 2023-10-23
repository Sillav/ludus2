import 'dart:convert';
import 'package:Ludus/entity/user_entity.dart';
import 'package:Ludus/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<bool> validarCredenciais(String email, String senha) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = new UserRepository();
    String token = await userRepository.gerarToken(email, senha);
    if (token == 'ERRO') {
      return false;
    } else {
      return true;
    }
  }

  // VALIDADRES DOS CAMPOS DE SENHA E TEXTO

  validarEmail(String? email) {
    if (email == null) {
      return "Email inválido!";
    }
    if (!email.contains("@")) {
      return "Email inválido!";
    }
    if (!email.contains(".com")) {
      return "Email inválido!";
    }
    if (email.length == 0) {
      return "O campo não pode ser vazio!";
    }
    return true;
  }

  validarSenha(String? senha) {
    if (senha == null) {
      return "Senha inválida!";
    }
    if (senha.length == 0) {
      return "O campo não pode ser vazio!";
    }
    return true;
  }
}
