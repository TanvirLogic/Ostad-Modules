import 'package:flutter/material.dart';

class Understand extends StatefulWidget {
  const Understand({super.key});

  @override
  State<Understand> createState() => _UnderstandState();
}

class _UnderstandState extends State<Understand> with TickerProviderStateMixin {

  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(
        'Money Managment',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Earning', icon: Icon(Icons.arrow_upward)),
          Tab(text: 'Expense', icon: Icon(Icons.arrow_downward)),
        ],
      ),
    ),
      body: Column(
        children: [
          Row(
            children: [
              _buildSummaryCard(title: 'Earning', value: 300, color: Colors.green),
              _buildSummaryCard(title: 'Expense', value: 500, color: Colors.red),
              _buildSummaryCard(title: 'Balance', value: 100, color: Colors.blue),
            ],
          ),

          SizedBox(height: 10,),

          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [

                Text('Tanvir'),
                  Text('Ramos'),

                ]),
          )
        ],
      ),
    );
  }
}

Widget _buildSummaryCard({required String title,required double value,required Color color,}){
  return  Expanded(
    child: Card(
      color:  color,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
            Text(value.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
