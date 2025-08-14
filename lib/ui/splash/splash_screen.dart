import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderMessages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.assetsImagesBgLoginPng,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Center(child: Image.asset(R.assetsImagesLogoPng)),
        ],
      ),
    );
  }
}
