import 'package:flutter/material.dart';
import 'screen/Home/Views/HomeScreen.dart';
class expenseview extends StatelessWidget {
  const expenseview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade50,
          onBackground: Colors.black,
          primary:Colors.purple,
            secondary: Colors.greenAccent,
          tertiary: Colors.blueAccent,
            outline: Colors.black,
        )
      ),
      home: const HomeScreen(),
    );
  }
}
