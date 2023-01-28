import 'package:flutter/material.dart';

import '../../../../../widgets/delete_dialog_box.dart';
import '../../../../edit_dialog_box.dart';
import 'add_new_credit_card.dart';

class MyCreditCards extends StatefulWidget {

  const MyCreditCards({super.key});

  @override
  State<MyCreditCards> createState() => _MyCreditCardsState();
}

class _MyCreditCardsState extends State<MyCreditCards> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text('Meus Cartões'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add,
              ),
              onPressed:(){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddCreditCard()),
              );}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                             IconButton(
                               icon: Icon(
                                 Icons.delete,
                                 color:Theme.of(context).colorScheme.tertiary,
                               ),
                               onPressed:(){
                                 showDialog(
                                   context: context,
                                   builder: (BuildContext context) {
                                     return const DeleteDialogBox(
                                       title: "Apagar Cartão de Crédito",
                                       descriptions:
                                       "Deseja mesmo apagar esse cartão e seus respectivos dados? ",
                                     );
                                   },
                                 );
                               },
                             ),
                             IconButton(
                                 icon: Icon(
                                   Icons.edit,
                                   color:Theme.of(context).colorScheme.tertiary,
                                 ),
                                 onPressed:(){
                                   showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return const EditDialogBox(
                                         text: "Salvar",
                                       );
                                     },
                                   );
                                 }
                             ),
                             ],
                       ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children:[
                      Text(
                        'Fatura Aberta',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const Spacer(),
                      Text(
                        'R\$ 150,00 ',
                        style:TextStyle (
                          fontSize: 18,
                          color:Theme.of(context).colorScheme.tertiary,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children:[
                      Text(
                        'Limite Disponível',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const Spacer(),
                      Text(
                        'R\$ 10,00 ',
                        style:TextStyle (
                          fontSize: 18,
                          color:Theme.of(context).colorScheme.tertiary,
                        ),
                      ),

                    ],
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
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color:Theme.of(context).colorScheme.tertiary,
                          ),
                          onPressed:(){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const DeleteDialogBox(
                                  title: "Apagar Cartão de Crédito",
                                  descriptions:
                                  "Deseja mesmo apagar esse cartão e seus respectivos dados? ",
                                );
                              },
                            );
                          },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color:Theme.of(context).colorScheme.tertiary,
                          ),
                          onPressed:(){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const EditDialogBox(
                                  text: "Salvar",

                                );
                              },
                            );
                          }
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children:[
                      Text(
                        'Fatura Aberta',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const Spacer(),
                      Text(
                        'R\$ 150,00 ',
                        style:TextStyle (
                          fontSize: 18,
                          color:Theme.of(context).colorScheme.tertiary,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children:[
                      Text(
                        'Limite Disponível',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      const Spacer(),
                      Text(
                        'R\$ 10,00 ',
                        style:TextStyle (
                          fontSize: 18,
                          color:Theme.of(context).colorScheme.tertiary,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
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