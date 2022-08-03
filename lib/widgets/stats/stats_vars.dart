
enum TimeCalculate {
  pastMonthToday,
  pastQuarterToday,
  pastHalfYearToday,
  pastYearToday,
  previousMonth,
  previousQuarter,
  previousHalfYear,
  previousYear
}


// extension TimeCalculateFromString on String {
//   TimeCalculate? get time {
//     switch (this) {
//       case "Past Month From Today":
//         return TimeCalculate.pastMonthToday;
//       case "Past Quarter From Today":
//         return TimeCalculate.pastQuarterToday;
//       case "Past Half Year From Today":
//         return TimeCalculate.pastHalfYearToday;
//       case "Past Year From Today":
//         return TimeCalculate.pastYearToday;
//       case "Previous Month":
//         return TimeCalculate.previousMonth;
//       case "Previous Quarter":
//         return TimeCalculate.previousQuarter;
//       case "Previous Half Year":
//         return TimeCalculate.previousHalfYear;
//       case "Previous Year":
//         return TimeCalculate.previousYear;
//     }
//     return null;
//   }
// }

// extension TimeCalculateToString on TimeCalculate {
//   String get pretty {
//     switch (this) {
//       case TimeCalculate.pastMonthToday:
//         return "Past Month From Today";
//       case TimeCalculate.pastQuarterToday:
//         return "Past Quarter From Today";
//       case TimeCalculate.pastHalfYearToday:
//         return "Past Half-Year From Today";
//       case TimeCalculate.pastYearToday:
//         return "Past Year From Today";
//       case TimeCalculate.previousMonth:
//         return "Previous Month";
//       case TimeCalculate.previousQuarter:
//         return "Previous Quarter";
//       case TimeCalculate.previousHalfYear:
//         return "Previous Half-Year";
//       case TimeCalculate.previousYear:
//         return "Previous Year";
//     }
//   }
// }
