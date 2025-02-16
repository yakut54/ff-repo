import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> adminHoroscopePopUpValidator(
  String title,
  List<HoroscopeBlockStruct>? horoscopeBlockList,
) {
  List<String> list = [];
  if (title.isEmpty) list.add('Заголовок отсутствует!');
  for (HoroscopeBlockStruct item in horoscopeBlockList ?? []) {
    final zodiacSigh = zodiacGetSigh(item.zodiac!);
    if (item.advice.isEmpty &&
        item.forMen.isEmpty &&
        item.forWomen.isEmpty &&
        item.title.isEmpty) {
      list.add('$zodiacSigh: блок не заполнен!');
    } else {
      List<String> zodiacFieldList = [];
      if (item.title.isEmpty) zodiacFieldList.add('"Основное"');
      if (item.forMen.isEmpty) zodiacFieldList.add('"Для мужчин"');
      if (item.forWomen.isEmpty) zodiacFieldList.add('"Для женщин"');
      if (item.advice.isEmpty) zodiacFieldList.add('"Совет недели"');
      if (zodiacFieldList.isNotEmpty) {
        if (zodiacFieldList.length < 2) {
          list.add('$zodiacSigh: не заполнено поле ${zodiacFieldList.first}!');
        } else {
          String fields = '';
          for (String str in zodiacFieldList) {
            fields += '$str, ';
          }
          fields = fields.substring(0, fields.length - 2);
          list.add('$zodiacSigh: не заполнены поля $fields!');
        }
      }
    }
  }
  return list;
}

List<String> adminLinkArticlePopUpValidator(
  String? link,
  String? title,
) {
  List<String> list = [];
  if ((title ?? '').replaceAll(' ', '').isEmpty) {
    list.add('Заголовок не может быть пустым!');
  }
  final regex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if ((link ?? '').isEmpty) {
    list.add('Ссылка не может быть пустой!');
  } else if (!regex.hasMatch((link ?? ''))) {
    list.add('Некорректная ссылка!');
  }
  return list;
}

List<String> adminNotificationPopUpValidator(
  String title,
  String text,
) {
  List<String> list = [];
  if (title.isEmpty) list.add('Заголовок уведомления не может быть пустым!');
  if (text.isEmpty) list.add('Текст уведомления не может быть пустым!');
  return list;
}

bool adminCanCloseHoroscopePopUp(
  ArticlesRecord? doc,
  String title,
  String description,
  String advice,
  List<HoroscopeBlockStruct>? list,
) {
  bool listWasModified = false;
  if (doc == null) {
    list?.forEach((item) {
      if (item.title.isNotEmpty ||
          item.advice.isNotEmpty ||
          item.forMen.isNotEmpty ||
          item.forWomen.isNotEmpty) {
        listWasModified = true;
      }
    });
    return title.isEmpty &&
        description.isEmpty &&
        advice.isEmpty &&
        !listWasModified;
  }
  for (HoroscopeBlockStruct block in doc.horoscopeBlocks) {
    if (!((list ?? []).contains(block))) listWasModified = true;
  }
  return doc.title == title &&
      (doc.description ?? '') == description &&
      (doc.advice ?? '') == advice &&
      !listWasModified;
  // Add your function code here!
}

bool adminCanCloseNotificationPopUp(
  FfPushNotificationsQueueRecord? doc,
  String title,
  String text,
  String? dispatchTime,
) {
  if (doc == null) {
    return title.isEmpty && text.isEmpty;
  }
  return doc.notificationTitle == title &&
      doc.notificationText == text &&
      doc.dispatchTime == dispatchTime;
  // Add your function code here!
}

bool adminCanCloseStoryPopUp(
  StoriesRecord? doc,
  String? buttonText,
  String? link,
  String? image,
  String? name,
  String? cover,
) {
  if (doc == null) {
    return //(buttonText ?? '').isEmpty &&
        (link ?? '').isEmpty &&
            //(image ?? '').isEmpty &&
            (name ?? '').isEmpty &&
            (cover ?? '').isEmpty;
  }
  return //buttonText == doc.buttonText &&
      link == doc.link &&
          //image == doc.image &&
          cover == doc.coverImage &&
          name == doc.name;
}

bool adminCanCloseRubricPopUp(
  RubricsRecord? doc,
  String name,
  String? image,
) {
  if (doc == null) {
    return name.isEmpty;
  }
  return doc?.name == name && doc?.banner == image;
  // Add your function code here!
}

bool adminCanCloseSuggestionsPopUp(
  SuggestionsRecord? doc,
  String? link,
  String? name,
  String? cover,
) {
  if (doc == null) {
    return (link ?? '').isEmpty &&
        (name ?? '').isEmpty &&
        (cover ?? '').isEmpty;
  }
  return link == doc.link && cover == doc.coverImage && name == doc.name;
}

bool adminCanCloseSubscriptionPopUp(
  SubscriptionTiersRecord? doc,
  String amount,
  String banner,
) {
  return doc?.amount == int.tryParse(amount) && doc?.banner == banner;
  // Add your function code here!
}

String smscGenerateCode() {
  return '${(new math.Random()).nextInt(900000) + 100000}';
}

bool adminCanCloseArticlePopUp(
  ArticlesRecord? doc,
  String title,
  String description,
  List<ArticleBlockStruct>? list,
  bool startSw,
  bool endSw,
  String? startDate,
  String? startTime,
  String? endDate,
  String? endTime,
) {
  if (doc == null) {
    return title.isEmpty &&
        description.isEmpty &&
        (list ?? []).isEmpty &&
        !startSw &&
        !endSw;
  }

  final docStartDT = doc.startTime ?? '';
  final docEndDT = doc.endTime ?? '';
  bool startTimeIsEqual = docStartDT.isNotEmpty == startSw &&
      docStartDT == ('$startDate $startTime' == ' ' ? '' : '$endDate $endTime');
  bool endTimeIsEqual = docEndDT.isNotEmpty == endSw &&
      docEndDT == ('$endDate $endTime' == ' ' ? '' : '$endDate $endTime');

  return (doc.title == title && doc.description != null
          ? doc.description == description
          : description.isEmpty) &&
      doc.articleBlocks == list &&
      startTimeIsEqual &&
      endTimeIsEqual;
  // Add your function code here!
}

List<String> adminStoryPopUpValidator(
  String? buttonText,
  String? image,
  String? link,
  String? name,
  String? cover,
) {
  List<String> list = [];
  if ((name ?? '').isEmpty) list.add('Название истории не может быть пустым!');
  if ((cover ?? '').isEmpty) list.add('Изображение обложки отсутствует!');
  /*if ((buttonText ?? '').isEmpty)
    list.add('Название кнопки не может быть пустым!');
  if ((buttonText ?? '').length > 24)
    list.add('Максимальная длина названия кнопки 24 символа!');
  if ((image ?? '').isEmpty) list.add('Изображение истории отсутствует!');*/
  final regex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if ((link ?? '').isEmpty) {
    list.add('Ссылка не может быть пустой!');
  } else if (!regex.hasMatch((link ?? ''))) {
    list.add('Некорректная ссылка!');
  }
  return list;
}

List<String> adminRubricPopUpValidator(String? name) {
  List<String> list = [];
  // if ((name ?? '').isEmpty) list.add('Название рубрики не может быть пустым!');
  // if ((name ?? '').length > 24)
  //   list.add('Максимальная длина названия 24 символа!');
  return list;
}

List<String> adminArticlePopUpValidator(
  String title,
  List<ArticleBlockStruct>? articleBlocList,
  bool startSW,
  String? startDate,
  String? startTime,
  bool endSW,
  String? endDate,
  String? endTime,
) {
  List<String> list = [];
  void _checkText(String title, ArticleBlockStruct block) {
    if (block.text.isEmpty) list.add('$title: блок не может быть пустым.');
  }

  void _checkQuote(String title, ArticleBlockStruct block) {
    if (block.text.isEmpty)
      list.add('$title: текст блока не может быть пустым.');
    // if (block.author.isEmpty) list.add('$title: автор цитаты не указан.');
  }

  void _checkButton(String title, ArticleBlockStruct block) {
    if (block.text.isEmpty)
      list.add('$title: название кнопки не может быть пустым.');
    final regex = RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
    if (block.link.isEmpty) {
      list.add('$title: ссылка не может быть пустой!');
    } else if (!regex.hasMatch(block.link)) {
      list.add('$title: некорректная ссылка!');
    }
  }

  void _checkImage(String title, ArticleBlockStruct block) {
    if (block.image.isEmpty) list.add('$title: отсутствует изображение.');
  }

  void _checkYTVideo(String title, ArticleBlockStruct block) {
    final RegExp youtubeUrlRegExp = RegExp(
      r'^(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
    );
    if (block.link.isEmpty) {
      list.add('$title: ссылка не может быть пустой!');
    } else if (!youtubeUrlRegExp.hasMatch(block.link)) {
      list.add('$title: некорректная ссылка!');
    }
  }

  void _checkVideo(String title, ArticleBlockStruct block) {
    final regex = RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
    if (block.link.isEmpty) {
      list.add('$title: ссылка не может быть пустой!');
    } else if (!regex.hasMatch(block.link)) {
      list.add('$title: некорректная ссылка!');
    }
  }

  if (title == '') list.add('Заголовок не может быть пустым.');
  if (articleBlocList == null || articleBlocList.isEmpty) {
    list.add('Статья должна содержать хотя-бы один блок.');
  } else {
    articleBlocList.forEach((block) {
      final blockType = block.type;
      return switch (blockType) {
        ArticleBlockType.text => _checkText('Текст', block),
        ArticleBlockType.headerHigh => _checkText('Заголовок большой', block),
        ArticleBlockType.headerLow => _checkText('Заголовок маленький', block),
        ArticleBlockType.image => _checkImage('Изображение', block),
        ArticleBlockType.image10 => _checkImage('Изображение 10%', block),
        ArticleBlockType.image20 => _checkImage('Изображение 20%', block),
        ArticleBlockType.image30 => _checkImage('Изображение 30%', block),
        ArticleBlockType.image40 => _checkImage('Изображение 40%', block),
        ArticleBlockType.image50 => _checkImage('Изображение 50%', block),
        ArticleBlockType.image60 => _checkImage('Изображение 60%', block),
        ArticleBlockType.image70 => _checkImage('Изображение 70%', block),
        ArticleBlockType.image80 => _checkImage('Изображение 80%', block),
        ArticleBlockType.image90 => _checkImage('Изображение 90%', block),
        ArticleBlockType.quote => _checkQuote('Цитата', block),
        ArticleBlockType.list => _checkText('Элемент списка', block),
        ArticleBlockType.separator => null,
        ArticleBlockType.button => _checkButton('Кнопка', block),
        ArticleBlockType.youtube => _checkYTVideo('Youtube видео', block),
        ArticleBlockType.video => _checkVideo('Видео', block),
        ArticleBlockType.timer => null,
        _ =>
          throw UnimplementedError(), // Оставьте это для обработки других неизвестных типов
      };
    });
  }

  if (startSW) {
    if (startDate?.isEmpty ?? true) list.add('Введите дату начала публикации.');
    if (startTime?.isEmpty ?? true)
      list.add('Введите время начала публикации.');
  }

  if (endSW) {
    if (endDate?.isEmpty ?? true) list.add('Введите дату скрытия публикации.');
    if (endTime?.isEmpty ?? true) list.add('Введите время скрытия публикации.');
  }

  return list;
}

List<String> adminSubscriptionPopUpValidator(String? amount) {
  List<String> list = [];
  String _amount = amount ?? '';

  bool isOnlyNumbers = _amount.isEmpty ? false : int.tryParse(_amount) != null;

  if (_amount.isEmpty)
    list.add('Введите сумму!');
  else if (!isOnlyNumbers) list.add('Введите корректную сумму!');
  if (_amount.length > 24) list.add('Максимальная длина названия 24 символа!');
  return list;
}

List<String> adminSuggestionsPopUpValidator(
  String? link,
  String? name,
  String? cover,
) {
  List<String> list = [];
  if ((name ?? '').isEmpty) list.add('Название истории не может быть пустым!');
  if ((cover ?? '').isEmpty) list.add('Изображение обложки отсутствует!');
  final regex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if ((link ?? '').isEmpty) {
    list.add('Ссылка не может быть пустой!');
  } else if (!regex.hasMatch((link ?? ''))) {
    list.add('Некорректная ссылка!');
  }
  return list;
}

int smscGetTimer(OtpStruct otp) {
  final timer = 120999;
  final now = DateTime.now();
  if (((otp.createdTime?.millisecondsSinceEpoch ?? 0) + timer) >=
      now.millisecondsSinceEpoch) {
    return (otp.createdTime!.millisecondsSinceEpoch + timer) -
        now.millisecondsSinceEpoch;
  }
  return timer;
}

bool smscCanSendMessage(
  String phone,
  OtpStruct otp,
) {
  if (otp.phone != phone) {
    return true;
  }
  if ((otp.createdTime?.millisecondsSinceEpoch ?? 0) + 120999 <=
      DateTime.now().millisecondsSinceEpoch) {
    return true;
  }
  return false;
}

bool isTextLessThen(
  String? text,
  int length,
) {
  return (text ?? '').replaceAll(' ', '').length < length;
}

String sighInFormatPhone(
  String phone,
  String symbol,
) {
  RegExp regex = RegExp(r'(\d{3})(\d{3})(\d{2})(\d{2})');
  return phone.replaceAllMapped(
      regex,
      (Match match) =>
          '${match[1]}$symbol${match[2]}$symbol${match[3]}$symbol${match[4]}');
}

List<UsersRecord> filterDeletedUsersFromLastMonth(List<UsersRecord>? users) {
  if (users == null) return [];

  DateTime now = DateTime.now();
  DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);
  DateTime firstDayOfLastMonth =
      DateTime(firstDayOfThisMonth.year, firstDayOfThisMonth.month - 1, 1);
  DateTime lastDayOfLastMonth =
      firstDayOfThisMonth.subtract(const Duration(days: 1));

  return users.where((user) {
    if (user.deletedTime == null) return false;
    DateTime userDate = DateTime(
        user.deletedTime!.year, user.deletedTime!.month, user.deletedTime!.day);
    return userDate.isAfter(firstDayOfLastMonth) &&
        userDate.isBefore(lastDayOfLastMonth.add(const Duration(days: 1)));
  }).toList();
}

String smscMessage(String code) {
  return 'Ваш код: $code. Не сообщайте его никому!';
}

List<UsersRecord> filterNonGuestUsersFromLastMonth(List<UsersRecord>? users) {
  if (users == null) return [];

  DateTime now = DateTime.now();
  DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);
  DateTime firstDayOfLastMonth =
      DateTime(firstDayOfThisMonth.year, firstDayOfThisMonth.month - 1, 1);
  DateTime lastDayOfLastMonth =
      firstDayOfThisMonth.subtract(const Duration(days: 1));

  return users.where((user) {
    DateTime userDate = DateTime(
        user.createdTime!.year, user.createdTime!.month, user.createdTime!.day);
    return user.role != Role.guest &&
        userDate.isAfter(firstDayOfLastMonth) &&
        userDate.isBefore(lastDayOfLastMonth.add(const Duration(days: 1)));
  }).toList();
}

List<UsersRecord> filterDeletedUsersFromYesterday(List<UsersRecord>? users) {
  if (users == null) return [];
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));

  return users.where((user) {
    if (user.deletedTime == null) return false;
    DateTime userDate = DateTime(
        user.deletedTime!.year, user.deletedTime!.month, user.deletedTime!.day);
    DateTime yesterdayDate =
        DateTime(yesterday.year, yesterday.month, yesterday.day);
    return userDate == yesterdayDate;
  }).toList();
}

List<UsersRecord> filterUsersFromYesterdayCopy(List<UsersRecord>? users) {
  if (users == null) return [];
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));

  return users.where((user) {
    DateTime userDate = DateTime(
        user.createdTime!.year, user.createdTime!.month, user.createdTime!.day);
    DateTime yesterdayDate =
        DateTime(yesterday.year, yesterday.month, yesterday.day);
    return userDate == yesterdayDate;
  }).toList();
}

bool isCategoryCardLong(int index) {
  return !(index % 3 == 1 || index % 3 == 2);
}

bool adminCanCloseCategoryPopUp(
  CategoriesRecord? docOne,
  CategoriesRecord? docTwo,
) {
  if (docTwo == null)
    return !((docOne?.name.isNotEmpty ?? false) ||
        (docOne?.image.isNotEmpty ?? false));
  return docOne?.name == docTwo.name &&
      docOne?.image == docTwo.image &&
      docOne?.isPaid == docTwo.isPaid &&
      docOne?.tags.firstOrNull == docTwo.tags.firstOrNull;
  // Add your function code here!
}

List<String> adminCategoryPopUpValidator(
  String? name,
  String? image,
  String? link,
) {
  List<String> list = [];
  if ((name ?? '').isEmpty)
    list.add('Название категории не может быть пустым!');
  final regex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if ((link ?? '').isEmpty) {
    list.add('Ссылка не может быть пустой!');
  } else if (!regex.hasMatch((link ?? ''))) {
    list.add('Некорректная ссылка!');
  }
  if ((name ?? '').length > 32)
    list.add('Максимальная длина названия категории 32 символа!');
  if ((image ?? '').isEmpty) list.add('Изображение обложки отсутствует!');
  return list;
}

String zodiacGetSigh(Zodiac zodiac) {
  return switch (zodiac) {
    Zodiac.aries => 'Овен',
    Zodiac.taurus => 'Телец',
    Zodiac.gemini => 'Близнецы',
    Zodiac.cancer => 'Рак',
    Zodiac.leo => 'Лев',
    Zodiac.virgo => 'Дева',
    Zodiac.libra => 'Весы',
    Zodiac.scorpio => 'Скорпион',
    Zodiac.sagittarius => 'Стрелец',
    Zodiac.capricorn => 'Козерог',
    Zodiac.aquarius => 'Водолей',
    Zodiac.pisces => 'Рыбы',
  };
}

String zodiacGetAdviceSigh(Zodiac zodiac) {
  return switch (zodiac) {
    Zodiac.aries => 'Овнов',
    Zodiac.taurus => 'Телецов',
    Zodiac.gemini => 'Близнецов',
    Zodiac.cancer => 'Раков',
    Zodiac.leo => 'Львов',
    Zodiac.virgo => 'Дев',
    Zodiac.libra => 'Весов',
    Zodiac.scorpio => 'Скорпионов',
    Zodiac.sagittarius => 'Стрелецов',
    Zodiac.capricorn => 'Козерогов',
    Zodiac.aquarius => 'Водолеев',
    Zodiac.pisces => 'Рыб',
  };
}

DateTime convertDateStringToDateTime(String? dateString) {
  if (dateString == null || dateString.isEmpty) return DateTime.now();
  List<String> dateParts = dateString.split(' ');
  List<String> dayMonthYear = dateParts[0].split('.');

  // Преобразуем год из двухзначного формата в четырехзначный
  int year = int.parse(dayMonthYear[2]) + 2000;
  int month = int.parse(dayMonthYear[1]);
  int day = int.parse(dayMonthYear[0]);

  List<String> timeParts = dateParts[1].split(':');
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  return DateTime(year, month, day, hour, minute);
}

String? convertDateTimeToString(DateTime? dateTime) {
  String formatter(DateTime dt) {
    final day = dt.day.toString().padLeft(2, '0');
    final month = dt.month.toString().padLeft(2, '0');
    final year = dt.year.toString().substring(2);
    final hour = dt.hour.toString().padLeft(2, '0');
    //final minute = dt.minute.toString().padLeft(2, '0');
    return '$day.$month.$year $hour:00';
  }

  return dateTime == null ? null : formatter(dateTime);
}

String notificationGetStringTime(DateTime? timestamp) {
  if (timestamp == null) return '';
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final weekAgo = DateTime(now.year, now.month, now.day - 6);

  if (timestamp.isAfter(today.subtract(Duration(days: 1))) &&
      timestamp.isBefore(today.add(Duration(days: 1)))) {
    return DateFormat.Hm()
        .format(timestamp); // Changed from DateFormat.jm() to DateFormat.Hm()
  } else if (timestamp.isAtSameMomentAs(yesterday) ||
      timestamp.isAfter(weekAgo) && timestamp.isBefore(today)) {
    return DateFormat.E('ru_RU').format(timestamp);
  }
  return DateFormat('d.MM').format(timestamp);
}

String shareText(ArticlesRecord doc) {
  final title = doc.title;
  final description = doc.description;
  return '''$title
${description.isNotEmpty ? '/n$description' : ''}
Скачать ЖенСовет:
https://to.imshop.io/install/martang/''';
}

List<String> subscriptionCategoriyList(
  List<CategoriesRecord>? paidCatrgories,
  bool firstThree,
) {
  if (paidCatrgories?.isEmpty ?? true) return [];
  List<String> list = paidCatrgories?.map((e) => e.name).toList() ?? [];
  return firstThree ? list.take(3).toList() : list;
}

String sctGetTextEnding(SubscriptionTiersRecord doc) {
  final period = doc.period;
  final interval = doc.interval;

  String text = '';

  bool isLessThenTen(int value) => value % 10 == 1 && value % 100 != 11;

  bool isALittle(int value) => (value % 10 >= 2 &&
      value % 10 <= 4 &&
      (value % 100 < 10 || value % 100 >= 20));

  if (interval == "Day") {
    if (isLessThenTen(period)) {
      text = 'день';
    } else if (isALittle(period)) {
      text = 'дня';
    } else {
      text = 'дней';
    }
  } else if (interval == "Month") {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'месяц';
      } else if (isALittle(period)) {
        text = 'месяца';
      } else {
        text = 'месяцев';
      }
    }
  } else if (interval == "Week") {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'неделя';
      } else if (isALittle(period)) {
        text = 'недели';
      } else {
        text = 'недель';
      }
    }
  } else {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'час';
      } else if (isALittle(period)) {
        text = 'часа';
      } else {
        text = 'часов';
      }
    }
  }
  return text;
}

int sctCalculateAmountPerWeek(SubscriptionTiersRecord doc) {
  final int amount = doc.amount;
  final int period = doc.period;
  final interval = doc.interval;
  switch (interval) {
    case "Month":
      return (amount / (period * 4).floor()).round();
    case "Week":
      return (amount / period.floor()).round();
    default:
      return 0;
  }
}

bool imageIsSetAndIsNotEmpty(String? imagePath) {
  return imagePath != null && imagePath.isNotEmpty;
}

bool isArticleSupported(ArticlesRecord doc) {
  return Editor.values.contains(doc.type);
}

List<UsersRecord> filterNonGuestUsersFromYesterday(List<UsersRecord>? users) {
  if (users == null) return [];
  DateTime now = DateTime.now();
  DateTime yesterday = now.subtract(const Duration(days: 1));

  return users.where((user) {
    DateTime userDate = DateTime(
        user.createdTime!.year, user.createdTime!.month, user.createdTime!.day);
    DateTime yesterdayDate =
        DateTime(yesterday.year, yesterday.month, yesterday.day);
    return user.role != Role.guest && userDate == yesterdayDate;
  }).toList();
}

List<UsersRecord> filterUsersFromLastMonth(List<UsersRecord>? users) {
  if (users == null) return [];

  DateTime now = DateTime.now();
  DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);
  DateTime firstDayOfLastMonth =
      DateTime(firstDayOfThisMonth.year, firstDayOfThisMonth.month - 1, 1);
  DateTime lastDayOfLastMonth =
      firstDayOfThisMonth.subtract(const Duration(days: 1));

  return users.where((user) {
    DateTime userDate = DateTime(
        user.createdTime!.year, user.createdTime!.month, user.createdTime!.day);
    return userDate.isAfter(firstDayOfLastMonth) &&
        userDate.isBefore(lastDayOfLastMonth.add(const Duration(days: 1)));
  }).toList();
}

List<StatsRecord> filterOnlineFromLastMonth(List<StatsRecord>? records) {
  if (records == null) return [];
  DateTime now = DateTime.now();
  DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);
  DateTime firstDayOfLastMonth =
      DateTime(firstDayOfThisMonth.year, firstDayOfThisMonth.month - 1, 1);
  DateTime lastDayOfLastMonth =
      firstDayOfThisMonth.subtract(const Duration(days: 1));

  // Фильтрация записей за прошлый месяц
  List<StatsRecord> filteredRecords = records.where((record) {
    DateTime recordDate = DateTime(record.createdTime!.year,
        record.createdTime!.month, record.createdTime!.day);
    return recordDate.isAfter(firstDayOfLastMonth) &&
        recordDate.isBefore(lastDayOfLastMonth.add(const Duration(days: 1)));
  }).toList();

  // Сортировка пользователей в каждой записи по полю `online` в порядке убывания
  filteredRecords.sort((a, b) => b.online.length.compareTo(a.online.length));

  return filteredRecords;
}

bool rubricNameContains(
  ArticlesRecord doc,
  String textfield,
) {
  return doc.title.toLowerCase().contains(textfield.toLowerCase());
}

List<ArticleBlockStruct> emptyArticleBlockList() {
  return [];
}

String? stringToVideoPath(String? str) {
  return str;
}

String getNameFromRole(Role role) {
  return switch (role) {
    Role.user => "Пользователь",
    Role.administrator => "Администратор",
    Role.developer => "Разработчик",
    Role.guest => "Гость",
  };
}

String getCurrentPlatform(
  bool isAndroid,
  bool isiOS,
) {
  return isAndroid
      ? 'Android'
      : isiOS
          ? 'iOS'
          : 'Web';
}

List<DocumentReference> invertArticles(List<DocumentReference>? articles) {
  return articles?.reversed.toList() ?? [];
}

String formattingTimerBlock(
  DateTime? endDateTime,
  bool withAnimation,
) {
  final now = DateTime.now();
  if (endDateTime == null ||
      now.millisecondsSinceEpoch >= endDateTime.millisecondsSinceEpoch) {
    return '00:00:00';
  }
  Duration difference = now.difference(endDateTime).abs();

  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);
  int seconds = difference.inSeconds.remainder(60);
  List<String> time = [hours, minutes, seconds]
      .map((element) => '$element'.padLeft(2, '0'))
      .toList();
  return time.join(':');
}

List<ArticleBlockStruct> articleBlockToList(ArticleBlockStruct block) {
  return [block];
}

bool isFriendlyCountry(String countryCode) {
  const List<String> friendlyCountries = [
    'AZ', // Азербайджан
    'AM', // Армения
    'BY', // Беларусь
    'KZ', // Казахстан
    'KG', // Киргизия
    'RU', // Россия
    'TJ', // Таджикистан
    'UZ', // Узбекистан
  ];

  return friendlyCountries.contains(countryCode);
}

bool isPhotoExists(String photo) {
  print('photo --->> $photo');
  return photo.isNotEmpty;
}

int? getRandomSplash(List<NewSplashsRecord>? data) {
  if (data != null) {
    print('data ... ${data.length}');

    math.Random random = math.Random();
    int randomIndex = random.nextInt(data.length);

    print('randomIndex ... $randomIndex');

    return randomIndex;
  }

  return 0;
}

DateTime? getTime() {
  return DateTime.now().add(Duration(hours: 9, minutes: 59, seconds: 59));
}

int indexFromArticles(
  ArticlesStateTypeStruct arg,
  List<ArticlesStateTypeStruct> argList,
) {
  print('argList.indexOf(arg) ---------------- ${argList.indexOf(arg)}');
  return argList.indexOf(arg);
}

RubricsStateTypeStruct? getRubricById(
  String rubricId,
  List<RubricsStateTypeStruct> rubricsList,
) {
  // Ищем рубрику по id
  try {
    final rubric = rubricsList.firstWhere(
      (rubric) {
        return rubric.id == rubricId;
      },
    );

    return rubric;
  } catch (e) {
    // Логируем ошибку
    debugPrint('Ошибка при поиске рубрики: $e');
    return null;
  }
}

String refUserId(DocumentReference arg) {
  print(
      'printItemString DocumentReference --------------- ${arg.path.replaceFirst('users/', '')}');
  return arg.path.replaceFirst('users/', '');
}
