import 'dart:convert';

import 'package:dept_emp_data/Models/employeedata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dept_emp_list extends StatefulWidget {
  @override
  _dept_emp_listState createState() => _dept_emp_listState();
}

class _dept_emp_listState extends State<dept_emp_list> {
  List<employee_data> emprecord = [];

  Future<List<employee_data>> _getdeptemp() async {
    final response = await http.get(
        'https://unlabelled-argument.000webhostapp.com/db_dept_emp_info.php');
    if (response.statusCode == 200) {
      
      List paresd = jsonDecode(response.body);

      return paresd.map((emp) => employee_data.fromJson(emp)).toList();
    }
  }

  @override
  void initState() {
    _getdeptemp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("Employee Data"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.pinkAccent[100],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Department Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text("Employee Name",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Text("Employee \n ID",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Text("Employee Salary",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                child: FutureBuilder(
                    future: _getdeptemp(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(
                                            "${snapshot.data[index].departmentname}",
                                            textAlign: TextAlign.center,
                                            )),
                                    Expanded(
                                        child: Text(
                                            "${snapshot.data[index].employeename}",
                                            textAlign: TextAlign.center,
                                            )),
                                    Expanded(
                                        child: Text(
                                            "${snapshot.data[index].employeeid}",
                                            textAlign: TextAlign.center,
                                            )),
                                    Expanded(
                                        child: Text(
                                            "${snapshot.data[index].employeesalary}",
                                            textAlign: TextAlign.center,
                                            ))
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
