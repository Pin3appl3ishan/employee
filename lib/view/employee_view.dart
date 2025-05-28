import 'package:employee/model/employee_model.dart';
import 'package:employee/view/employee_details_view.dart';
import 'package:flutter/material.dart';
import 'package:employee/state/employee_state.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final nameController = TextEditingController();
  final photoUrl =
      "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4841.jpg?semt=ais_hybrid&w=740";
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedRole;

  final lstRole = [
    DropdownMenuItem(value: "Admin", child: Text("Admin")),
    DropdownMenuItem(value: "Manager", child: Text("Manager")),
    DropdownMenuItem(value: "Employee", child: Text("Employee")),
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool _isValidUrl(String url) {
    return url.isNotEmpty &&
        (url.startsWith("http://") || url.startsWith("https://"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter your name"
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter your email"
                            : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  hintText: "Enter your number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? "Please enter your number"
                            : null,
              ),
              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Role",
                  hintText: "Select a role",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                value: selectedRole,
                items: lstRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
                validator:
                    (value) => value == null ? "Please select your role" : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Employee employee = Employee(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      role: selectedRole!,
                      avatar: photoUrl,
                    );

                    setState(() {
                      EmployeeState.lstEmployee.add(employee);

                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                      selectedRole = null;
                    });

                    FocusScope.of(context).unfocus(); // unfocus any text fields

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Employee added successfully."),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 10),

              Expanded(
                child:
                    EmployeeState.lstEmployee.isEmpty
                        ? const Center(child: Text("No Employee found"))
                        : ListView.builder(
                          itemCount: EmployeeState.lstEmployee.length,
                          itemBuilder: (context, index) {
                            final employee = EmployeeState.lstEmployee[index];

                            return Column(
                              children: [
                                ListTile(
                                  leading:
                                      _isValidUrl(employee.avatar)
                                          ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              EmployeeState
                                                  .lstEmployee[index]
                                                  .avatar,
                                            ),
                                          )
                                          : const CircleAvatar(
                                            child: Icon(Icons.person),
                                          ),

                                  title: Text(employee.name),
                                  subtitle: Text(employee.role),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.blue[400],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            EmployeeState.lstEmployee.removeAt(
                                              index,
                                            );
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => EmployeeDetailsView(
                                              employee: employee,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                                Divider(thickness: 1),
                              ],
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
