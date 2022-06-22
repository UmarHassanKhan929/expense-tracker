import 'package:exptrack/models/transaction.dart';
import 'package:exptrack/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date?.day == weekDay.day &&
            recentTransactions[i].date?.month == weekDay.month &&
            recentTransactions[i].date?.year == weekDay.year) {
          totalSum += recentTransactions[i].amount!;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpendings =>
      groupedTransactionValues.fold(0.0, (previousValue, currValue) {
        return previousValue + (currValue['amount'] as double);
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                (data['day'] as String),
                (data['amount'] as double),
                totalSpendings == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpendings),
          );
        }).toList(),
      ),
    );
  }
}
