import 'package:flutter/material.dart';
import 'package:lab2yourinfo/models/course.dart';
import 'package:lab2yourinfo/models/food.dart';
import 'package:lab2yourinfo/models/year.dart';

class infoHomePage extends StatefulWidget {
  const infoHomePage({Key? key}) : super(key: key);

  @override
  _infoHomePageState createState() => _infoHomePageState();
}

class _infoHomePageState extends State<infoHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _noStd = TextEditingController();

//radio
  String? groupYear;
  List<Year>? years;

  String? groupCourse;
  List<Course>? courses;

  //dropdown
  List<ListFaculty>? types = ListFaculty.getItem();
  late List<DropdownMenuItem<ListFaculty>> _dropdownMenuItem;
  late ListFaculty _selectTypeItem;

  //checkbox
  List checkFood = [];
  List<Food>? foods;

  @override
  void initState() {
    super.initState();
    years = Year.getYear();
    courses = Course.getCourse();
    foods = Food.getFood();

    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectTypeItem = _dropdownMenuItem[0].value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Info'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  nameTextfield(),
                  noStdTextfield(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('กำลังศึกษาอยู่ชั้นปี'),
                  Column(
                    children: createRadioYear(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('หลักสูตร'),
                  Column(
                    children: createRadioCourse(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('เลือกคณะ'),
                  DropdownButton(
                    value: _selectTypeItem,
                    items: _dropdownMenuItem,
                    onChanged: (ListFaculty? value) {
                      setState(() {
                        _selectTypeItem = value!;
                      });
                    },
                  ),
                  Text('Dropdown selected : ${_selectTypeItem.value}'),
                  SizedBox(
                    height: 40,
                  ),
                  Text('เลือกเมนูอาหารที่ชอบ'),
                  Column(
                    children: createCheckboxFood(),
                  ),
                  submit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton submit() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print(_name.text);
        }
      },
      child: Text('Submit'),
    );
  }

  Widget nameTextfield() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _name,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter your name";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'ชื่อ-นามสกุล',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget noStdTextfield() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: _noStd,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter your student number";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'รหัสนิสิต',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ),
    );
  }

  List<Widget> createRadioYear() {
    List<Widget> listYear = [];

    for (var year in years!) {
      listYear.add(
        RadioListTile<dynamic>(
          title: Text(year.uyear!),
          value: year.yearValue,
          groupValue: groupYear,
          onChanged: (value) {
            setState(() {
              groupYear = value;
            });
          },
        ),
      );
    }
    return listYear;
  }

  List<Widget> createRadioCourse() {
    List<Widget> listCourse = [];

    for (var course in courses!) {
      listCourse.add(
        RadioListTile<dynamic>(
          title: Text(course.thcourse!),
          value: course.courseValue,
          groupValue: groupCourse,
          onChanged: (value) {
            setState(() {
              groupCourse = value;
            });
          },
        ),
      );
    }
    return listCourse;
  }

  List<DropdownMenuItem<ListFaculty>> createDropdownMenuItem(
      List<ListFaculty>? types) {
    List<DropdownMenuItem<ListFaculty>> items = [];

    for (var type in types!) {
      items.add(DropdownMenuItem(
        child: Text(type.thfaculty!),
        value: type,
      ));
    }

    return items;
  }

  List<Widget> createCheckboxFood() {
    List<Widget> listFood = [];

    for (var food in foods!) {
      listFood.add(
        CheckboxListTile(
          value: food.checked,
          title: Text(food.thName!),
          secondary: Text('${food.price!} บาท'),
          onChanged: (value) {
            setState(() {
              food.checked = value;
            });
            //เขียนโค้ดแสดง เพิ่มเติม แสดงรายการที่เราเลือก
            if (value!) {
              checkFood.add(food.thName);
            } else {
              checkFood.remove(food.thName);
            }

            print(checkFood);
          },
        ),
      );
    }
    return listFood;
  }
}

class ListFaculty {
  String? value;
  String? thfaculty;

  //constructor
  ListFaculty(this.value, this.thfaculty);

  static getItem() {
    return [
      ListFaculty('1', 'คณะวิทยาศาสตร์'),
      ListFaculty('2', 'คณะวิทยาการสุขภาพและการกีฬา'),
      ListFaculty('3', 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      ListFaculty('4', 'คณะนิติศาสตร์'),
      ListFaculty('5', 'คณะวิศวกรรมศาสตร์'),
      ListFaculty('6', 'คณะพยาบาลศาสตร์'),
      ListFaculty('7', 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
      ListFaculty('8', 'คณะศึกษาศาสตร์'),
    ];
  }
}
