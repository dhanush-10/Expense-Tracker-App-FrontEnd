import 'package:expense_tracker_app/screen/stats/charts.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          children: [
           const  Text(
              "Transactions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height:  MediaQuery.of(context).size.width/4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),

                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(12,20,12,12),
                  child: MyChart(),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
