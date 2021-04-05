import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rasel_time/widgets/rasel_appbar.dart';
import 'package:rasel_time/widgets/rasel_drwer.dart';

class RaselHomePage extends StatelessWidget {
  RaselHomePage({Key? key}) : super(key: key);
  final _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    if (_user?.displayName == null) {
      Navigator.pushNamed(context, '/profile');
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
            child: RaselAppbar(),
            preferredSize: Size.fromHeight(70.0),
          ),
          drawer: RaselDrwoer(user: _user!),
          body: Center(
            child: Text(_user!.displayName ??
                'أهلا وسهلا .. يرجى تحديث بيانات الملف الشخصي'),
          )),
    );
  }
}
