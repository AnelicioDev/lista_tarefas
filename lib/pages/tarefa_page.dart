import 'package:flutter/material.dart';
import 'package:lista_tarefas/model/tarefa.dart';
import 'package:lista_tarefas/repositories/repositories_tarefas.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<TarefaPage> {
  var repositorieTarefa = RepositoriesTarefas();
  var decricaoController = TextEditingController();
  List<Tarefa> tarefas = [];

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefas = await repositorieTarefa.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 251, 253, 255),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: TextField(controller: decricaoController)),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () async {
                    if (decricaoController.text.isNotEmpty) {
                      await repositorieTarefa.adicionaTarefa(
                        Tarefa(decricaoController.text, false),
                      );
                      decricaoController.clear();
                      setState(() {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Digite uma descrição antes de adicionar.",
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 241, 238, 41),
                  ),
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  var tarefa = tarefas[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: tarefa.getConcluido() == false ? Colors.amber : Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(tarefa.getDescicao()),
                      trailing: Checkbox(
                        value: tarefa.getConcluido(),
                        onChanged: (val) {
                          setState(() {
                            tarefa.setConcluido(val!);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
