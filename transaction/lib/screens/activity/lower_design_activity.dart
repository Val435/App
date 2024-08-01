import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';
import 'package:transaction/screens/activity/transaction_details/transaction_details.dart';

import 'package:transaction/widgets/text_custom.dart';
import 'package:transaction/widgets/transaction_.dart';

class LowerDesignActivity extends StatefulWidget {
  final String selectedTransaction;
  final Function(
    String name,
    String avatarUrl,
    String amount,
    DateTime date,
  ) onTransactionSelected;

  LowerDesignActivity(
      {super.key,
      required this.selectedTransaction,
      required this.onTransactionSelected});

  @override
  State<LowerDesignActivity> createState() => _LowerDesignActivityState();
}

class _LowerDesignActivityState extends State<LowerDesignActivity> {
  List<Transaction> transactions = [
    Transaction(
        name: "Pago en Starbucks",
        date: DateFormat('MMM dd yyyy').parse("Jan 15 2024"),
        amount: "\$10",
        isPending: true,
        avatarUrl: null,
        transactionType: "Credito"),
    Transaction(
        name: "Spotify",
        date: DateFormat('MMM dd yyyy').parse("Feb 01 2024"),
        amount: "\$10",
        isPending: true,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "Zara",
        date: DateFormat('MMM dd yyyy').parse("Mar 10 2024"),
        amount: "\$18.73",
        isPending: false,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "Amazon",
        date: DateFormat('MMM dd yyyy').parse("Apr 05 2024"),
        amount: "\$217",
        isPending: false,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "Gas",
        date: DateFormat('MMM dd yyyy').parse("May 20 2024"),
        amount: "\$40.78",
        isPending: false,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "Netflix",
        date: DateFormat('MMM dd yyyy').parse("Jun 15 2024"),
        amount: "\$50.02",
        isPending: false,
        avatarUrl: null,
        transactionType: "Declinada"),
    Transaction(
        name: "Apple Store",
        date: DateFormat('MMM dd yyyy').parse("Jul 01 2024"),
        amount: "\$20.50",
        isPending: false,
        avatarUrl: null,
        transactionType: "Credito"),
    Transaction(
        name: "HBO",
        date: DateFormat('MMM dd yyyy').parse("Jul 10 2024"),
        amount: "\$175",
        isPending: false,
        avatarUrl: null,
        transactionType: "Declinada"),
    Transaction(
        name: "Siman",
        date: DateFormat('MMM dd yyyy').parse("Jul 15 2024"),
        amount: "\$175",
        isPending: false,
        avatarUrl: null,
        transactionType: "Cancelada"),
    Transaction(
        name: "Walmart",
        date: DateFormat('MMM dd yyyy').parse("Jul 20 2024"),
        amount: "\$85.00",
        isPending: false,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "eBay",
        date: DateFormat('MMM dd yyyy').parse("Jul 25 2024"),
        amount: "\$67.25",
        isPending: false,
        avatarUrl: null,
        transactionType: "Credito"),
    Transaction(
        name: "Cinemax",
        date: DateFormat('MMM dd yyyy').parse("Jul 28 2024"),
        amount: "\$32.00",
        isPending: true,
        avatarUrl: null,
        transactionType: "Debito"),
    Transaction(
        name: "H&M",
        date: DateFormat('MMM dd yyyy').parse("Jan 02 2024"),
        amount: "\$90.50",
        isPending: false,
        avatarUrl: null,
        transactionType: "Credito"),
    Transaction(
        name: "McDonald's",
        date: DateFormat('MMM dd yyyy').parse("Feb 22 2024"),
        amount: "\$15.00",
        isPending: false,
        avatarUrl: null,
        transactionType: "Debito"),
  ];

  String searchText = '';

  void _sortTransactions() {
    transactions.sort((a, b) {
      if (a.isPending && !b.isPending) return -1;
      if (!a.isPending && b.isPending) return 1;
      return a.date.compareTo(b.date);
    });
  }

  List<Widget> _getLowerDesignActivity(
      BuildContext context, String selectedTransaction) {
    _sortTransactions();
    List<Transaction> filteredTransactions = transactions.where((transaction) {
      return transaction.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
        child: Container(
          width: 332.0,
          height: 32.0,
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color(0xFF8EA1D2),
                iconSize: 18,
                onPressed: () {},
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF8EA1D2),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xFF8EA1D2),
                  width: 0.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: RawScrollbar(
            thumbColor: const Color(0xFF7086BF),
            radius: const Radius.circular(10),
            thickness: 3.0,
            thumbVisibility: true,
            trackBorderColor: const Color(0xFF7086BF).withOpacity(0.2),
            trackVisibility: true,
            trackColor: const Color(0xFF7086BF).withOpacity(0.2),
            child: SingleChildScrollView(
              child: Column(
                children: filteredTransactions.map((transaction) {
                  Color amountColor;
                  Color textColor;
                  if (transaction.isPending) {
                    textColor = Colors.black.withOpacity(0.5);
                    switch (transaction.transactionType) {
                      case "Credito":
                        amountColor = const Color(0xFF005ADE).withOpacity(0.5);
                        break;
                      case "Debito":
                        amountColor = const Color(0xFFB2363D).withOpacity(0.5);
                        break;
                      case "Declinada":
                        amountColor = Colors.red.withOpacity(0.5);
                        break;
                      default:
                        amountColor = Colors.red.withOpacity(0.5);
                    }
                  } else {
                    textColor = Colors.black;
                    switch (transaction.transactionType) {
                      case "Credito":
                        amountColor = const Color(0xFF005ADE);
                        break;
                      case "Debito":
                        amountColor = const Color(0xFFB2363D);
                        break;
                      case "Declinada":
                        amountColor = Colors.red;
                        break;
                      default:
                        amountColor = Colors.red;
                    }
                  }

                  return GestureDetector(
                    onTap: () {
                      String formattedDate =
                          DateFormat('MMM dd, yyyy').format(transaction.date);
                      Color amountColor;
                      switch (transaction.transactionType) {
                        case "Credito":
                          amountColor = transaction.isPending
                              ? const Color(0xFF005ADE)
                              : const Color(0xFF005ADE);
                          break;
                        case "Debito":
                          amountColor = transaction.isPending
                              ? const Color(0xFFB2363D)
                              : const Color(0xFFB2363D);
                          break;
                        case "Declinada":
                          amountColor =
                              transaction.isPending ? Colors.red : Colors.red;
                          break;
                        default:
                          amountColor = Colors.red;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetails(
                            name: transaction.name,
                            avatarUrl: transaction.avatarUrl ?? "",
                            amount: transaction.amount,
                            date: formattedDate,
                            amountColor: amountColor,
                            transactionType: transaction.transactionType,
                            isPending: transaction.isPending,
                            isFromFirstList: true,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 0.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.transparent,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: 22.5,
                            backgroundColor: transaction.isPending
                                ? transaction.transactionType == "Credito"
                                    ? const Color(0xFF5d00bf).withOpacity(0.5)
                                    : transaction.transactionType == "Debito"
                                        ? const Color(0xFF5d00bf)
                                            .withOpacity(0.5)
                                        : const Color(0xFF5d00bf)
                                            .withOpacity(0.5)
                                : transaction.transactionType == "Credito"
                                    ? const Color(0xFF5d00bf)
                                    : transaction.transactionType == "Debito"
                                        ? const Color(0xFF5d00bf)
                                        : const Color(0xFF5d00bf),
                            child: transaction.avatarUrl != null
                                ? ClipOval(
                                    child: Container(
                                      width: 15,
                                      height: 19.335,
                                      child: ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                        child: SvgPicture.asset(
                                          transaction.avatarUrl!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : TextCustom(
                                    text: transaction.name[0],
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                          ),
                          const SizedBox(width: 10),
                          TextCustom(
                            text: transaction.name,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: textColor,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (transaction.isPending)
                                      const TextCustom(
                                        text: "Pendiente",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF253765),
                                      )
                                    else if (transaction.transactionType ==
                                        'Declinada')
                                      const TextCustom(
                                        text: "Declinada",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF253765),
                                      )
                                    else if (transaction.transactionType ==
                                        'Cancelada')
                                      const TextCustom(
                                        text: "Cancelada",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF253765),
                                      )
                                    else
                                      TextCustom(
                                        text: DateFormat('MMM dd')
                                            .format(transaction.date),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF253765),
                                      ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextCustom(
                                    text: transaction.amount,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: amountColor,
                                    decoration: transaction.isPending
                                        ? TextDecoration.none
                                        : TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getLowerDesignActivity(context, widget.selectedTransaction),
    );
  }
}
