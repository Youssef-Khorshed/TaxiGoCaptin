import 'package:flutter/material.dart';

class WalletData extends StatefulWidget {
  const WalletData({
    super.key,
    required this.title,
    required this.data,
  });
  final String title;
  final String data;
  @override
  State<WalletData> createState() => _WalletDataState();
}

class _WalletDataState extends State<WalletData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 100,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0),
          blurRadius: 2.0,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " ${widget.data}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
