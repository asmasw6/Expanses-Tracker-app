import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final datetime = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expanse {
  final DateTime date;
  final String title;
  final String id;
  final double amount;
  final Category category;

  Expanse({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // generate Encryption ID

  String get formattedDate {
    return datetime.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expanse> expenses;

  ExpenseBucket(
    this.category,
    this.expenses,
  );

  ExpenseBucket.forCategory(
    List<Expanse> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where(
              (element) => element.category == category,
            )
            .toList();

  double get totlaExpenses {
    double sum = 0;
    for (var element in expenses) {
      sum += element.amount;
    }
    return sum;
  }
}
