import 'package:flutter/material.dart';

import 'Widget/add_water_button.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int currentInTake = 0;
  final int goal = 5000;

  void waterAdd(int amount){

    setState(() {
      currentInTake=(currentInTake+amount).clamp(0, goal);
    });

  }

  void reset(){
    setState(() {
      currentInTake=0;
    });
  }


  @override
  Widget build(BuildContext context) {
    double progress = (currentInTake/goal).clamp(0, 1);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          'Water Tracker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(80),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.2))],
              ),
              child: Column(
                children: [
                  Text(
                    "Today's in Tanks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "${currentInTake} LTR",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ), // First Container to Show total Amount
            SizedBox(height: 30),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.blue,
                    strokeWidth: 10,
                    value: progress, // 0 -> 0% || 0.2->20%
                  ),
                ),
                Text(
                  '${(progress*100).toInt()}%',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
              runSpacing: -25,
              children: [
                AddWaterButton(
                  icon: Icons.water_drop,
                  onClick: () => waterAdd(200),
                  amount: 200,
                ),
                AddWaterButton(
                  icon: Icons.water_drop,
                  onClick: () => waterAdd(500),
                  amount: 500,
                ),
                AddWaterButton(
                  icon: Icons.water_drop,
                  onClick: () => waterAdd(1000),
                  amount: 1000,
                ),
                AddWaterButton(
                  icon: Icons.water_drop,
                  onClick: () => reset(),
                  amount: 0,
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }
}
