import 'package:flutter/material.dart';
import 'package:taxi_go_driver/feature/RequestDriver/presentaion/widgets/ListTile.dart';
import '../../../core/Utils/routes/routes.dart';
import '../../APP/custom_widgets/custom_Button.dart';
import '../../earnings_dashboard/presentaion/widgets/drawer_list.dart';


class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(),
        drawer: const Drawer(
          child: DrawerList(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("* complet other field",
                      style: TextStyle(color: Colors.red)),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 54, 16, 206),
                    child: Text(
                      "1/9",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return const CustomListTile(
                        title: "Profile Photo",
                      );
                    }),
              ),
              CustomButton(

               onPressed: () {    Navigator.pushNamed(context, Routes.homeRoute);}, text:  "Next",),
            ],
          ),
        ));
  }

  AppBar CustomAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        "My Document",
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }
}
