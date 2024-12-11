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
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: 'New item',
                isTitle: true,
                isDark: true,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Title',
                isTitle: false,
                isDark: true
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (String value) {
                  name_hab=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
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
