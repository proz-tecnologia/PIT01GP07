import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:teste/pages/my_operations/operation_item.dart';

import 'my_operations_controller.dart';

class MyOperations extends StatefulWidget {
  final String operation;
  final String tabTitle;
  const MyOperations({
    Key? key,
    required this.operation,
    required this.tabTitle,
  }) : super(key: key);

  @override
  State<MyOperations> createState() => _MyOperationsState();
}

class _MyOperationsState extends State<MyOperations> {
  MyOperationsController controller = MyOperationsController();

  String formatDate(Timestamp timestamp) {
    final date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
    final formatedDate = DateFormat('dd/MM/yyyy').format(date);
    return formatedDate;
  }

  @override
  void initState() {
    super.initState();
    controller.getOperationsList(widget.operation);
  }

  @override
  void dispose() {
    super.dispose();
    controller.operations.dispose();
    controller.state.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(widget.tabTitle),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.operations,
        builder: (context, value, child) {
          return ListView(
            children: [
              for (int i = 0; i < value.length; i++)
                OperationItem(
                    description: value[i]['description'].toString(),
                    date: formatDate(value[i]['date']),
                    cashvalue: value[i]['cashvalue'].toString(),
                    categorie: value[i]['categorie'].toString(),
                    account: value[i]['account'].toString())
            ],
          );
        },
      ),
    );
  }
}
