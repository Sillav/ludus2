import 'dart:math';
import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/repository/user_repository.dart';
import 'package:Ludus/service/auth_service.dart';

class HomeService {
  UserRepository _userRepository = new UserRepository();

  AuthService authService = new AuthService();

  List<int> _originalList = [];
  List<int> _remainingList = [];

  Future<bool> verificarMeusMatchs(
      String remetente_id, String destinatario_id) async {
    List<int> matchList =
        await _userRepository.listaDeAmbosMatchs(remetente_id);
    bool match = false;
    matchList.forEach((item) {
      if (int.parse(destinatario_id) == item) {
        match = true;
      }
    });
    return match;
  }

  Future<bool> verificarOutrasCurtidas(
      String remetente_id, String destinatario_id) async {
    List<int> matchList =
        await _userRepository.listaDeQuemCurtiuUsuarioLogado(remetente_id);
    bool match = false;
    matchList.forEach((item) {
      if (int.parse(destinatario_id) == item) {
        match = true;
      }
    });
    return match;
  }

  Future<bool> verificarMinhasCurtidas(
      String remetente_id, String destinatario_id) async {
    List<int> matchList =
        await _userRepository.listaDeQuemUsuarioLogadoCurtiu(remetente_id);
    bool match = false;
    matchList.forEach((item) {
      if (int.parse(destinatario_id) == item) {
        match = true;
      }
    });
    return match;
  }

  Future<List<int>> getUsersMatch() async {
    UserResponseDTO userResponseDTO =
        await authService.getUserFromSharedPreferences();
    List<int> matches = await _userRepository
        .listaDeAmbosMatchs(userResponseDTO.getId().toString());
    print(matches);
    return matches;
  }

  Future<bool> realizarMatch(
      String remetente_id, String destinatario_id) async {
    bool match =
        await _userRepository.realizarMatch(remetente_id, destinatario_id);
    return match;
  }

  Future<void> carregarOriginalList() async {
    _originalList = List.from(await _userRepository.buscarListaIdUsuario());
  }

  Future<List<int>> getRandomElements() async {
    await carregarOriginalList();

    if (_remainingList.isEmpty) {
      _remainingList = List.from(_originalList);
    }

    var random = Random();
    var selectedElements = <int>[];
    var numberOfElements = min(5, _remainingList.length);

    for (var i = 0; i < numberOfElements; i++) {
      var randomIndex = random.nextInt(_remainingList.length);
      var selectedElement = _remainingList[randomIndex];
      selectedElements.add(selectedElement);
      _remainingList.removeAt(randomIndex);
    }

    return selectedElements;
  }

  Future<List<UserResponseDTO>> buscarUsuarios() async {
    List<int> usersIdList = await getRandomElements();
    List<UserResponseDTO> usersList = [];
    for (int i = 0; i < usersIdList.length; i++) {
      usersList
          .add(await _userRepository.buscarUsuario(usersIdList[i].toString()));
    }
    return usersList;
  }
}
