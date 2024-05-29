import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../../../../models/for_attandance_tab/DepartmentModel.dart';

class DepartmentDropdownWidget extends StatelessWidget {
  final RxList<DepartmentModel> departments;
  final ValueChanged<DepartmentModel?> onChanged;

  DepartmentDropdownWidget({
    Key? key,
    required this.departments,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DepartmentModel>(
      items: departments.map((department) {
        return DropdownMenuItem<DepartmentModel>(
          value: department,
          child: Text(department.departmentName),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text('Select Department'),
    );
  }
}
