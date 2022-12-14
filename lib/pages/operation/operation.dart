import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:teste/pages/homescreen/homescreen.dart';
import 'package:teste/pages/operation/operation_controller.dart';
import 'package:teste/pages/operation/operation_model.dart';
import 'package:teste/widgets/default_button/default_button.dart';

class AddIncome extends StatefulWidget {
  final int tabController;

  const AddIncome({Key? key, required this.tabController}) : super(key: key);

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> with TickerProviderStateMixin {
  List<String> categories = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];
  String? selecetedcCategorie = 'Item 1';
  bool received = false;
  TextEditingController dateController = TextEditingController();
  TextEditingController cashValue = TextEditingController();
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
          bottom: TabBar(
            controller: _selectedController,
            indicatorColor: Colors.white,
            tabs: const <Widget>[
              Tab(
                text: "RECEITA",
              ),
              Tab(
                text: "DESPESA",
              ),
              Tab(
                text: "TRANSAÇÃO",
              ),
            ],
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
                      style: const TextStyle(fontSize: 40),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SwitchListTile(
                      title: Text('Recebido',
                          style: Theme.of(context).textTheme.bodyText1),
                      secondary: Icon(Icons.monetization_on_outlined,
                          color: Theme.of(context).colorScheme.tertiary),
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      inactiveThumbColor: Colors.grey,
                      value: received,
                      onChanged: (bool value) {
                        setState(() {
                          received = value;
                        });
                      }, // trailing:,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.dehaze),
                        hintText: 'Descrição',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        hintText: 'Data',
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
                    const SizedBox(
                      height: 16.0,
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.label_important),
                      ),
                      value: selecetedcCategorie,
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
              DefaultButton(
                  title: 'Salvar',
                  func: () {
                    if (widget.tabController == 0) {
                      selectedOperation = 'income';
                    } else if (widget.tabController == 1) {
                      selectedOperation = 'expense';
                    }
                    OperationModel newoperation = OperationModel(
                      date: dateModel,
                      operation: selectedOperation,
                      operationValue: cashValue.text,
                    );
                    controller.performOperation(newoperation);
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen(),
                    ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
