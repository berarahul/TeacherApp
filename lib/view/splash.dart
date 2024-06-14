import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/components/internet_Exceptions_Widget.dart';
import 'Screens/constant/Custom_Loading_widgets.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoadingWidget();
  }
}
