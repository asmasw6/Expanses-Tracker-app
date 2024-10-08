import 'package:expenses/chart/chart_bar.dart';
import 'package:expenses/models/expanse.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expanse> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
    ];
  }

  get maxTotalExpense {
    double maxTotalExpense = 0;
    for (var element in buckets) {
      if (element.totlaExpenses > maxTotalExpense) {
        maxTotalExpense = element.totlaExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: constraints.maxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withAlpha((0.3 * 255).toInt()),
              Theme.of(context).colorScheme.primary.withAlpha((0 * 255).toInt()),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final element in buckets)
                    ChartBar(
                      fill: element.totlaExpenses == 0
                          ? 0
                          : element.totlaExpenses / maxTotalExpense,
                    ),
                ],
              ),
            ),
            constraints.minHeight < 200
                ? Container()
                : const SizedBox(
                    height: 12,
                  ),
            constraints.minHeight < 200
                ? Container()
                : Row(
                    children: buckets
                        .map(
                          (e) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                categoryIcons[e.category],
                                color: isDarkMode
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha((0.7 * 255).toInt()),
                              ),
                            ),
                          ),
                        )
                        .toList(), // Convert to List<Widget>
                  )
          ],
        ),
      ),
    );
  }
}
