import 'dart:math';
import 'package:expense_tracker_app/screen/Home/Views/mainscreen.dart';
import 'package:expense_tracker_app/screen/add_expense/views/add_expense.dart';
import 'package:expense_tracker_app/screen/stats/stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItemColor=Colors.lightBlue;
  late Color unselectedItemColor=Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: _buildBottomNavigationBarItems(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,MaterialPageRoute(builder: (BuildContext context)=>AddExpense()),
              );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(
            CupertinoIcons.add,
          ),
        ),
      ),
      body: index == 0 ? mainscreen():StatScreen(key: null) ,
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.home,
          color: index == 0 ? selectedItemColor : unselectedItemColor,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.graph_square_fill,
          color: index == 1 ? selectedItemColor : unselectedItemColor,
        ),
        label: 'Stats',
      ),
    ];
  }
}
