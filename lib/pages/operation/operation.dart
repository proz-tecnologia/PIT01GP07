import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/pages/operation/operation_states.dart';
import '../../widgets/default_button.dart';
import 'operation_controller.dart';
import 'operation_model.dart';

class Operation extends StatefulWidget {
  final int tabController;
  const Operation({Key? key, required this.tabController}) : super(key: key);

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> with TickerProviderStateMixin {
  List<String> categoriesExpenses = [
    'Aluguel / Prestação da casa',
    'Seguros e impostos',
    'Manuteção da casa',
    'Supermercado',
    'Saúde',
    'Conta de água',
    'Conta de Luz',
    'Conta de internet',
    'Plano de telefonia',
    'Manuteção de carro',
    'Combustível',
    'Transporte',
    'Educação',
    'Presentes e doações',
    'Vestuário',
    'Academia',
    'Viagem',
    'Entretenimento',
    'Comer fora',
    'Itens para casa',
    'Streaming',
    'Itens pessoais',
    'Pets',
    'Investimento',
    'Fundo de emergência',
  ];
  List<String> categoriesIncome = [
    'Salário',
    'Empréstimo',
    'Hora-extra',
    'Investimento',
    'Outros',
  ];
  List<Icon> expensesIcon = [
    const Icon(Icons.house, color: Colors.pink),
    const Icon(Icons.request_quote, color: Colors.blueGrey),
    Icon(Icons.construction, color: Colors.brown[300]),
    const Icon(Icons.shopping_cart, color: Colors.green),
    const Icon(Icons.medical_services, color: Colors.red),
    const Icon(Icons.local_drink, color: Colors.lightBlue),
    Icon(Icons.flash_on, color: Colors.yellow[600]),
    const Icon(Icons.wifi, color: Colors.orangeAccent),
    const Icon(Icons.phone, color: Colors.grey),
    Icon(Icons.garage, color: Colors.lime[600]),
    const Icon(Icons.local_gas_station, color: Colors.deepPurple),
    Icon(Icons.commute, color: Colors.red[200]),
    Icon(Icons.school, color: Colors.blue[900]),
    const Icon(Icons.redeem, color: Colors.redAccent),
    const Icon(Icons.checkroom, color: Colors.teal),
    const Icon(Icons.fitness_center, color: Colors.indigo),
    Icon(Icons.flight, color: Colors.green[900]),
    const Icon(Icons.celebration, color: Colors.deepOrange),
    const Icon(Icons.lunch_dining, color: Colors.lightGreen),
    const Icon(Icons.bedroom_parent, color: Colors.indigoAccent),
    Icon(Icons.live_tv, color: Colors.purple[200]),
    Icon(Icons.pedal_bike, color: Colors.blueGrey[800]),
    Icon(Icons.pets, color: Colors.cyan[900]),
    Icon(Icons.savings, color: Colors.greenAccent[700]),
    Icon(Icons.account_balance_wallet, color: Colors.pink[700]),
  ];
  List<Icon> incomeIcon = [
    const Icon(Icons.attach_money, color: Colors.green),
    const Icon(Icons.request_quote, color: Colors.blueGrey),
    const Icon(Icons.more_time_outlined, color: Colors.red),
    Icon(Icons.savings, color: Colors.lime[600]),
    const Icon(Icons.account_balance_wallet_outlined, color: Colors.blue),
  ];

  final _formKey = GlobalKey<FormState>();

  String? selectedIncome = '';
  String? selectedExpense = '';
  String? selectedAccount = '';
  String? secondSelectedAccount = '';
  String? selectedCategorie = '';

  bool received = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController cashValue = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController receipt = TextEditingController();
  OperationController controller = OperationController();
  late TabController selectedController;
  String selectedOperation = '';
  late DateTime datemodel;

  @override
  void initState() {
    super.initState();
    controller.getAccounts();
    dateController.text = "";
    selectedController = TabController(
      initialIndex: widget.tabController,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.accounts.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: SizedBox(
              height: 20,
              child: TabBarView(
                controller: selectedController,
                children: const [
                  Text('Nova Receita'),
                  Text('Nova Despesa'),
                  Text('Nova Transferência')
                ],
              ),
            ),
          ),
          body: ValueListenableBuilder(
            valueListenable: controller.state,
            builder: (context, value, child) {
              if (value is OperationAccountsInitialState) {
                return Container();
              } else if (value is OperationAccountsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (value is OperationAccountsErrorState) {
                return const Center(
                  child: Text('Erro no Servidor!'),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Valor',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite um valor';
                                  }
                                },
                                controller: cashValue,
                                decoration: const InputDecoration(
                                  prefix: Text('R\$'),
                                  hintText: '0',
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(fontSize: 36),
                                keyboardType: TextInputType.number,
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Tipo',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Column(children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: TabBar(
                                    controller: selectedController,
                                    labelStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    labelColor:
                                        Theme.of(context).colorScheme.surface,
                                    unselectedLabelStyle: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    unselectedLabelColor:
                                        Theme.of(context).colorScheme.surface,
                                    indicator: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    tabs: const [
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("RECEITA"),
                                        ),
                                      ),
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("DESPESA"),
                                        ),
                                      ),
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("TRANSFERÊNCIA"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Insira uma data';
                                    }
                                  },
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.calendar_month),
                                    labelText: 'Data',
                                  ),
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: (context),
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1970),
                                      lastDate: DateTime(2100),
                                    );
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('MMM d, yyyy', 'pt_Br')
                                              .format(pickedDate);
                                      setState(() {
                                        datemodel = pickedDate;
                                        dateController.text =
                                            formattedDate.toString();
                                      });
                                    } else {
                                      ("Nenhuma data selecionada");
                                    }
                                  },
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  height: 350,
                                  child: TabBarView(
                                    controller: selectedController,
                                    children: [
                                      addoperation(true),
                                      addoperation(false),
                                      newTransference(),
                                    ],
                                  ),
                                ),
                              ]),
                              Center(
                                child: DefaultButton(
                                    title: 'Salvar',
                                    func: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (widget.tabController == 0) {
                                          selectedOperation = 'income';
                                        } else if (widget.tabController == 1) {
                                          selectedOperation = 'expense';
                                        } else if (widget.tabController == 2) {
                                          selectedOperation = 'transfer';
                                        }
                                        OperationModel newoperation =
                                            OperationModel(
                                          operationValue: cashValue.text
                                              .replaceAll(',', '.'),
                                          operation: selectedOperation,
                                          date: datemodel,
                                          account: selectedAccount!,
                                          categorie: selectedCategorie!,
                                          description: description.text,
                                        );
                                        controller.performOperation(
                                          operationModel: newoperation,
                                          secondAccount: secondSelectedAccount,
                                        );

                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Operation(
                                                    tabController:
                                                        selectedController
                                                            .index,
                                                  )),
                                        );
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }

  Widget addoperation(bool operation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        ValueListenableBuilder(
          valueListenable: controller.accounts,
          builder: ((context, value, child) {
            return DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Selecione uma conta';
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Conta",
                ),
                hint: const Text('Escolha a conta'),
                onChanged: (selected) {
                  selectedAccount = selected;
                },
                items: controller.accounts.value
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
          height: 16.0,
        ),
        incomeOrExpense(operation),
        const SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: description,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.dehaze),
            labelText: 'Descrição',
          ),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget incomeOrExpense(bool operation) {
    if (operation) {
      return DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Selecione uma categoria';
          }
        },
        decoration: const InputDecoration(
          labelText: "Categoria",
        ),
        hint: const Text('Escolha uma categoria'),
        value: selectedCategorie = selectedIncome,
        items: categoriesIncome
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    incomeIcon[
                        categoriesIncome.indexWhere((note) => note == e)],
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(e),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (val) {
          selectedCategorie = selectedIncome = val;
        },
      );
    } else {
      return DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Selecione uma categoria';
          }
        },
        decoration: const InputDecoration(
          labelText: "Categoria",
        ),
        hint: const Text('Escolha uma categoria'),
        value: selectedCategorie = selectedExpense,
        items: categoriesExpenses
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(
                  children: [
                    expensesIcon[
                        categoriesExpenses.indexWhere((note) => note == e)],
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(e),
                  ],
                ),
              ),
            )
            .toList(),
        onChanged: (val) {
          selectedCategorie = selectedExpense = val;
        },
      );
    }
  }

  Widget newTransference() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        ValueListenableBuilder(
          valueListenable: controller.accounts,
          builder: ((context, value, child) {
            return DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Conta",
                ),
                hint: const Text('Escolha a conta'),
                onChanged: (selected) {
                  selectedAccount = selected;
                },
                items: controller.accounts.value
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
          height: 8.0,
        ),
        const Center(
          child: Icon(Icons.compare_arrows, size: 36, color: Colors.grey),
        ),
        const SizedBox(
          height: 8.0,
        ),
        ValueListenableBuilder(
          valueListenable: controller.accounts,
          builder: ((context, value, child) {
            return DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Para Conta",
                ),
                hint: const Text('Escolha a conta'),
                onChanged: (selected) {
                  secondSelectedAccount = selected;
                },
                items: controller.accounts.value
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
          height: 16.0,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: description,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.dehaze),
            labelText: 'Descrição',
          ),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
