import 'package:expenses/models/expanse.dart';
import 'package:expenses/widgets/expenses_list/expanses_item.dart';
import 'package:flutter/material.dart';

class ExpanesesList extends StatelessWidget {
  const ExpanesesList({
    super.key,
    required this.expanses,
    required this.onRemoveExpanse,
  });

  final List<Expanse> expanses;
  final void Function(Expanse expanse) onRemoveExpanse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.85),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          key: ValueKey(expanses[index]),
          onDismissed: (direction) => onRemoveExpanse(expanses[index]),
          child: ExpanseItem(
            expanse: expanses[index],
          ),
        );
      },
    );
  }
}
