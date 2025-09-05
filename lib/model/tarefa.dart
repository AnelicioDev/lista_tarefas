import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  final String _descricao;
  bool _concluido;

  Tarefa(this._descricao, this._concluido);

  String getId() {
    return _id;
  }

  String getDescicao() {
    return _descricao;
  }

  void setDescricao(String descricao) {
    descricao = descricao;
  }

  bool getConcluido() {
    return _concluido;
  }

  void setConcluido(bool concluido) {
    _concluido = concluido;
  }
}
