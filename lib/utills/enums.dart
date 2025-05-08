enum Events {
  all("all"),
  exclusive("exclusive"),
  public("public"),
  private("private"),
  rejected("rejected"),
  pending("pending"),
  approved("approved"),
  completed("completed"),
  explorerEvents("explore-events"),
  explorerPastEvent("Past Events"),
  explorerUpcomingEvent("Upcoming Events"),
  myPastEvents('My Past Events'),
  myUpcomingEvents('My Upcoming Events'),
  myEvents("My Events");

  const Events(this.text);

  final String text;
}

enum UserRoles {
  user("user"),
  eventPlanner("event-planner");
  // guest("guest");

  const UserRoles(this.text);

  final String text;
}

enum MyInvitesTabs {
  pinned("pinned"),
  plannedEvents("planned events");
  // guest("guest");

  const MyInvitesTabs(this.text);

  final String text;
}

enum NotificationTypeEnums {
  announcement,
  registration,
  ads,
  supportTicket,
  event,
  subscription;
}
