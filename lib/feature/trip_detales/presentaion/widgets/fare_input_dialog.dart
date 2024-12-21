import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_driver/core/Utils/colors/colors.dart';
import 'package:taxi_go_driver/core/Utils/text_styles/styles.dart';
import 'package:taxi_go_driver/feature/trip_detales/controllers/pay_after_ride_controller/pay_after_ride_cubit.dart';
import 'package:taxi_go_driver/feature/trip_detales/presentaion/widgets/custom_snack_bar.dart';

class FareInputDialog {
  static void showFareInputDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // يسمح بتوسيع الـ Dialog لتجنب لوحة المفاتيح
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // تجنب لوحة المفاتيح
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: const FareInputForm(),
      ),
    );
  }
}

class FareInputForm extends StatefulWidget {
  const FareInputForm({Key? key}) : super(key: key);

  @override
  State<FareInputForm> createState() => _FareInputFormState();
}

class _FareInputFormState extends State<FareInputForm> {
  final TextEditingController _fareController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fareController.dispose();
    super.dispose();
  }

  void _submitFare() {
    if (_formKey.currentState!.validate()) {
      final fare = double.parse(_fareController.text);
      Navigator.of(context).pop();
      CustomSnackBar(
        textStyle: AppStyles.text14Size500Wight,
        message:
            '${AppLocalizations.of(context)!.the_fare_has_been_entered}: $fare ${AppLocalizations.of(context)!.currency}',
        backgroundColor: AppColors.kComplete,
      ).show(context);

      BlocProvider.of<PayAfterRideCubit>(context).confirmRate(context, fare);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'أدخل قيمة الأجرة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _fareController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'الأجرة',
              hintText: 'أدخل قيمة الأجرة',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'من فضلك أدخل قيمة الأجرة';
              }
              if (double.tryParse(value) == null) {
                return 'من فضلك أدخل رقمًا صحيحًا';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<PayAfterRideCubit, PayAfterRideState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: _submitFare,
                  child: const Text('إرسال'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
