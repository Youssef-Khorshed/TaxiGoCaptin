import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_driver/feature/payment/presentaion/widgets/rounded_botton.dart';
import '../../../../core/Utils/colors/colors.dart';
import 'app_dialogs.dart';

class SelectPaymentWidget extends StatefulWidget {
  final String initialSelectedMethod;

  const SelectPaymentWidget({
    super.key,
    this.initialSelectedMethod = 'zain',
  });

  @override
  State<SelectPaymentWidget> createState() => _SelectPaymentWidgetState();
}

class _SelectPaymentWidgetState extends State<SelectPaymentWidget> {
  late String _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initialSelectedMethod;
  }

  void _updatePaymentMethod(String? method) {
    if (method != null) {
      setState(() {
        _selectedMethod = method;
      });
    }
  }

  Widget _buildPaymentMethodTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.kblue, width: 1.5),
      ),
      child: RadioListTile<String>(
        value: 'zain',
        activeColor: AppColors.kblue,
        groupValue: _selectedMethod,
        onChanged: _updatePaymentMethod,
        title: Row(
          children: [
            Image.asset(
              'assets/images/Payment.png',
              height: 40.h,
            ),
            const SizedBox(width: 8),
            const Text('Zain Pay'),
          ],
        ),
      ),
    );
  }

  void _handleNextButton() {
    Navigator.pop(context);
    AppDialogs.showAddMoneyModal(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodTile(),
          SizedBox(height: mediaQuery.height / 11),
          RoundedButton(
            width: double.infinity,
            backgroundColor: AppColors.kblue,
            textColor: AppColors.kWhite,
            text: 'Next',
            onPressed: _handleNextButton,
          ),
        ],
      ),
    );
  }
}
