enum Events{
  explorerEvents("explore-events"),
  explorerPastEvent("Past Events"),
  explorerUpcomingEvent("Upcoming Events"),
  myPastEvents('My Past Events'),
  myUpcomingEvents('My Upcoming Events'),
  myEvents("My Events");



  const Events(this.text);

  final String text;
}
