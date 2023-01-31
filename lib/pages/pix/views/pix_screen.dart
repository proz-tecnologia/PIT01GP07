import 'package:flutter/material.dart';

import '../../../widgets/default_button.dart';
import '../controllers/pix_controller.dart';

class PixScreen extends StatefulWidget {
  const PixScreen({Key? key}) : super(key: key);

  @override
  State<PixScreen> createState() => _PixScreenState();
}

class _PixScreenState extends State<PixScreen> {
  final pixController = PixController();

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
              itemCount: pixController.pix.length,
              itemBuilder: (context, index) {
                var pix = pixController.pix[index];
                return ListTile(
                  leading: Text(pix.type!),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Conta: ${pix.account!}',
                          ),
                          const Spacer(),
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
                                          String delete = await pixController
                                              .deletePix(pix.code!);
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
                  subtitle: Text('Chave:  ${pix.code!}'),
                );
              }),
        ),
        DefaultButton(title: 'Adicionar Chave', func: onPressedAdd)
      ],
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          pixController.start();
        },
        child: const Text('Tente novamente'),
      ),
    );
  }

  stateManagement(PixState state) {
    switch (state) {
      case PixState.start:
        return _start();
      case PixState.loading:
        return _loading();
      case PixState.error:
        return _error();
      case PixState.success:
        return _success();
    }
  }

  @override
  void initState() {
    super.initState();
    pixController.start();
  }

  void onPressedAdd() {
    Navigator.of(context).pushReplacementNamed('/addPix');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Minhas Chaves Pix'),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: AnimatedBuilder(
        animation: pixController.state,
        builder: (context, child) {
          return stateManagement(pixController.state.value);
        },
      ),
    );
  }
}
