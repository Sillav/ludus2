import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class UserEntity {
  late int _id;
  late String _nome;
  late String _email;
  late int _idade;
  late String _senha;
  late String _descricao;
  late int _id_curso;
  late File _foto;

  UserEntity(
    int id,
    String nome,
    String email,
    int idade,
    String senha,
    String descricao,
    int id_curso,
    File foto,
  ) {
    this._id = id;
    this._nome = nome;
    this._email = email;
    this._idade = idade;
    this._senha = senha;
    this._descricao = descricao;
    this._descricao = descricao;
    this._id_curso = id_curso;
    this._foto = foto;
  }

  int getId() {
    return this._id;
  }

  String getNome() {
    return this._nome;
  }

  String getEmail() {
    return this._email;
  }

  int getIdade() {
    return this._idade;
  }

  String getSenha() {
    return this._senha;
  }

  String getDescricao() {
    return this._descricao;
  }

  int getIdCurso() {
    return this._id_curso;
  }

  File getFoto() {
    return this._foto;
  }
}
