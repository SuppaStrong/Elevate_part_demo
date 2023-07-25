import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/body.dart';

class MyAccountScreen extends StatelessWidget {

  const MyAccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("My Account", style: TextStyle(fontSize: 18)),
      ),
      body: const Body(),
    );
  }
}
