import 'package:expenses/models/expanse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpanse extends StatefulWidget {
  const NewExpanse({super.key, required this.onAddExpanse});
  final void Function(Expanse expanse) onAddExpanse;

  @override
  State<NewExpanse> createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  final formatter = DateFormat.yMd();
  Category selectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    titleController
        .dispose(); // when exit from page this will be dispose title controller
    amountController
        .dispose(); // when exit from page this will be dispose title controller
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title: "),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("Amount: "),
                    prefix: Text("💰"),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? "No Date Selected"
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 1,
                                DateTime.now().month, DateTime.now().day),
                            lastDate: DateTime.now(),
                          ).then(
                            (value) {
                              if (value != null) {
                                setState(() {
                                  selectedDate = value;
                                });
                              }
                            },
                          );
                        },
                        icon: const Icon(Icons.calendar_month_outlined)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) return;
                    selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final double? enteredAmount =
                      double.tryParse(amountController.text);
                  final bool amountInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  if (titleController.text.trim().isEmpty ||
                      amountInvalid ||
                      selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("⚠️ Invalid Input"),
                        content: const Text(
                            "Please make sure valid title, amount, date and category was entered"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    widget.onAddExpanse(
                      Expanse(
                          title: titleController.text,
                          amount: enteredAmount,
                          date: selectedDate!,
                          category: selectedCategory),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Save Expense",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
