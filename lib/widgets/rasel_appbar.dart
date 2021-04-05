import 'package:flutter/material.dart';

class RaselAppbar extends StatelessWidget {
  const RaselAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        child: Center(
          child: Text('تطبيق راسل تايم'),
        ),
      ),
    );
  }
}
