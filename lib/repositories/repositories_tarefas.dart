import 'package:lista_tarefas/model/tarefa.dart';

class RepositoriesTarefas {
  final List<Tarefa> _taresfas = [];

  Future<void> adicionaTarefa(Tarefa tarefa) async {
    await Future.delayed(Duration(milliseconds: 200));
    _taresfas.add(tarefa);
  }

  Future<void> removerTarefa(String id) async {
    await Future.delayed(Duration(milliseconds: 200));
    _taresfas.removeWhere((tarefa) => tarefa.getId() == id);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(Duration(milliseconds: 200));

    _taresfas
        .where((tarefa) => tarefa.getId() == id)
        .first
        .setConcluido(concluido);
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(Duration(milliseconds: 200));
    return _taresfas;
  }
}
