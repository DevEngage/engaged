
import 'package:EarnIt/widgets/goal_item.dart';
import 'package:EarnIt/widgets/task_item.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class WorldScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {

    final results = useState<List>([]);
    final currentDate = useState<DateTime>();
    final goalCategory = useState<String>();

    return Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/imgs/space_world.jpeg'), colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcOver))), // Image.asset('assets/imgs/background.png') ),
        child: ListView(children: <Widget>[

        ]));
  }

}