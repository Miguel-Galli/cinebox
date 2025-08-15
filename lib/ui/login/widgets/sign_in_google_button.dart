// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';

class SignInGoogleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignInGoogleButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(R.assetsImagesGoogleLogoPng),
          ),
          Text(
            'Entrar com o google',
            style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }
}
