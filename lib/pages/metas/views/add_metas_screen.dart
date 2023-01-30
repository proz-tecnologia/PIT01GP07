import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/pages/metas/controllers/add_meta_controller.dart';
import 'package:teste/pages/metas/metas_model.dart';
import 'package:teste/widgets/default_button.dart';

class AddMetasScreen extends StatefulWidget {
  const AddMetasScreen({Key? key}) : super(key: key);

  @override
  State<AddMetasScreen> createState() => _AddMetasScreenState();
}

class _AddMetasScreenState extends State<AddMetasScreen> {
  final addMetaController = AddMetaController();
  DateTime? conclusao;
  final titulo = TextEditingController();
  final valor = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  void onPressedSave() {
    addMetaController.createMeta(MetasModel(
      conclusao: conclusao,
      titulo: titulo.text,
      valor: valor.text,
    ));
    Navigator.of(context).pushNamed('/metas');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Nova Meta'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Selecione uma data';
                      }
                      return null;
                    },
                    controller: dateInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: "Data de Conclusão",
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        conclusao = pickedDate;
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);

                        setState(() {
                          dateInput.text = formattedDate;
                        });
                      } else {
                        //print("Date is not selected");
                      }
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite um breve título';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Título',
                      border: UnderlineInputBorder(),
                    ),
                    controller: titulo,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o valor do seu objetivo';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Valor',
                      border: UnderlineInputBorder(),
                    ),
                    controller: valor,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DefaultButton(
                      title: 'Salvar',
                      func: () {
                        if (_formKey.currentState!.validate()) {
                          onPressedSave();
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
