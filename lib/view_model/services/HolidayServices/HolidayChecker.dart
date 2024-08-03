//
//
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../../view/Screens/HolidayScreens/SpecificHolidayScreen.dart';
// import 'HolidayService.dart';
//
// class HolidayChecker {
//   static Future<Map<String, String?>> checkForHoliday() async {
//     try {
//       final holidays = await HolidayService.fetchHolidays();
//       final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//
//       for (var holiday in holidays) {
//         if (_isDateInRange(currentDate, holiday.startDate, holiday.endDate)) {
//           return {
//             'isHoliday': 'true',
//             'reason': holiday.reason,
//           };
//         }
//       }
//       return {
//         'isHoliday': 'false',
//         'reason': null,
//       };
//     } catch (e) {
//       // Handle the exception and return a default value
//       return {
//         'isHoliday': 'false',
//         'reason': null,
//       };
//     }
//   }
//
//   static bool _isDateInRange(String date, String startDate, String endDate) {
//     final parsedDate = DateFormat('yyyy-MM-dd').parse(date);
//     final parsedStartDate = DateFormat('yyyy-MM-dd').parse(startDate);
//     final parsedEndDate = DateFormat('yyyy-MM-dd').parse(endDate);
//
//     return parsedDate.isAfter(parsedStartDate.subtract(Duration(days: 1))) &&
//         parsedDate.isBefore(parsedEndDate.add(Duration(days: 1)));
//   }
// }



import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'HolidayService.dart';

class HolidayChecker {
  static Future<Map<String, String?>> checkForHoliday() async {
    try {
      final holidays = await HolidayService.fetchHolidays();
      final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      for (var holiday in holidays) {
        if (_isDateInRange(currentDate, holiday.startDate, holiday.endDate)) {
          return {
            'isHoliday': 'true',
            'reason': holiday.reason,
          };
        }
      }
      return {
        'isHoliday': 'false',
        'reason': null,
      };
    } catch (e) {
      // Handle the exception and return a default value
      return {
        'isHoliday': 'false',
        'reason': null,
      };
    }
  }

  static Future<List<Map<String, String>>> fetchingAllHolidays() async {
    try {
      final holidays = await HolidayService.fetchHolidays();
      return holidays.map((holiday) {
        return {
          'reason': holiday.reason,
          'startDate': holiday.startDate,
          'endDate': holiday.endDate,
        };
      }).toList();
    } catch (e) {
      // Handle the exception and return an empty list
      return [];
    }
  }

  static bool _isDateInRange(String date, String startDate, String endDate) {
    final parsedDate = DateFormat('yyyy-MM-dd').parse(date);
    final parsedStartDate = DateFormat('yyyy-MM-dd').parse(startDate);
    final parsedEndDate = DateFormat('yyyy-MM-dd').parse(endDate);

    return parsedDate.isAfter(parsedStartDate.subtract(Duration(days: 1))) &&
        parsedDate.isBefore(parsedEndDate.add(Duration(days: 1)));
  }
}
