import 'package:dk_timeline/components/enums.dart';
import 'package:dk_timeline/components/timeline_list.dart';
import 'package:dk_timeline/widgets/timeline_entry.dart';
import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  //static TimelineList tll = TimelineList();
  final List<TimelineEntry> items;
  TimelineScreen({this.items});

  //todo set starting listtile
  //todo add FAB for adding event
  //todo switch list to local db?! / external db


  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      key: ObjectKey(items[3]),
      children: items,
    ));
  }
}
