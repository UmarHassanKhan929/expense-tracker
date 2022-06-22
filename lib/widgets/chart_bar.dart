import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingAmountOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingAmountOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
        ),
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              'Rs. ${spendingAmount.toStringAsFixed(0)}',
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 65, 65, 65),
                    width: 1,
                  ),
                  color: Color.fromARGB(255, 248, 211, 255),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingAmountOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
        const Padding(
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }
}
