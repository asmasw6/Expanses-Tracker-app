import 'package:expenses/models/expanse.dart';
import 'package:expenses/widgets/expenses_list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpanesesList extends StatelessWidget {
  const ExpanesesList({
    super.key,
    required this.expanses,
  });

  final List<Expanse> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) {
        return ExpanseItem(
          expanse: expanses[index],
        );
      },
    );
  }
}
