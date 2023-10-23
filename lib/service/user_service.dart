class UserService {
  /*
  Future<String> toBase64(File file) async {
    Uint8List? imagebytes = await file.readAsBytes(); //convert to bytes
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string
    return base64string;
  }

  Future<File> toFileImage(Uint8List uint8list, String filePath) async {
    File file = File(filePath);
    await file.writeAsBytes(uint8list);
    return file;
  }

  Future<Map<String, dynamic>> toJson() async {
    String _fotoBase64 = await toBase64(foto);

    return {
      'nome': nome,
      'idade': idade,
      'descricao': descricao,
      'email': email,
      'senha': senha,
      'curso': {'id': id_curso},
      'fotoDto': {'nome': "nome imagem", 'imagem': _fotoBase64}
    };
  }

  UserEntity.fromJson(Map<String, dynamic> json) {
    this.nome = json["nome"];
    this.idade = json["idade"];
    this.descricao = json["descricao"];
  }

  */
}
