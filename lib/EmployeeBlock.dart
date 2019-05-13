/*
  *******Remember*******
  sink to add in pipe
  stream to get data from pipe
  pipe means dataflow
*/


//1.imports
import 'dart:async';
import 'dart:core';
import 'Employee.dart';

class EmployeeBlock{
  //2.List of Employees
  List<Employee> _employeeList = [
    Employee(1, "Employee One", 10000.0),
    Employee(2, "Employee two", 2000.0),
    Employee(3, "Employee three", 4000.0),
    Employee(4, "Employee four", 8000.0),
    Employee(5, "Employee five", 1000.0),
  ];

  //3. Stream Controllers
  final _employeeListStreamController = StreamController<List<Employee>>();
  //for inc and dec
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //4. Stream getters
  //ouput data means stream
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  //input data means sink
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;

  // 5. Constructors - add data; Listen to changes
  EmployeeBlock(){
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  // 6. Core Functions
  _incrementSalary(Employee employee){
    double salary = employee.salary;

    double incrementedSalary = salary * 20/100;
    _employeeList[employee.id-1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }
  _decrementSalary(Employee employee){
    double salary = employee.salary;

    double decrementedsalary = salary * 20/100;
    _employeeList[employee.id-1].salary = salary - decrementedsalary;
    employeeListSink.add(_employeeList);
  }

  // 7. dispose
  void dispose(){
    _employeeListStreamController.close();
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
  }

}



