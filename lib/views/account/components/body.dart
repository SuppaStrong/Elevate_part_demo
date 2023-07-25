import 'package:elevate_ecommerce/size_config.dart';
import 'package:elevate_ecommerce/views/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';


import 'account_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            ProfilePic(isEditable: true),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            const AccountForm(),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
          ]),
        ),
      ),
    );
  }
}
