enum Grade {
  noGrade,
  unsatisfactory,
  introductory,
  familiar,
  proficient,
  expert
}

// converts a string into an enum value
extension GradeFromString on String {
  Grade? get grade {
    switch (this) {
      case "noGrade":
        return Grade.noGrade;
      case "unsatisfactory":
        return Grade.unsatisfactory;
      case "introductory":
        return Grade.introductory;
      case "familiar":
        return Grade.familiar;
      case "proficient":
        return Grade.proficient;
      case "expert":
        return Grade.expert;
    }
    return null;
  }
}

extension GradeFromInt on int {
  Grade? get grade {
    switch (this) {
      case -1:
        return Grade.noGrade;
      case 0:
        return Grade.unsatisfactory;
      case 1:
        return Grade.introductory;
      case 2:
        return Grade.familiar;
      case 3:
        return Grade.proficient;
      case 4:
        return Grade.expert;
    }
    return null;
  }
}

// Converts Grade enum to numbered String
extension GradetoString on Grade {
  String get number {
    switch (this) {
      case Grade.noGrade:
        return "NG";
      case Grade.unsatisfactory:
        return "0";
      case Grade.introductory:
        return "1";
      case Grade.familiar:
        return "2";
      case Grade.proficient:
        return "3";
      case Grade.expert:
        return "4";
    }
  }
}

enum AdQual { none, ldad, adip, acad, cpad }

extension AdQualFromString on String {
  AdQual? get adQual {
    switch (this) {
      case "none":
        return AdQual.none;
      case "ldad":
        return AdQual.ldad;
      case "adip":
        return AdQual.adip;
      case "acad":
        return AdQual.acad;
      case "cpad":
        return AdQual.cpad;
    }
    return null;
  }
}

extension AdQualToString on AdQual {
  String get pretty {
    switch (this) {
      case AdQual.none:
        return "None";
      case AdQual.acad:
        return "ACAD";
      case AdQual.adip:
        return "ADIP";
      case AdQual.cpad:
        return "CPAD";
      case AdQual.ldad:
        return "LDAD";
    }
  }
}

enum PilotQual { fpq, fpc, mp, ip }

extension PilotQualFromString on String {
  PilotQual? get pilotQual {
    switch (this) {
      case "fpq":
        return PilotQual.fpq;
      case "fpc":
        return PilotQual.fpc;
      case "mp":
        return PilotQual.mp;
      case "ip":
        return PilotQual.ip;
    }
    return null;
  }
}

extension PilotQualToString on PilotQual {
  String get pretty {
    switch (this) {
      case PilotQual.fpc:
        return "FPC";
      case PilotQual.fpq:
        return "FPQ";
      case PilotQual.ip:
        return "IP";
      case PilotQual.mp:
        return "MP";
    }
  }
}

enum DayNight { day, night }

extension DayNightFromString on String {
  DayNight? get dayNight {
    switch (this) {
      case "day":
        return DayNight.day;
      case "night":
        return DayNight.night;
    }
    return null;
  }
}

extension DayNightToString on DayNight {
  String get prettyDayNight {
    switch (this) {
      case DayNight.day:
        return "Day";
      case DayNight.night:
        return "Night";
    }
  }
}

enum SortieType { local, ims, mission, ost, instmtSim, tacticsSim, mmp, lfe }

extension SortieTypeFromString on String {
  SortieType? get sortieType {
    switch (this) {
      case "local":
        return SortieType.local;
      case "ims":
        return SortieType.ims;
      case "mission":
        return SortieType.mission;
      case "ost":
        return SortieType.ost;
      case "instmtSim":
        return SortieType.instmtSim;
      case "tacticsSim":
        return SortieType.tacticsSim;
      case "mmp":
        return SortieType.mmp;
      case "lfe":
        return SortieType.lfe;
    }
    return null;
  }
}

extension SortieTypeToString on SortieType {
  String get prettySortie {
    switch (this) {
      case SortieType.local:
        return "Local";
      case SortieType.ims:
        return "IMS";
      case SortieType.mission:
        return "Mission";
      case SortieType.ost:
        return "OST";
      case SortieType.instmtSim:
        return "ISS";
      case SortieType.tacticsSim:
        return "Tactics Sim";
      case SortieType.mmp:
        return "MMP";
      case SortieType.lfe:
        return "JFE";
    }
  }
}

enum Weather { vmc, imc }

extension WeatherFromString on String {
  Weather? get weather {
    switch (this) {
      case "vmc":
        return Weather.vmc;
      case "imc":
        return Weather.imc;
    }
    return null;
  }
}
