import 'package:flutter/material.dart';
import 'package:untitled/services/my_button.dart';
import 'package:untitled/services/my_text.dart';

import '../services/add_item.dart';

class AddMyHabit extends StatefulWidget {

  final List habitsList;

  const AddMyHabit({super.key, required this.habitsList});

  @override
  State<AddMyHabit> createState() => _AddMyHabitState();
}

class _AddMyHabitState extends State<AddMyHabit> {
  List habitsList = [];
  late String name_hab;
  late String about_hab;

  List getListHabits(){
    return habitsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 40,
        title: MyText(text: 'New item', isTitle: true, isDark: true),
      ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Title',
                isTitle: false,
                isDark: true
              ),
              TextField(
                onChanged: (String value) {
                  name_hab=value;
                },
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              MyButton(
                textButton: 'Add',
                onTap: () {
                  addHabit(name_hab, about_hab);
                  Navigator.of(context).pop();
                })
            ],
        ),
      )
    );
  }
}
