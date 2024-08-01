import 'package:flutter/material.dart';

class Transaction {
  final String name;
  final DateTime date;
  final String amount;
  final bool isPending;
  final String? avatarUrl;
  final String transactionType;
   final Color? amountColor;
  

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.isPending,
    this.avatarUrl,
    required this.transactionType,
    this.amountColor,
    
  });
}