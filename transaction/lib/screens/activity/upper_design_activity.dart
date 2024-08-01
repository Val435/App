import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:transaction/widgets/text_custom.dart';

class UpperDesignActivity extends StatefulWidget {
  final String selectedTransaction;
  final ValueChanged<String> onTransactionChanged;

  UpperDesignActivity({
    Key? key,
    required this.selectedTransaction,
    required this.onTransactionChanged,
  }) : super(key: key);

  @override
  _UpperDesignActivityState createState() => _UpperDesignActivityState();
}

class _UpperDesignActivityState extends State<UpperDesignActivity> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    TextCustom(
                      text: 'TRANSACCIONES ',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextCustom(
                          text: 'Balance ',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.circle,
                          size: 4,
                          color: Colors.white,
                        ),
                        SizedBox(width: 6),
                        TextCustom(
                          text: ' USD  ',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    TextCustom(
                      text: '\$893.09',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
