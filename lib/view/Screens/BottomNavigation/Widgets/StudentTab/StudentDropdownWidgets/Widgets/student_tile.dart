import 'package:attendence/res/Colors/AppColors.dart';
import 'package:attendence/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget studentTile({required String name,required String rollNo,required  String attendencePersent,required String image}){
  return ListTile(
    leading:CircleAvatar(
      backgroundColor: AppColors.primaryColor,

    ) ,
    title: Text(name,style: TextStyle(fontSize: RSizes.fontSizeSm),),

    subtitle: Row(children: [
      Text("Roll: $rollNo |",style: TextStyle(fontSize: RSizes.fontSizeSm)),
      SizedBox(width: 5,),
      Text("Attendence: $attendencePersent",style: TextStyle(overflow: TextOverflow.ellipsis),),
    ],),
  );
}