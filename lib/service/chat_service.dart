import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/repository/user_repository.dart';
import 'package:Ludus/service/auth_service.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatService {
  UserRepository userRepository = new UserRepository();

  AuthService authService = new AuthService();

  String splitName(String nome) {
    List<String> splits = nome.split(' ');
    return splits[0];
  }

  Query equalToList(Query query, List<Object?> values, {String? key}) {
    assert(
      values.isNotEmpty,
      'The list of values cannot be empty.',
    );

    for (Object? value in values) {
      query = query.equalTo(value, key: key);
    }

    return query;
  }
}
