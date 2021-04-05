// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:rasel_time/models/chatUsersModel.dart';
// import 'package:rasel_time/widgets/conversationList.dart';

// class InviteUserPage extends StatefulWidget {
//   InviteUserPage({Key? key}) : super(key: key);

//   @override
//   _InviteUserPageState createState() => _InviteUserPageState();
// }

// class _InviteUserPageState extends State<InviteUserPage> {
//   final CollectionReference _users =
//       FirebaseFirestore.instance.collection("user_profile");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.only(left: 16, right: 16, top: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       "Conversations",
//                       style:
//                           TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
//                       height: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.pink[50],
//                       ),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.add,
//                             color: Colors.pink,
//                             size: 20,
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             "Add New",
//                             style: TextStyle(
//                                 fontSize: 14, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 16, left: 16, right: 16),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   hintStyle: TextStyle(color: Colors.grey.shade600),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.grey.shade600,
//                     size: 20,
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   contentPadding: EdgeInsets.all(8),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: BorderSide(color: Colors.grey.shade100)),
//                 ),
//               ),
//             ),
//             StreamBuilder<QuerySnapshot>(
//               stream: _test.snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot>? snapshot) {
//                 _test.snapshots(includeMetadataChanges: true);
//                 if (snapshot!.hasError) {
//                   return Text('Something went wrong');
//                 }

//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Text("Loading");
//                 }
//                 return new ListView(
//                   shrinkWrap: true,
//                   padding: EdgeInsets.only(top: 16),
//                   physics: NeverScrollableScrollPhysics(),
//                   children:
//                       snapshot.data!.docs.map((DocumentSnapshot document) {
//                     return ConversationList(
//                       name: document.data()!['name'] ?? '',
//                       messageText: chatUsers[index].messageText,
//                       imageUrl: chatUsers[index].imageURL,
//                       time: chatUsers[index].time,
//                       isMessageRead: (index == 0 || index == 3) ? true : false,
//                     );
//                     // return new ListTile(
//                     //   title: new Text(document.data()!['name'] ?? ''),
//                     //   subtitle: new Text((document.data()!['phone']) ?? ''),
//                     // );
//                   }).toList(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
