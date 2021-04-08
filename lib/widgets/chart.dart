import 'package:flutter/material.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transection> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get grouptransactionsvalue {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekday));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: grouptransactionsvalue.map((e) {
            return Text('${e['day']} : ${e['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}