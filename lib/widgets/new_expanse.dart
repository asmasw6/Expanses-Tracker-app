import 'package:flutter/material.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key});

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final title = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    title
        .dispose(); // when exit from page this will be dispose title controller
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: title,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title: ")),
          )
        ],
      ),
    );
  }
}
