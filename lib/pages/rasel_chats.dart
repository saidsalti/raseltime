import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RaselChats extends StatelessWidget {
  RaselChats({Key? key}) : super(key: key);
  final CollectionReference _test =
      FirebaseFirestore.instance.collection('test');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _test.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot>? snapshot) {
            _test.snapshots(includeMetadataChanges: true);
            if (snapshot!.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return new ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document.data()!['name'] ?? ''),
                  subtitle: new Text((document.data()!['phone']) ?? ''),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
