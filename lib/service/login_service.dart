import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/repository/user_repository.dart';
import 'package:Ludus/service/auth_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginService {
  AuthService authService = new AuthService();
  UserRepository userRepository = new UserRepository();

  Future<bool> validarCredenciais(String email, String senha) async {
    String token = await userRepository.gerarToken(email, senha);
    if (token == 'ERRO') {
      return false;
    } else {
      await authService.salvarTokenSharedPreferences(token);
      Map<String, dynamic> decodeJWT = JwtDecoder.decode(token);
      UserResponseDTO userLogado =
          await userRepository.buscarUsuario(decodeJWT['pessoa_id']);
      await authService.salvarUsuarioSharedPreferences(userLogado);
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
