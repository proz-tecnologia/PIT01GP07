import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/default_button.dart';
import '../controllers/metas_controller.dart';

class MetasScreen extends StatefulWidget {
  const MetasScreen({Key? key}) : super(key: key);

  @override
  State<MetasScreen> createState() => _MetasScreenState();
}

class _MetasScreenState extends State<MetasScreen> {
  final metasController = MetasController();

  _start() {
    return Container();
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _success() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .75,
          child: ListView.builder(
              itemCount: metasController.metas.length,
              itemBuilder: (context, index) {
                var meta = metasController.metas[index];
                return ListTile(
                  leading: Checkbox(
                    value: meta.realizado,
                    onChanged: (bool? value) {
                      setState(() {
                        meta.realizado = value!;
                      });
                    },
                  ),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Conclusão: ${DateFormat('dd-MM-yyyy').format(meta.conclusao!)}',
                          ),
                          Text(
                            'Meta: ${meta.titulo!}',
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.edit),
                          ),
                          const SizedBox(
                            width: 24.0,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text(
                                      'Deseja mesmo excluir esta contar?'),
                                  actions: [
                                    OutlinedButton(
                                        onPressed: () async {
                                          String delete = await metasController
                                              .deleteMeta(meta.titulo!);
                                          if (delete == 'Success') {
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushReplacementNamed(
                                                context, '/metas');
                                          } else {
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 0),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                content: Text(delete),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('Sim')),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancelar'))
                                  ],
                                ),
                              );
                            },
                            child: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ],
                  ),
                  subtitle: Text(
                    'Valor: R\$ ${NumberFormat.currency(
                      locale: 'pt_BR',
                      customPattern: '#,### \u00a4',
                      decimalDigits: 2,
                      symbol: '',
                    ).format(
                      double.parse(meta.valor!),
                    )}',
                  ),
                );
              }),
        ),
        DefaultButton(title: 'Adicionar Nova Meta', func: onPressedAdd)
      ],
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          metasController.start();
        },
        child: const Text('Tente novamente'),
      ),
    );
  }

  stateManagement(MetasState state) {
    switch (state) {
      case MetasState.start:
        return _start();
      case MetasState.loading:
        return _loading();
      case MetasState.error:
        return _error();
      case MetasState.success:
        return _success();
    }
  }

  @override
  void initState() {
    super.initState();
    metasController.start();
  }

  void onPressedAdd() {
    Navigator.of(context).pushReplacementNamed('/addMeta');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Metas'),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: AnimatedBuilder(
        animation: metasController.state,
        builder: (context, child) {
          return stateManagement(metasController.state.value);
        },
      ),
    );
  }
}
