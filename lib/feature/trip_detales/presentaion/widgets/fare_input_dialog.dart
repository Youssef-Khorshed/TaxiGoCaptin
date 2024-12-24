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
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
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
          Text(
            AppLocalizations.of(context)!.enter_the_fare_value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _fareController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.fare,
              hintText: AppLocalizations.of(context)!.enter_the_fare_value,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!
                    .please_enter_the_fare_value;
              }
              if (double.tryParse(value) == null) {
                return AppLocalizations.of(context)!
                    .please_enter_a_valid_number;
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: BlocBuilder<PayAfterRideCubit, PayAfterRideState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kblue),
                    onPressed: _submitFare,
                    child: Text(
                      AppLocalizations.of(context)!.send,
                      style: AppStyles.text14Size500WightW,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
