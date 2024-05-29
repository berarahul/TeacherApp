import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../../../../models/for_attandance_tab/DepartmentModel.dart';
import '../../../../../../../models/for_student_tab/Department_Model.dart';

class StudentTabDepartmentDropdownWidget extends StatelessWidget {
  final RxList<studenttabDepartmentModel> departments;
  final ValueChanged<studenttabDepartmentModel?> onChanged;

  StudentTabDepartmentDropdownWidget({
    required this.departments,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<studenttabDepartmentModel>(
      items: departments.map((department) {
        return DropdownMenuItem<studenttabDepartmentModel>(
          value: department,
          child: Text(department.departmentName),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text('Select Department'),
    );
  }
}

