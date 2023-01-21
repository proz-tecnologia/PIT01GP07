import 'package:flutter/material.dart';
import 'package:teste/pages/pix/pix_model.dart';

import '../controllers/add_pix_controller.dart';

class AddPixScreen extends StatefulWidget {
  const AddPixScreen({Key? key}) : super(key: key);

  @override
  State<AddPixScreen> createState() => _AddPixScreenState();
}

class _AddPixScreenState extends State<AddPixScreen> {
  final addPixController = AddPixController();
  final tipo = TextEditingController();
  final codigo = TextEditingController();
  final conta = TextEditingController();
  final descricao = TextEditingController();

  void onPressedSave() {
    addPixController.createPix(PixModel(
      tipo: tipo.text,
      codigo: codigo.text,
      conta: conta.text,
      descricao: descricao.text,
    ));
    Navigator.of(context).pushNamed('/pix');
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Tipo',
                    border: UnderlineInputBorder(),
                  ),
                  controller: tipo,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Código',
                    border: UnderlineInputBorder(),
                  ),
                  controller: codigo,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Conta',
                    border: UnderlineInputBorder(),
                  ),
                  controller: conta,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: UnderlineInputBorder(),
                  ),
                  controller: descricao,
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
