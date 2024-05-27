// 외부에서 재사용 가능한 다양한 함수들의 클래스
import 'package:intl/intl.dart';

abstract class Util {
  // 날짜값을 받아서 "년.월.일"의 형태로 반환하는 함수
  static String dateToString(DateTime date) {
    return DateFormat('yy.MM.dd').format(date);
  }

  // 년,월,일 00:00 분으로 변환해주는 함수
  static DateTime dateToYmd(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // 디데이 계산 함수
  static String getDday(DateTime date) {
    final today = dateToYmd(DateTime.now());
    final targetDate = dateToYmd(date);
    // 날짜 차이
    final diff = today.difference(targetDate).inDays;

    if (diff == 0) {
      // D-Day
      return 'D-Day';
    } else if (diff > 0) {
      // 양수인 경우
      return 'D+$diff';
    } else {
      // 음수인 경우
      return 'D$diff';
    }
  }
}
