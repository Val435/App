import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction/helpers/animation_route.dart';
import 'package:transaction/screens/activity/transactions.dart';
import 'package:transaction/widgets/text_custom.dart';

class TransactionDetails extends StatefulWidget {
  final String name;
  final String avatarUrl;
  final String phoneNumber;
  final String amount;
  final String date;
  final Color amountColor;
  final String transactionType;
  final bool isPending;
  final bool isFromFirstList;

  const TransactionDetails({
    Key? key,
    required this.name,
    required this.avatarUrl,
    this.phoneNumber = '',
    this.amount = '',
    this.date = '',
    required this.amountColor,
    required this.transactionType,
    required this.isPending,
    required this.isFromFirstList,
  }) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
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
                                onTap: () => {
                                  Navigator.pop(context),
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      routeSlide(page: const Transaction()),
                                      (route) => false)
                                },
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
                              const SizedBox(
                                width: 14,
                              ),
                              const TextCustom(
                                text: 'Detalles Transacciones',
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 38),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextCustom(
                          text: 'Tarjeta',
                          fontSize: 16,
                          color: Color(0xFF253765),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(width: 5),
                        TextCustom(
                          text: '2837',
                          fontSize: 16,
                          color: Color(0xFF253765),
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    TextCustom(
                      text: widget.amount,
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      color: widget.amountColor,
                    ),
                    TextCustom(
                      text: widget.date,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8EA1D2),
                    ),
                    if (widget.isPending ||
                        ['Declinada', 'Cancelada', 'Credito', 'Debito']
                            .contains(widget.transactionType))
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: 87,
                        height: 31.0,
                        decoration: BoxDecoration(
                          color: widget.isPending
                              ? const Color(0xFF919AB3)
                              : widget.amountColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: TextCustom(
                            text: widget.isPending
                                ? 'Pendiente'
                                : capitalizeFirstLetter(widget.transactionType),
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  height: 40,
                  width: 351,
                  decoration: BoxDecoration(
                    color: const Color(0xFFf3e1ff),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Transaction()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: const Color(0xFF5b2c6f),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Center(
                      child: TextCustom(
                        text: 'Ok',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 37),
            ],
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 57,
                    height: 57,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                      ),
                    ),
                    child: ClipOval(
                      child: Container(
                        width: 57,
                        height: 57,
                        color: Colors.transparent,
                        child: Center(
                          child: widget.avatarUrl.isNotEmpty
                              ? ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                  child: SvgPicture.asset(
                                    widget.avatarUrl,
                                    width: 15,
                                    height: 19.335,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : TextCustom(
                                  text: widget.name.isNotEmpty
                                      ? widget.name[0]
                                      : '',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 8),
                Center(
                  child: TextCustom(
                    text: widget.name,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
