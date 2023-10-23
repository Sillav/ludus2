import 'package:Ludus/dto/request/user_requestDTO.dart';
import 'package:Ludus/entity/user_entity.dart';
import 'package:dio/dio.dart';

class UserRepository {
  String _atualizarTokenUrl = "";
  String _gerarTokenUrl = "http://192.168.0.15:2917/api/users/login";
  String _validarTokenUrl = "";
  String _getUsersUrl = "http://192.168.0.15:2917/api/pessoas/all";
  String _criarUsuarioUrl = "http://192.168.0.15:2917/api/pessoas/new";
  String _atualizarUsuarioUrl = "";
  String _deletarUsuarioUrl = "";

  atualizarToken() {}

  Future<String> gerarToken(String email, String senha) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(_gerarTokenUrl, data: {
        'email': email,
        'senha': senha,
      });

      if (response.statusCode == 200) {
        String token = response.data;
        return token;
      } else {
        throw Exception('Erro ao obter o token');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao obter o token');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao obter o token');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao obter o token');
      }
    }
  }

  Future<Map<String, dynamic>> criarUsuario(
      UserRequestDTO userTequestDTO) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'nome': userTequestDTO.getNome(),
        'idade': userTequestDTO.getIdade(),
        'email': userTequestDTO.getEmail(),
        'senha': userTequestDTO.getSenha(),
        'cursoId': userTequestDTO.getIdCurso(),
        'fotoNome': userTequestDTO.getNome(),
        'imagem': await MultipartFile.fromFile(userTequestDTO.getFoto().path),
      });

      Response response = await dio.post(_criarUsuarioUrl, data: formData);

      if (response.statusCode == 200) {
        print('Dados enviados com sucesso');
        return response.data;
      } else {
        throw Exception('Erro ao enviar dados do usuário');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao enviar dados do usuário');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao enviar dados do usuário');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao enviar dados do usuário');
      }
    }
  }
}
