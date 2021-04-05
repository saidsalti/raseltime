import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RaselDrwoer extends StatelessWidget {
  final User user;
  const RaselDrwoer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).accentColor;

    final titleTextStyley = TextStyle(color: titleColor);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Text(
                  'راسل تايم',
                  style: titleTextStyley,
                ),
                Text(
                  'أهلا وسهلا ${user.displayName}',
                  style: titleTextStyley,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الصفحة الرئيسية'),
            onTap: () {
              navTo(context, '/raselhome');
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('الملف الشخصي'),
            onTap: () {
              navTo(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('العثور عن أصدقاء'),
            onTap: () {
              navTo(context, '/findfriends');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('حول التطبيق'),
            onTap: () {
              navTo(context, '/about');
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'جميع الحقوق محفوظة لدى ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'مدرسة صحم للبنات ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                DateTime.now().year.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )
        ],
      ),
    );
  }

  void navTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
