import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField extends StatefulWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final int hint;
   OTPField({required this.onEditingComplete,
    super.key,
    required this.controller,
    required this.autoFocus,
    required this.hint,
  });
void Function() onEditingComplete;
  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  // late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    // focusNode = FocusNode();
    // focusNode.addListener(() {
    //   if (!focusNode.hasFocus && widget.controller.text.isEmpty) {
    //     FocusScope.of(context).nextFocus();
    //   }
    // });
  }

  @override
  void dispose() {
    // focusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.w,
      height: 45.h,
      child: TextField(
        autofocus: widget.autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        style: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
              fontSize: 21.sp,
              height: 20.h / 20.h,
            ),
        maxLength: 1,
        cursorWidth: 2.0.w,
        cursorHeight: 20.h,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: widget.controller.text.isNotEmpty,
          fillColor: Colors.blue.withOpacity(0.1),
          focusColor: Colors.lightBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.controller.text.isEmpty
                  ? Colors.grey.withOpacity(0.3)
                  : Colors.blue,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: 21.sp,
                height: 20.h / 20.h,
              ),
          contentPadding:  EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
                // color: Colors.white,
                ),
          ),
        ),
        onChanged: (change) {
          if (change.isNotEmpty && widget.hint < 5) {
            FocusScope.of(context).nextFocus();
            setState(() {});
          } else if (widget.hint > 1 && change.isEmpty) {
            setState(() {});
            FocusScope.of(context).previousFocus();
          } else {
            print("^^^^^^^^^${widget.hint}");
            setState(() {});
            if (widget.hint == 1) {
              FocusScope.of(context).unfocus();
            }
            else
            widget.onEditingComplete();
          }
        },
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }
}
