import 'package:dk_timeline/components/timeline_list.dart';
import 'package:dk_timeline/screens/timeline_screen.dart';
import 'package:dk_timeline/widgets/timeline_entry.dart';
import 'package:flutter/material.dart';

void main() => runApp(TimelineDK());

class TimelineDK extends StatelessWidget {
  final List<TimelineEntry> items = TimelineList().getTimelineList();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline DK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Timeline DK'),
          ),
          body: TimelineScreen(
            items: items,
          )),
    );
  }
}
