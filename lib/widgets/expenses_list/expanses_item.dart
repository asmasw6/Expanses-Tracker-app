import 'dart:math';

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
            children: [
              Text(
                expanse.title,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "💰 ${expanse.amount.toStringAsFixed(2)}",
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expanse.category]),
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
