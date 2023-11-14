import 'package:Ludus/dto/request/user_requestDTO.dart';
import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/service/auth_service.dart';
import 'package:dio/dio.dart';

class UserRepository {
  String _urlBase = "http://192.168.0.14:2917";

  AuthService authService = new AuthService();

  Future<List<int>> listaDeAmbosMatchs(String remetente_id) async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "$_urlBase/api/matchs/meus-matchs?remetente=$remetente_id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<int> destinatarios = [];
        responseData.forEach((item) {
          int destinatario = item['id']['destinatario'];
          destinatarios.add(destinatario);
        });
        return destinatarios;
      } else {
        throw Exception('Erro ao buscar lista de curtidas');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao buscar lista de curtidas');
      }
    }
  }

  Future<List<int>> listaDeQuemCurtiuUsuarioLogado(String remetente_id) async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "$_urlBase/api/matchs/te-curtiu?remetente=$remetente_id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<int> destinatarios = [];
        responseData.forEach((item) {
          int destinatario = item['id']['remetente'];
          destinatarios.add(destinatario);
        });
        return destinatarios;
      } else {
        throw Exception('Erro ao buscar lista de curtidas');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao buscar lista de curtidas');
      }
    }
  }

  Future<List<int>> listaDeQuemUsuarioLogadoCurtiu(String remetente_id) async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "$_urlBase/api/matchs/minhas-curtidas?remetente=$remetente_id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;
        List<int> destinatarios = [];
        responseData.forEach((item) {
          int destinatario = item['id']['destinatario'];
          destinatarios.add(destinatario);
        });
        return destinatarios;
      } else {
        throw Exception('Erro ao buscar lista de curtidas');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao buscar lista de curtidas');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao buscar lista de curtidas');
      }
    }
  }

  Future<bool> realizarMatch(
      String remetente_id, String destinatario_id) async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.post("$_urlBase/api/matchs/realizar",
          data: {
            'remetente': remetente_id,
            'destinatario': destinatario_id,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido');
      }
    }
  }

  Future<List<int>> buscarListaIdUsuario() async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.get("$_urlBase/api/pessoas/id-list",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      List<int> intList = (response.data as List<dynamic>).cast<int>().toList();
      if (response.statusCode == 200) {
        return intList;
      } else {
        throw Exception('Erro ao buscar lista de usuários');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao buscar lista de usuários');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao buscar lista de usuários');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao buscar lista de usuários');
      }
    }
  }

  Future<UserResponseDTO> buscarUsuario(String id) async {
    String token = await authService.getUserTokenFromSharedPreferences();
    try {
      Dio dio = Dio();
      Response response = await dio.get("$_urlBase/api/pessoas/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      print(response.data);
      UserResponseDTO userResponseDTO = new UserResponseDTO(response.data);
      if (response.statusCode == 200) {
        return userResponseDTO;
      } else {
        throw Exception('Erro ao buscar usuário');
      }
    } catch (error) {
      if (error is DioException) {
        if (error.response != null) {
          print(
              'Erro: ${error.response!.statusCode} - ${error.response!.statusMessage}');
          throw Exception('Erro de rede ao buscar usuário');
        } else {
          print('Erro: ${error.message}');
          throw Exception('Erro de rede ao buscar usuário');
        }
      } else {
        print('Erro desconhecido: $error');
        throw Exception('Erro desconhecido ao buscar usuário');
      }
    }
  }

  Future<String> gerarToken(String email, String senha) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post("$_urlBase/api/users/login", data: {
        'email': email,
        'senha': senha,
      });

      if (response.statusCode == 200) {
        String token = response.data;
        return token;
      } else {
        return 'ERRO';
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
      UserRequestDTO userRequestDTO) async {
    try {
      Dio dio = Dio();
      FormData formData = FormData.fromMap({
        'nome': userRequestDTO.getNome(),
        'idade': userRequestDTO.getIdade().toString(),
        'email': userRequestDTO.getEmail(),
        'senha': userRequestDTO.getSenha(),
        'cursoId': userRequestDTO.getIdCurso().toString(),
        'fotoNome': userRequestDTO.getNome(),
        'imagem': await MultipartFile.fromFile(userRequestDTO.getFoto().path),
      });

      Response response =
          await dio.post("$_urlBase/api/pessoas/new", data: formData);

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
