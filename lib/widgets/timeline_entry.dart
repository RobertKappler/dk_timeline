import 'package:dk_timeline/components/enums.dart';
import 'package:flutter/material.dart';

class Period {
  Duration duration;
  DateTime endOfPeriod;

  Period({this.duration, this.endOfPeriod});
}

class TimelineEntry extends StatelessWidget {
  // inputs for tile
  final KindOfEntry kind;
  final String title;
  final DateTime start;
  final DateTime end;
  final String address;
  final Period period;

  TimelineEntry({
    @required this.start,
    @required this.title,
    @required this.address,
    this.end,
    @required this.kind,
    this.period,
  });

  _formattedDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year} (${_getWeekday(date.weekday)})';
  }

  _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mo';
      case 2:
        return 'Tu';
      case 3:
        return 'We';
      case 4:
        return 'Th';
      case 5:
        return 'Fr';
      case 6:
        return 'Sa';
      case 7:
        return 'Su';
    }
  }

  _kindToIcon(KindOfEntry kind) {
    switch (kind) {
      case KindOfEntry.tournament:
        return Icon(Icons.title);
      case KindOfEntry.practice:
        return Icon(Icons.build);
      case KindOfEntry.meeting:
        return Icon(Icons.account_box);
      case KindOfEntry.socializing_event:
        return Icon(Icons.accessible_forward);
      default:
        return Icon(Icons.accessibility_new);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _kindToIcon(kind),
      isThreeLine: true,
      title: Text(title),
      subtitle: end != null
          ? Text('${_formattedDate(start)} bis ${_formattedDate(end)}')
          : Text('${_formattedDate(start)}'),
      trailing: Text('$address'),
    );
  }
}
