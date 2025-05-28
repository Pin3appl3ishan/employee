import 'package:employee/view/date_time_view.dart';
import 'package:flutter/material.dart';
import 'employee_view.dart';
import 'employee_table_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    EmployeeView(),
    EmployeeTableView(),
    DateTimeView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Lit'),
    BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: 'Table'),
    BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Date'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
