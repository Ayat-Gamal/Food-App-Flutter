import 'package:flutter/material.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropDownDeliveryList extends StatefulWidget {
  const DropDownDeliveryList({super.key});

  @override
  State<DropDownDeliveryList> createState() => _DropDownDeliveryListState();
}

class _DropDownDeliveryListState extends State<DropDownDeliveryList> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon:   Icon(Icons.arrow_drop_down),
      elevation: 8,
       style:   TextStyle(color: Colors.black,),

       onChanged: (String? value) {
         setState(() {
          dropdownValue = value!;
        });
      },
      items:
      list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}
