import 'package:flutter/material.dart';

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
    return ListView.builder(
        itemCount: pixController.pix.length,
        itemBuilder: (context, index) {
          var pix = pixController.pix[index];
          return ListTile(
            leading: Text(pix.tipo!),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conta: ${pix.conta!}',
                ),
                Text(
                  'Descrição: ${pix.descricao!}',
                ),
              ],
            ),
            subtitle: Text(pix.codigo!),
          );
        });
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
    Navigator.of(context).pushNamed('/addPix');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Minhas Chaves Pix'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: onPressedAdd,
          ),
        ],
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
