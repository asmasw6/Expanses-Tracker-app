
import 'package:expenses/models/expanse.dart';
import 'package:flutter/material.dart';

class ExpanseItem extends StatelessWidget {
  const ExpanseItem({
    super.key,
    required this.expanse,
  });

  final Expanse expanse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expanse.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "💰 ${expanse.amount.toStringAsFixed(2)}",style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expanse.category], color: Theme.of(context).iconTheme.color),
                      const SizedBox(width: 4),
                      Text(expanse.formattedDate),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
