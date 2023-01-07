import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  String? selectedIncome = 'Salário';
  String? selectedExpense = 'Aluguel / Prestação da casa';
  String? selectedAccount = '';
  String? selectedCategorie = '';
  Widget title1() {
    return const Text('Nova Receita');
  }

  Widget title2() {
    return const Text('Nova Despesa');
  }

  Widget title3() {
    return const Text('Nova Transação');
  }

  bool received = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController cashValue = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController receipt = TextEditingController();
  OperationController controller = OperationController();
  late TabController _selectedController;
  String selectedOperation = '';

  @override
  void initState() {
    super.initState();
    dateController.text = "";
    _selectedController = TabController(
      initialIndex: widget.tabController,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateModel = DateTime.now();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          title: SizedBox(
            height: 20,
            child: TabBarView(
              controller: _selectedController,
              children: [
                title1(),
                title2(),
                title3(),
              ],
            ),
          ),
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
                    Text(
                      'Valor',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    TextField(
                      controller: cashValue,
                      decoration: const InputDecoration(
                        prefix: Text('R\$'),
                        hintText: '0',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 50),
                      keyboardType: TextInputType.number,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Tipo',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Column(children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: TabBar(
                          controller: _selectedController,
                          labelStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          labelColor: Theme.of(context).colorScheme.surface,
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelColor:
                              Theme.of(context).colorScheme.surface,
                          indicator: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              color: Theme.of(context).colorScheme.primary),
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
                                child: Text("TRANSAÇÃO"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      TextField(
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
                            dateModel = pickedDate;
                            String formattedDate =
                                DateFormat('MMM d, yyyy', 'pt_Br')
                                    .format(pickedDate);
                            setState(() {
                              dateController.text = formattedDate.toString();
                            });
                          } else {
                            ("Nenhuma data selecionada");
                          }
                        },
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        height: 420,
                        child: TabBarView(
                          controller: _selectedController,
                          children: [
                            addIncome(),
                            addExpense(),
                            newTransference(),
                          ],
                        ),
                      ),
                    ]),
                    Center(
                      child: DefaultButton(
                          title: 'Salvar',
                          func: () {
                            if (widget.tabController == 0) {
                              selectedOperation = 'income';
                            } else if (widget.tabController == 1) {
                              selectedOperation = 'expense';
                            }
                            OperationModel newoperation = OperationModel(
                                operationValue: cashValue.text,
                                operation: selectedOperation,
                                date: dateModel,
                                paid: received,
                                account: selectedAccount!,
                                categorie: selectedCategorie!,
                                description: description.text,
                                receipt: receipt.text);
                            controller.performOperation(newoperation);
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addIncome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 230,
          child: SwitchListTile(
            title:
                Text('Recebido', style: Theme.of(context).textTheme.bodyText1),
            secondary: Icon(Icons.monetization_on_outlined,
                color: Theme.of(context).colorScheme.primary),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveThumbColor: Colors.grey,
            value: received,
            onChanged: (bool value) {
              setState(() {
                received = value;
              });
            }, // trailing:,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "Conta",
          ),
          value: selectedAccount = selectedIncome,
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
                      Text(
                        e,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {},
        ),
        const SizedBox(
          height: 16.0,
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "Categoria",
          ),
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
          onChanged: (val) {},
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
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: receipt,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.receipt),
            labelText: 'Comprovante',
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget addExpense() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 230,
          child: SwitchListTile(
            title: Text('Pago', style: Theme.of(context).textTheme.bodyText1),
            secondary: Icon(Icons.monetization_on_outlined,
                color: Theme.of(context).colorScheme.primary),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveThumbColor: Colors.grey,
            value: received,
            onChanged: (bool value) {
              setState(() {
                received = value;
              });
            }, // trailing:,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(
          thickness: 2,
        ),
        const SizedBox(
          height: 16.0,
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "Conta",
          ),
          value: selectedAccount = selectedExpense,
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
                      Text(
                        e,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {},
        ),
        const SizedBox(
          height: 16.0,
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "Categoria",
          ),
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
          onChanged: (val) {},
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
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: receipt,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.receipt),
            labelText: 'Comprovante',
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
      ],
    );
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
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "De Conta",
          ),
          value: selectedExpense,
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
                      Text(
                        e,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (val) {},
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
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: "Para Conta",
          ),
          value: selectedExpense,
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
          onChanged: (val) {},
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
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.dehaze),
            labelText: 'Descrição',
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
        TextField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.receipt),
            labelText: 'Comprovante',
          ),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
