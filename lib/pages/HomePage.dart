import 'package:pocash_app/other/route.dart';
import 'package:pocash_app/helper/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalIncome = 0;
  int totalExpense = 0;

  @override
  void initState() {
    super.initState();
    _fetchTotalIncomeAndExpense();
  }

  Future<void> _fetchTotalIncomeAndExpense() async {
    // Initialize your DBHelper
    final dbHelper = DbHelper();

    // Fetch the total income and total expense
    final income = await dbHelper.getTotalIncome();
    final expense = await dbHelper.getTotalExpense();

    setState(() {
      totalIncome = income;
      totalExpense = expense;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchTotalIncomeAndExpense(); // Refresh data when navigating back
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("POCASH APP"),
        leading: Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/images/bear.gif',
              width: 50.0,
              height: 50.0,
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Center(
            child: Column(
          children: [
            Text(
                "Rangkuman Bulan Ini",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.0, // Lebar Container
                    height: 32.0,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                          Text(
                          "PEMASUKAN",
                          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold), 
                          // Atur warna teks
                        ),
                        Text(
                          "Rp $totalIncome",
                          style: TextStyle(color: Colors.yellow), // Atur warna teks
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120.0, // Lebar Container
                    height: 32.0,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                          Text(
                          "PENGELUARAN",
                          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold), // Atur warna teks
                        ),
                        Text(
                          "Rp $totalExpense",
                          style: TextStyle(color: Colors.brown), // Atur warna teks
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 16),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 210,
              child: LineChart(LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.black, width: 1)),
                  minX: 0,
                  maxX: 7,
                  minY: 0,
                  maxY: 1000,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 600),
                        FlSpot(1, 150),
                        FlSpot(2, 450),
                        FlSpot(3, 300),
                        FlSpot(4, 600),
                        FlSpot(5, 500),
                        FlSpot(6, 800),
                        FlSpot(7, 400),
                      ],
                      isCurved: true,
                      color: Colors.brown,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 400),
                        FlSpot(1, 600),
                        FlSpot(2, 100),
                        FlSpot(3, 700),
                        FlSpot(4, 200),
                        FlSpot(5, 600),
                        FlSpot(6, 100),
                        FlSpot(7, 800),
                      ],
                      isCurved: true,
                      color: Colors.yellow,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ])),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavButton(
                        imagePath: 'assets/images/pemasukan.png',
                        label: "Tambah Pemasukan",
                        onTap: () {
                          Navigator.pushNamed(context, addIncomeRoute);
                        }),
                    NavButton(
                        imagePath: 'assets/images/money.png',
                        label: "Tambah Pengeluaran",
                        onTap: () {
                          Navigator.pushNamed(context, addExpenseRoute);
                        }),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavButton(
                        imagePath: 'assets/images/detail.png',
                        label: "Detail Cash Flow",
                        onTap: () {
                          Navigator.pushNamed(context, detailCashFlowRoute);
                        }),
                    NavButton(
                        imagePath: 'assets/images/tentang.png',
                        label: "About App",
                        onTap: () {
                          Navigator.pushNamed(context, '/about');
                        }),
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const NavButton(
      {required this.imagePath, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
          ),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}
