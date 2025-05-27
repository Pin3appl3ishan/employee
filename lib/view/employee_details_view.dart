import 'package:employee/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsView extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        employee.avatar.isNotEmpty
                            ? NetworkImage(employee.avatar)
                            : null,
                    child:
                        employee.avatar.isEmpty
                            ? Icon(Icons.person, size: 50)
                            : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    employee.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    employee.role,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(employee.email, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Text(
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(employee.phone, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
