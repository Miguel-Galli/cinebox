import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/login/commands/login_with_google_command.dart';
import 'package:cinebox/ui/login/widgets/login_view_model.dart';
import 'package:cinebox/ui/login/widgets/sign_in_google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.assetsImagesBgLoginPng,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            padding: EdgeInsets.only(top: 108),
            child: Column(
              spacing: 48,
              children: [
                Image.asset(R.assetsImagesLogoPng),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                  child: Consumer(
                    builder: (context, ref, child) { 
                      final state = ref.watch(loginWithGoogleCommandProvider);
                      return SignInGoogleButton(                        
                        isLoading: state.isLoading,
                        onPressed: () {
                          final viewModel = ref.read(loginViewModelProvider);
                          viewModel.googleLogin();
                        },
                      ); 
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
