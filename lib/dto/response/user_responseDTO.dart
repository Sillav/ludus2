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
    _id = int.parse(json['id'].toString());
    _nome = json['nome'];
    _idade = int.parse(json['idade'].toString());
    _descricao = json['descricao'];
    _dataCadastro = DateTime.parse(json['dataCadastro']);
    _id_curso = int.parse(json['curso']['id'].toString());
    _curso = json['curso']['nome'];
    _descricao_curso = json['curso']['nome'];
    _foto = json['foto']['imagem'];
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

  String getFotoBase64() {
    return this._foto;
  }

  File getFotoWithPath() {
    Uint8List bytes = Uint8List.fromList(base64.decode(this._foto));
    String tempFileName = 'temp_image_${this.hashCode}.jpg';
    File tempFile = File('${Directory.systemTemp.path}/$tempFileName');
    tempFile.writeAsBytesSync(bytes);
    return tempFile;
  }

  File getFotoWithObject() {
    Uint8List bytes = Uint8List.fromList(base64.decode(this._foto));
    return File.fromRawPath(bytes);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'nome': _nome,
      'idade': _idade,
      'descricao': _descricao,
      'dataCadastro': _dataCadastro
          .toIso8601String(), // Converte DateTime para String no formato ISO 8601
      'id_curso': _id_curso,
      'curso': _curso,
      'descricao_curso': _descricao_curso,
      'foto': _foto,
    };
  }
}
