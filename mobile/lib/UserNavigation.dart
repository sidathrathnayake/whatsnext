import 'package:flutter/material.dart';
import 'package:mobile/categoryList.dart';
import 'package:mobile/mainMenu.dart';
import 'package:mobile/questionsList.dart';
import 'package:mobile/services/service_questions.dart';
import 'package:mobile/services/service_user.dart';
import 'package:mobile/signin.dart';
import 'package:mobile/user_feeds/post_page.dart';
import 'package:mobile/user_questions/user_select_category.dart';
import 'package:mobile/user_questions/user_view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserNavigation extends StatelessWidget {
  var userEmail;
  UserNavigation({this.userEmail,Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   setState(() {
  //     this.userEmail = widget.email;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final paddings = EdgeInsets.symmetric(horizontal: 16);
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Material(
        color: Colors.teal,
        child: ListView(
          padding: paddings,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: size.height / 5,
                width: size.width,
                child: Image.asset('images/splash.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.account_circle,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'User Posts',
              icon: Icons.post_add,
              onClicked: () => selectedItem(context, 2),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 24,
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Sign Out',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserSelectCategory(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserViewProfile(userEmail: userEmail,),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PostPage(),
        ));
        break;
      case 3:
        User().signout();
        break;
    }
  }
}
