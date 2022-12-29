import 'package:flutter/material.dart';
import 'add_new_account.dart';

class MyAccounts extends StatefulWidget {
  const MyAccounts({super.key});

  @override
  State<MyAccounts> createState() => _MyAccountsState();
}

class _MyAccountsState extends State<MyAccounts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Minhas Contas'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
            ),
                onPressed:(){Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddAccounts()),
                );}
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
      children: [
      const SizedBox(
      height: 16.0,
    ),
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children:[
    Text(
    'CONTA CORRENTE',
      style: Theme.of(context).textTheme.overline,
    ),
      const Spacer(),
      Text(
          'SALDO ',
        style: Theme.of(context).textTheme.overline,

      ),
      const SizedBox(
        width: 16.0,
      ),
    ]
    ),
    const SizedBox(
        height: 16.0,
      ),
    Row(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/bank_accounts/bradesco.png',
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              'Bradesco ',
                style:TextStyle (
                  fontSize: 18,
                  color:Theme.of(context).colorScheme.tertiary,
            ),
            ),
            const Spacer(),
            Text(
              'R\$ 120,00 ',
              style:TextStyle (
                fontSize: 18,
                color:Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),

          ]
      ),

    const SizedBox(
        height: 16.0,
      ),
    const Divider(
    thickness: 2,
    ),
    const SizedBox(
        height: 16.0,
      ),

      Row(
          children:[
            Text(
              'CONTA POUPANÇA',
              style: Theme.of(context).textTheme.overline,
            ),
            const Spacer(),
            Text(
              'SALDO ',
              style: Theme.of(context).textTheme.overline,

            ),
            const SizedBox(
              width: 16.0,
            ),
          ]
      ),
      const SizedBox(
        height: 16.0,
      ),
      Row(
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/bank_accounts/caixa.png',
                height: 24,
                width: 24,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              'Caixa Econômica',
              style:TextStyle (
                fontSize: 18,
                color:Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const Spacer(),
            Text(
              'R\$ 120,00 ',
              style:TextStyle (
                fontSize: 18,
                color:Theme.of(context).colorScheme.tertiary,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
          ]
      ),

    ],
    ),
    ),
    ],
    ),
    ),
    );
  }
}