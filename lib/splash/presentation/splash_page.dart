import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: Center(
          child: FutureBuilder(
            future: Future.delayed(
              const Duration(milliseconds: 100),
              () => 1.0,
            ),
            builder: (context, snapshot) {
              final opacity = snapshot.data;
              return AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: opacity ?? 0.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    child: Text('This is the splash page'),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
