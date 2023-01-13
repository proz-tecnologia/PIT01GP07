import 'package:flutter/material.dart';
import 'package:teste/pages/metas/metas_controller.dart';
import 'package:teste/pages/metas/metas_model.dart';

class AddMetasScreen extends StatefulWidget {
  const AddMetasScreen({Key? key}) : super(key: key);

  @override
  State<AddMetasScreen> createState() => _AddMetasScreenState();
}

class _AddMetasScreenState extends State<AddMetasScreen> {
  final metasController = MetasController();
  DateTime? conclusao;
  final titulo = TextEditingController();
  final valor = TextEditingController();

  void onPressedSave() {
    metasController.createMeta(MetasModel(
      conclusao: conclusao,
      titulo: titulo.text,
      valor: valor.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Nova Meta'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
            ),
            onPressed: onPressedSave,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Cadastrar Meta Financeira',
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    ).then((date) {
                      setState(() {
                        conclusao = date;
                      });
                    });
                  },
                  icon: const Icon(Icons.date_range),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: UnderlineInputBorder(),
                  ),
                  controller: titulo,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Valor',
                    border: UnderlineInputBorder(),
                  ),
                  controller: valor,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
