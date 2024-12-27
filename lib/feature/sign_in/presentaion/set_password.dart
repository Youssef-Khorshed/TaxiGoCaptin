import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/sign_in/presentaion/widgets/set_password_body.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SetPasswordBody(),
            ),
          ],
        ),
      ),
    );
  }
}
