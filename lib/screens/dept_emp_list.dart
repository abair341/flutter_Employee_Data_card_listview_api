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
      final response = await http.get('https://unlabelled-argument.000webhostapp.com/db_dept_emp_info.php');
      if(response.statusCode==200){
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
        appBar: AppBar(
          title: Text("Employee Data"),
        ),
        body: SafeArea(
          child: 
             FutureBuilder(
               future:  _getdeptemp(),
               builder: (context,snapshot){       
                 if(snapshot.hasData){
                    return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return ListTile(
                        leading: Text("${snapshot.data[index].departmentname}"),                  
                        title: Text("${snapshot.data[index].employeename}"),
                        subtitle: Text(" Employee ID ${snapshot.data[index].employeeid}"),
                        trailing: Text(" Employee Salary ${snapshot.data[index].employeesalary}"),
                   );
                  },
                  );
                }     
                else{
                  return Center(child: CircularProgressIndicator());
                }            
             }),
          ),
    );
  }
}