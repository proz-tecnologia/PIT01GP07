import 'package:flutter/material.dart';
import 'package:teste/pages/pix/pix_model.dart';
import 'package:teste/pages/pix/pix_states.dart';
import 'package:teste/widgets/default_button.dart';

import '../controllers/add_pix_controller.dart';

class AddPixScreen extends StatefulWidget {
  const AddPixScreen({Key? key}) : super(key: key);

  @override
  State<AddPixScreen> createState() => _AddPixScreenState();
}

class _AddPixScreenState extends State<AddPixScreen> {
  final addPixController = AddPixController();
  String type = '';
  final code = TextEditingController();
  String account = '';
  final description = TextEditingController();
  final types = ['CPF', 'Celular', 'E-mail', 'Chave Aleatória'];
  final _formKey = GlobalKey<FormState>();

  void onPressedSave() {
    if (_formKey.currentState!.validate()) {
      addPixController.createPix(PixModel(
        type: type,
        code: code.text,
        account: account,
      ));
      Navigator.of(context).pushNamed('/pix');
    }
  }

  @override
  void initState() {
    super.initState();
    addPixController.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          title: const Text('Nova chave Pix'),
          leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pix');
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: addPixController.state,
          builder: (context, value, child) {
            if (value is PixInitialState) {
              return Container();
            } else if (value is PixLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (value is PixErrorState) {
              return const Center(
                child: Text('Erro no Servidor!'),
              );
            } else {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Cadastrar Chave Pix',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        children: [
                          DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Escolha um tipo de chave';
                              }
                            },
                            hint: const Text('Tipo'),
                            value: type.isEmpty ? null : '',
                            onChanged: ((value) {
                              type = value!;
                            }),
                            items: types
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ValueListenableBuilder(
                            valueListenable: addPixController.accounts,
                            builder: ((context, value, child) {
                              return DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Escolha uma conta para a chave';
                                    }
                                  },
                                  value: account.isEmpty ? null : '',
                                  hint: const Text('Escolha a conta'),
                                  onChanged: (selected) {
                                    account = selected!;
                                  },
                                  items: addPixController.accounts.value
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList());
                            }),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, digite a chave';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Digite a chave pix',
                              border: UnderlineInputBorder(),
                            ),
                            controller: code,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          DefaultButton(
                            title: 'Salvar',
                            func: onPressedSave,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
