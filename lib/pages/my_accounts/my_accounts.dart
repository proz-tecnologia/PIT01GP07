import 'package:flutter/material.dart';

import 'account_controller.dart';
import 'account_states.dart';

class MyAccounts extends StatefulWidget {
  const MyAccounts({super.key});

  @override
  State<MyAccounts> createState() => _MyAccountsState();
}

class _MyAccountsState extends State<MyAccounts> {
  AccountController controller = AccountController();

  @override
  void initState() {
    super.initState();
    controller.getAccounts();
  }

  @override
  void dispose() {
    super.dispose();
    controller.accounts.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Minhas Contas'),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/addaccount');
              }),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.accounts,
        builder: (context, value, child) {
          if (value is AddAccountInitialState) {
            return Container();
          } else if (value is AddAccountLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (value is AddAccountErrorState) {
            return const Center(
              child: Text('Tivemos um problema'),
            );
          } else if (value is AddAccountFirtAccessState) {
            return const Center(
              child: Text('Ainda não há contas cadastradas'),
            );
          } else {
            return ListView(
              children: [
                for (int i = 0; i < value.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            value[i]['type'],
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const Spacer(),
                          Text(
                            'SALDO ',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                        ]),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(children: [
                          Text(
                            value[i]['account'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            value[i]['cashvalue'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ]),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
