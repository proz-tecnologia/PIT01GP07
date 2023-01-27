import 'package:flutter/material.dart';
import 'package:teste/pages/homescreen/homescreen_widgets/cards_container/cards_container_widgets/accounts_card/account_card_controller.dart';
import '../../../../../my_accounts/account_info.dart';
import '../../../../../../../../widgets/raisedbutton_see_more.dart';
import '../../../../../../../../design_system/styleapp.dart';
import 'account_card_states.dart';

class CardAccount extends StatefulWidget {
  const CardAccount({super.key});

  @override
  CardAccountState createState() => CardAccountState();
}

class CardAccountState extends State<CardAccount> {
  AccountCardController controller = AccountCardController();
  @override
  void initState() {
    super.initState();
    controller.getAccounts();
  }

  @override
  void dispose() {
    super.dispose();
    controller.firstAccounts.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minhas Contas",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.all(
                  StyleApp.borderRadius,
                ),
                boxShadow: [
                  StyleApp.boxShadow,
                ],
              ),
              child: ValueListenableBuilder(
                  valueListenable: controller.state,
                  builder: ((context, value, child) {
                    if (value is AccountCardInitialState) {
                      return Container();
                    } else if (value is AccountCardLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (value is AccountCardErrorState) {
                      return const Center(
                        child: Text('Tivemos um problema'),
                      );
                    } else if (value is AccountCardFirtAccessState) {
                      return Center(
                          child: InkWell(
                        child: const Text(
                            'Clique aqui para cadastrar sua primeira conta!'),
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/myaccounts'),
                      ));
                    } else {
                      return ValueListenableBuilder(
                          valueListenable: controller.firstAccounts,
                          builder: ((context, value, child) {
                            return Column(children: [
                              const SizedBox(
                                height: 16.0,
                              ),
                              for (int i = 0; i < value.length; i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AccountInfo(
                                      nome: value[i]['account'],
                                      tipo: value[i]['type'],
                                      saldo: value[i]['cashvalue'],
                                      assetImage: value[i]['image']),
                                ),
                              const Spacer(),
                              SeeMoreButton(
                                text: "Ver tudo",
                                page: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/myaccounts');
                                },
                              ),
                              const SizedBox(height: 8.0),
                            ]);
                          }));
                    }
                  }))),
        ],
      ),
    );
  }
}
