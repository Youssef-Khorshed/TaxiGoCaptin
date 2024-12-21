import 'package:flutter/material.dart';

class CostumeButton extends StatefulWidget {
  const CostumeButton({
    super.key,
    required this.color,
    required this.text,
    this.textColor,
    this.borderColor,
  });
  final Color color;
  final String text;
  final Color? textColor;
  final Color? borderColor;

  @override
  State<CostumeButton> createState() => _costume_bottunState();
}

class _costume_bottunState extends State<CostumeButton> {
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(widget.color),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: widget.borderColor ?? Colors.white),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        height: 60,
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: widget.textColor ?? Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
