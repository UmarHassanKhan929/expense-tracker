import 'package:exptrack/models/transaction.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'So Empty, \nMuch Wow',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 36,
                      ),
                    ),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 250, 224, 255),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 60,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Rs. ${transactions[index].amount?.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          transactions[index].title.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          transactions[index]
                                              .date
                                              .toString()
                                              .split(' ')[0],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              //   children: [
              //     ...(transactions.map((e) =>
              // ))],
            ),
    );
  }
}
