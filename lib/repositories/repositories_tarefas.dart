import 'package:lista_tarefas/model/tarefa.dart';

class RepositoriesTarefas {
  final List<Tarefa> taresfas = [];

  Future<void> adicionaTarefa(Tarefa tarefa) async {
    await Future.delayed(Duration(milliseconds: 200));
    taresfas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(Duration(milliseconds: 200));

    taresfas
        .where((tarefa) => tarefa.getId() == id)
        .first
        .setConcluido(concluido);
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(Duration(milliseconds: 200));
    return taresfas;
  }
}
