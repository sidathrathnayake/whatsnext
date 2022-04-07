import 'package:flutter/material.dart';
import 'package:mobile/categoryList.dart';
import 'package:mobile/mainMenu.dart';
import 'package:mobile/questionsList.dart';
import 'package:mobile/services/service_questions.dart';
import 'package:mobile/services/service_user.dart';
import 'package:mobile/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NavigationalDrawer extends StatelessWidget {
  const NavigationalDrawer({Key? key}) : super(key: key);

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
              text: 'Categories',
              icon: Icons.category,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Questions',
              icon: Icons.question_answer,
              onClicked: () => selectedItem(context, 2),
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Bill Payments',
              icon: Icons.payment,
              onClicked: () => selectedItem(context, 3),
            ),
            SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Cheque Services',
              icon: Icons.receipt_long_sharp,
              onClicked: () => selectedItem(context, 4),
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
              onClicked: () => selectedItem(context, 7),
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
          builder: (context) => MainMenu(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryList(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuestionsList(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuestionsList(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuestionsList(),
        ));
        break;
      case 5:
        User().signout();
        break;
    }
  }
}
