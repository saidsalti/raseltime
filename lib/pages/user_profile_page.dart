import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rasel_time/pages/rasel_home_page.dart';
import 'package:rasel_time/widgets/rasel_appbar.dart';
import 'package:rasel_time/widgets/rasel_drwer.dart';

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late User? _user;

  File? _image;
  final picker = ImagePicker();
  late TextEditingController displayName;
  TextEditingController phone = TextEditingController();

  Future getImage() async {
    print('get image');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser;
    displayName = TextEditingController(text: _user!.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          child: RaselAppbar(),
          preferredSize: Size.fromHeight(50.0),
        ),
        drawer: RaselDrwoer(user: _user!),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text('أهلا وسهلا : ${_user!.email}'),
              ),
              Text(
                'يرجى تسجيل بعض البيانات قبل البدء باستخدام راسل',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                child: Form(
                    child: Container(
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 200,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ]),
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.supervised_user_circle),
                        title: TextFormField(
                          controller: displayName,
                          decoration: InputDecoration(labelText: 'اسم الظهور'),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_android),
                        title: TextFormField(
                          controller: phone,
                          decoration: InputDecoration(labelText: 'رقم الهاتف'),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await _user!
                                .updateProfile(displayName: displayName.text);
                            print('saved data');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RaselHomePage(),
                              ),
                            );
                          },
                          child: Text('حفظ'))
                    ],
                  ),
                )),
              ),
              Center(
                child: _image == null
                    ? Text('لم يتم تحديد الصورة.')
                    : Image.file(_image!),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
