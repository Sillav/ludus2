import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class UserResponseDTO {
  late int _id;
  late String _nome;
  late int _idade;
  late String _descricao;
  late DateTime _dataCadastro;
  late int _id_curso;
  late String _curso;
  late String _descricao_curso;
  late String _foto;

  UserResponseDTO(Map<String, dynamic> json) {
    _id:
    json['id'] ?? 0;
    _nome:
    json['nome'] ?? '';
    _idade:
    json['idade'] ?? 0;
    _descricao:
    json['descricao'] ?? '';
    _dataCadastro:
    json['dataCadastro'] != null ? DateTime.parse(json['dataCadastro']) : null;
    _id_curso:
    json['curso']['id'];
    _curso:
    json['curso']['nome'];
    _descricao_curso:
    json['curso']['descricao'];
    _foto:
    json['foto']['imagem'];
  }

  int getId() {
    return this._id;
  }

  String getNome() {
    return this._nome;
  }

  int getIdade() {
    return this._idade;
  }

  String getDescricao() {
    return this._descricao;
  }

  DateTime getDataCadastro() {
    return this._dataCadastro;
  }

  int getIdCurso() {
    return this._id_curso;
  }

  String getCurso() {
    return this._curso;
  }

  String getDescricaoCurso() {
    return this._descricao_curso;
  }

  File getFotoWithPath() {
    Uint8List bytes = Uint8List.fromList(base64.decode(this._foto));
    File tempFile = File('${Directory.systemTemp.path}/temp_image.jpg');
    tempFile.writeAsBytesSync(bytes);
    return tempFile;
  }

  File getFotoWithObject() {
    Uint8List bytes = Uint8List.fromList(base64.decode(this._foto));
    return File.fromRawPath(bytes);
  }
}
