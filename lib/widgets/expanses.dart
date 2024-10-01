import 'package:expenses/models/expanse.dart';
import 'package:expenses/widgets/expenses_list/expanses_list.dart';
import 'package:expenses/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expanse> _registeredExpenses = [
    Expanse(
      title: "Flutter Course",
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expanse(
      title: "Flutter Course",
      amount: 29.9,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanses Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const NewExpanse();
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          Icon(Icons.add),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ExpanesesList(
                expanses: _registeredExpenses,
              ),
            )
          ],
        ),
      ),
    );
  }
}
