import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rasel_time/pages/rasel_chats.dart';
import 'package:rasel_time/pages/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rasel_time/pages/user_profile_page.dart';

import 'pages/rasel_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'راسل تايم',
      routes: {
        // '/': (context) => SiشgnInScreen(),
        '/profile': (context) => UserProfilePage(),
        '/raselhome': (context) => RaselHomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.white,
      ),
      home: SignInScreen(),
      //  home: App(),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return RaselChats();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 120,
      child: Center(
        child: Text('جار التحميل'),
      ),
    );
  }
}

class TestFirebase extends StatelessWidget {
  TestFirebase({Key? key}) : super(key: key);
  final FirebaseFirestore _fstore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference _test = _fstore.collection("test");

    Future<void> addTest() {
      return _test
          .add({'name': 'Mohamed', 'phone': '900'})
          .then((value) => print('test data added!'))
          .onError((error, stackTrace) => 'There is some wrror happens');
    }

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DocumentSnapshot>(
        future: _test.doc("XkRWQnYjvozw0U9frvOm").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('عذرا حدث خطأ بالنظام');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic>? data = snapshot.data!.data();
            return Text("Name: ${data!['name']},Phone${data['phone']}");
          }
          return Text('جار التحميل...');
        },
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('error'),
      ),
    );
  }
}
