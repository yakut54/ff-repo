import 'package:collection/collection.dart';

enum AdminMenu {
  contents,
  notifications,
  subscriptions,
  analitycs,
}

enum AdminButtonType {
  active,
  inactive,
}

enum ArticleBlockType {
  text,
  headerHigh,
  headerLow,
  image,
  image90,
  image80,
  image70,
  image60,
  image50,
  image40,
  image30,
  image20,
  image10,
  quote,
  list,
  separator,
  button,
  youtube,
  video,
  timer,
}

enum Role {
  user,
  administrator,
  developer,
  guest,
}

enum CategoryCardType {
  short,
  long,
}

enum StoryCardType {
  big,
  little,
}

enum PageState {
  initial,
  loading,
  loaded,
  failure,
}

enum Zodiac {
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius,
  capricorn,
  aquarius,
  pisces,
}

enum FeedCardIcon {
  cards,
  wing,
  calendar,
  moon,
  whisper,
  gift,
}

enum Editor {
  article,
  horoscope,
  link,
}

enum NotificationStatus {
  inQueue,
  sent,
  sending,
}

enum SubscriptionStatus {
  paid,
  none,
}

enum Ecquiring {
  cloudpayments,
  yookassa,
  tbank,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AdminMenu):
      return AdminMenu.values.deserialize(value) as T?;
    case (AdminButtonType):
      return AdminButtonType.values.deserialize(value) as T?;
    case (ArticleBlockType):
      return ArticleBlockType.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (CategoryCardType):
      return CategoryCardType.values.deserialize(value) as T?;
    case (StoryCardType):
      return StoryCardType.values.deserialize(value) as T?;
    case (PageState):
      return PageState.values.deserialize(value) as T?;
    case (Zodiac):
      return Zodiac.values.deserialize(value) as T?;
    case (FeedCardIcon):
      return FeedCardIcon.values.deserialize(value) as T?;
    case (Editor):
      return Editor.values.deserialize(value) as T?;
    case (NotificationStatus):
      return NotificationStatus.values.deserialize(value) as T?;
    case (SubscriptionStatus):
      return SubscriptionStatus.values.deserialize(value) as T?;
    case (Ecquiring):
      return Ecquiring.values.deserialize(value) as T?;
    default:
      return null;
  }
}
