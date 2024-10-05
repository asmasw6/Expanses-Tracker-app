import 'package:expenses/chart/chart.dart';
import 'package:expenses/models/expanse.dart';
import 'package:expenses/theme/theme_provider.dart';
import 'package:expenses/widgets/expenses_list/expanses_list.dart';
import 'package:expenses/widgets/new_expanse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Expanses extends StatefulWidget {
  const Expanses(
    this.isLight, {
    super.key,
  });
  final bool isLight;

  @override
  State<Expanses> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<Expanse> _registeredExpenses = [];

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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanses Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NewExpanse(
                    onAddExpanse: addExpanse,
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: Icon(!widget.isLight ? Icons.dark_mode : Icons.light_mode),
            onPressed:
                Provider.of<ThemeProvider>(context, listen: false).changeMode,
          ),
        ],
      ),
      body: Center(
        child: width < 600
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _registeredExpenses.isEmpty
                        ? Text("Add Epenses Card",
                            style: Theme.of(context).textTheme.titleMedium)
                        : ExpanesesList(
                            onRemoveExpanse: removeExpanse,
                            expanses: _registeredExpenses,
                          ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _registeredExpenses.isEmpty
                        ? const Text("Add Epenses Card",
                            )
                        : ExpanesesList(
                            onRemoveExpanse: removeExpanse,
                            expanses: _registeredExpenses,
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
