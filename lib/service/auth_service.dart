import 'dart:convert';
import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String _keyUser = 'key_user';
  final String _keyUserToken = 'key_userToken';

  salvarTokenSharedPreferences(String token) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_keyUserToken, token);
  }

  salvarUsuarioSharedPreferences(UserResponseDTO userLogado) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        _keyUser,
        jsonEncode({
          "id": userLogado.getId(),
          "nome": userLogado.getNome(),
          "idade": userLogado.getIdade(),
          "descricao": userLogado.getDescricao(),
          "dataCadastro": userLogado.getDataCadastro().toIso8601String(),
          "id_curso": userLogado.getIdCurso(),
          "curso": userLogado.getCurso(),
          "descricao_curso": userLogado.getDescricaoCurso(),
          "foto": userLogado.getFotoBase64()
        }));
  }

  Future<String> testeUser() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String teste = await sharedPreferences.getString(_keyUser)!;
    return teste;
  }

  Future<UserResponseDTO> getUserFromSharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String userDataString = sharedPreferences.getString(_keyUser)!;

    if (userDataString != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataString);

      UserResponseDTO userResponseDTO = UserResponseDTO({
        'id': userDataMap['id'],
        'nome': userDataMap['nome'],
        'idade': userDataMap['idade'],
        'descricao': userDataMap['descricao'],
        'dataCadastro': userDataMap['dataCadastro'],
        'curso': {
          'id': userDataMap['id_curso'],
          'nome': userDataMap['curso'],
          'descricao_curso': userDataMap['descricao_curso']
        },
        'foto': {'imagem': userDataMap['foto']}
      });
      return userResponseDTO;
    } else {
      throw Exception("Nenhum usuário encontrado no SharedPreferences.");
    }
  }

  Future<String> getUserTokenFromSharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(_keyUserToken)!;
    return token;
  }

  void atualizarToken() {}
}
