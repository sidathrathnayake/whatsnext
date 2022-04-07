import 'package:flutter/material.dart';
import 'package:mobile/problems/add_problem.dart';
import 'package:mobile/problems/view_problem.dart';

class ProblemMenu extends StatelessWidget {
  const ProblemMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text:"Insert",icon:Image.asset('icons/addProblem.png')),
                Tab(text:"View",icon:Image.asset('icons/viewProblem.png')),
              ],
              indicatorColor:Color(0xff004d4d),
            ),
            backgroundColor: Colors.teal,
            title: const Text('Problem Dashboard'),
          ),
          body: const TabBarView(
            children: [
              AddProblem(),
              ViewProblem(),
            ],
          ),
        ),
      ),
    );
  }
}