import 'package:flutter/material.dart';

class PlayerSplash extends StatelessWidget {
  const PlayerSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/kilian.png',
        width: 291,
        height: 339,
        fit: BoxFit.cover,
      ),
    );
  }
}
