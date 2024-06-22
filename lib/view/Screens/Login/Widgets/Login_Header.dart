import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts_String.dart';

class Login_header extends StatelessWidget {
  const Login_header({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? RImages.darkAppLogo : RImages.LightAppLogo),
        ),
        const SizedBox(height: RSizes.lg),
        Text(RTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: RSizes.lg),
        Text(RTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
