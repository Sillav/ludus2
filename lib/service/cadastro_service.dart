class CadastroService {
  validarNome(String nome) {
    if (nome == null) {
      return "O campo não pode ser vazio!";
    }
    if (nome.length == 0) {
      return "O campo não pode ser vazio!";
    }
    if (nome.length > 20) {
      return "O nome deve conter no máximo 15 caracteres!";
    }
    return true;
  }

  validarIdade(String idade) {
    if (idade == null) {
      return "O campo não pode ser vazio!";
    }
    if (RegExp(r'^[0-9]+$').hasMatch(idade)) {
      if (idade.length == 2) {
        if (int.parse(idade) >= 18 && int.parse(idade) <= 100) {
          return true;
        } else {
          return "Idade inválida!";
        }
      } else {
        return "Idade inválida!";
      }
    } else {
      return "Idade inválida!";
    }
  }

  validarEmail(String email) {
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

  validarSenha(String senha) {
    if (senha == null) {
      return "Senha inválida!";
    }
    if (senha.length == 0) {
      return "O campo não pode ser vazio!";
    }
    return true;
  }

  validarDescricao(String? descricao) {
    if (descricao == null) {
      return "O campo não pode ser vazio!";
    }
    if (descricao.length == 0) {
      return "O campo não pode ser vazio!";
    }
    if (descricao.length > 150) {
      return "O nome deve conter no máximo 60 caracteres!";
    }
    return true;
  }
}
