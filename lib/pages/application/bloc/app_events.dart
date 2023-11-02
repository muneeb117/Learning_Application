abstract class AppEvents {
  const AppEvents();
}

class TriggeredEvents extends AppEvents {
  final int index;
  TriggeredEvents(this.index) : super();
}
