import 'package:expenses/chart/chart.dart';
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

  void addExpanse(Expanse expanse) {
    setState(() {
      _registeredExpenses.add(expanse);
    });

  }

  void removeExpanse(Expanse expanse) {
    setState(() {
      _registeredExpenses.remove(expanse);
    });
  }

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
                  return  NewExpanse(onAddExpanse: addExpanse ,);
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: ExpanesesList(
                onRemoveExpanse: removeExpanse,
                expanses: _registeredExpenses,

              ),
            )
          ],
        ),
      ),
    );
  }
}
