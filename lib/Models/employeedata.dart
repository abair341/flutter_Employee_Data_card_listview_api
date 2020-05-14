import 'package:flutter/material.dart';

class employee_data{
  String departmentid;
  String departmentname;
  String employeeid;
  String employeename;
  String employeesalary;

  employee_data({this.departmentid, this.departmentname, this.employeeid,
                this.employeename, this.employeesalary});

  employee_data.fromJson(Map<String,dynamic> json){
      departmentid = json['deptid'];
      departmentname = json['dept_name'];
      employeeid = json['emp_id'];
      employeename = json['emp_name'];
      employeesalary = json['emp_Sal'];
  }
    
}


