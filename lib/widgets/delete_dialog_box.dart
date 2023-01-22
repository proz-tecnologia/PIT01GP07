import 'package:flutter/material.dart';

class DeleteDialogBox extends StatefulWidget {
  final String title, descriptions;

  const DeleteDialogBox(
      {Key? key,
        required this.title,
        required this.descriptions,
      })
      : super(key: key);

  @override
  DeleteDialogBoxState createState() => DeleteDialogBoxState();
}

class DeleteDialogBoxState extends State<DeleteDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Sim',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Não',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
