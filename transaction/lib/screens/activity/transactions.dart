import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'package:transaction/screens/activity/lower_design_activity.dart';
import 'package:transaction/screens/activity/upper_design_activity.dart';
import 'package:transaction/widgets/text_custom.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction>
    with AutomaticKeepAliveClientMixin {
  String _selectedTransaction = 'Transactions';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 241,
                decoration: const BoxDecoration(
                  color: Color(0xFF5b2c6f),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  width: 42,
                                  height: 43,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(51, 0, 16, 57),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 140,
                            child: Align(
                              alignment: Alignment.center,
                              child: TextCustom(
                                text: 'ACTIVIDAD',
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LowerDesignActivity(
                  selectedTransaction: _selectedTransaction,
                  onTransactionSelected: (String name, String avatarUrl,
                      String amount, DateTime date) {},
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: UpperDesignActivity(
              selectedTransaction: _selectedTransaction,
              onTransactionChanged: (String newValue) {
                setState(() {
                  _selectedTransaction = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
