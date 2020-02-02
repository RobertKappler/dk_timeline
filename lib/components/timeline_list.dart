import 'package:dk_timeline/components/enums.dart';
import 'package:dk_timeline/widgets/timeline_entry.dart';

class TimelineList {
  List<TimelineEntry> timelineList = [
    TimelineEntry(
      kind: KindOfEntry.tournament,
      title: 'Winterflug',
      address: 'Max Schmelling',
      start: DateTime(2020, 2, 15),
      end: DateTime(2020, 2, 16),
    ),
    TimelineEntry(
      kind: KindOfEntry.practice,
      title: 'SkillSession',
      address: 'TiB',
      start: DateTime(2020, 2, 6),
      period: Period(
        duration: Duration(days: 7),
        endOfPeriod: DateTime(2020, 4, 1),
      ),
    ),
    TimelineEntry(
      kind: KindOfEntry.practice,
      title: 'Disckick Mixed',
      address: 'TiB',
      start: DateTime(2020, 2, 3),
      period: Period(
        duration: Duration(days: 7),
        endOfPeriod: DateTime(2020, 4, 1),
      ),
    ),
    TimelineEntry(
      kind: KindOfEntry.meeting,
      title: 'Abteilungstreffen',
      address: 'bei Stefan',
      start: DateTime(2020, 1, 28),
    ),
    TimelineEntry(
      kind: KindOfEntry.socializing_event,
      title: 'Essen mit PJ',
      address: 'Duy Thai',
      start: DateTime(2020, 1, 29),
    ),
  ];

  getTimelineList() {
    var x = _completeItems(timelineList);
    return _sortItems(x);
  }

  _sortItems(List<TimelineEntry> items) {
    items.sort((a, b) => a.start.compareTo(b.start));
    return items;
  }

  _completeItems(List<TimelineEntry> items) {
    List<TimelineEntry> extendedItems = [];
    int counter = 0;
    for (TimelineEntry item in items) {
      print(counter++);
      if (item.period != null) {
        int periodCounter =
            item.period.endOfPeriod.difference(item.start).inDays ~/
                item.period.duration.inDays;
        DateTime endOfPeriod;
        DateTime newStart;
        DateTime newEnd;
        newStart = item.start.add(Duration(days: 7));
        item.end != null
            ? newEnd = item.end.add(Duration(days: 7))
            : newEnd = null;

        print(endOfPeriod);
        for (int i = 0; i < periodCounter; i++) {
          print(newStart);
          print(newEnd);
          //TODO check how copy old item with updated start/end
          extendedItems.add(
            TimelineEntry(
              title: item.title,
              address: item.address,
              period: item.period,
              start: newStart,
              end: newEnd,
              kind: item.kind,
            ),
          );
          newStart = newStart.add(Duration(days: 7));
          newEnd != null ? newEnd = newEnd.add(Duration(days: 7)) : null;
        }
      }
    }
    print('pfeife');
    items.addAll(extendedItems);
    return items;
  }
}
