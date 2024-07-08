import 'package:flutter/material.dart';

import '../succes/successbody.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessBody(
          title: "Success",
          successtext: "Congratulation",
          subtitle: "Successfully registerd"),
    );
  }
}
