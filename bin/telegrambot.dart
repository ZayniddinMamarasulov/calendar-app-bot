import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:time/time.dart';
import 'dart:io';

void main() async {
  //!func
  dynamic res(String? text) {
    try{
    if (text == null) return "Iltimos sanani to'g'ri kiriting";
    List ls = text.split('/');
    if (ls.length == 3) {
      int year = int.parse(ls.first);
      int month = int.parse(ls[1]);
      int day = int.parse(ls.last);
      print("$year $month $day");
      String oy='s';
      
      switch (month) {
        case 1:
          oy = "Yanvar";break;
        case 2:
          oy = "Fevral";break;
          case 3:
          oy = "Mart";break;
          case 4:
          oy = "Aprel";break;
          case 5:
          oy = "May";break;
          case 6:
          oy = "Iyun";break;
          case 7:
          oy = "Iyul";break;
          case 8:
          oy = "Avgust";break;
          case 9:
          oy = "Sentabr";break;
          case 10:
          oy = "Oktabr";break;
          case 11:
          oy = "Noyabr";break;
          case 12:
          oy = "Dekabr";break;
      }
      if (month > 0 &&
              month < 13 &&
              ((month == 1 ||
                      month == 3 ||
                      month == 5 ||
                      month == 7 ||
                      month == 8 ||
                      month == 10 ||
                      month == 12) &&
                  day > 0 &&
                  day < 32) ||
          (month == 4 || month == 6 || month == 9 || month == 11) &&
              (day > 0 && day < 31) ||
          month == 2 && day > 0 && day <= 29) {
        DateTime now = DateTime.now();
        String input =
            now.difference(DateTime(year, month, day)).inDays.toString();
        // DateTime now = DateTime.now();
        return "Kiritilgan sanada shu kunga qadar $input kun o'tdi";
      } else
        return "$oy oyida $day kun bo'lishi mumkin emas, shu sabab sanani to'g'ri kiriting";
    } else
      return "Iltimos sanani to'g'ri kiriting";
  }catch (e) {
  return "Xato ma'lumot kiritdingiz";
}
  }

  var BOT_TOKEN = '5430447518:AAEWbLwkxKA7xY1kgac82spWoC_C4i3zp_c';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));

  teledart
      .onMessage()
      .listen((message) => message.reply(res(message.text.toString())));
  teledart.onCommand('start').listen((message) => message
      .reply("Assalomu alaykum, sanani YYYY/MM/DD ko'rinishida kiriting"));

  teledart.start();

}

