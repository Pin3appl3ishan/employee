import 'package:flutter/material.dart';
import 'package:employee/state/employee_state.dart';

class EmployeeTableView extends StatefulWidget {
  const EmployeeTableView({super.key});

  @override
  State<EmployeeTableView> createState() => _EmployeeTableView();
}

class _EmployeeTableView extends State<EmployeeTableView> {
  @override
  Widget build(BuildContext context) {
    final employees = EmployeeState.lstEmployee;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Employee Table",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:
          employees.isEmpty
              ? const Center(child: Text("No employees available."))
              : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Role")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows:
                      employees.map((e) {
                        return DataRow(
                          cells: [
                            DataCell(Text(e.name)),
                            DataCell(Text(e.role)),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Edit coming soon"),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      final shouldDelete = await showDialog<
                                        bool
                                      >(
                                        context: context,
                                        builder:
                                            (ctx) => AlertDialog(
                                              title: const Text(
                                                "Confirm Delete",
                                              ),
                                              content: const Text(
                                                "Are you sure you want to delete this employee?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed:
                                                      () => Navigator.pop(
                                                        ctx,
                                                        false,
                                                      ),
                                                  child: const Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed:
                                                      () => Navigator.pop(
                                                        ctx,
                                                        true,
                                                      ),
                                                  child: const Text("Delete"),
                                                ),
                                              ],
                                            ),
                                      );

                                      if (shouldDelete == true) {
                                        setState(() {
                                          EmployeeState.lstEmployee.remove(e);
                                        });
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text("Deleted"),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
    );
  }
}
