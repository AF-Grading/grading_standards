enum Grade {
  noSelection,
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
      case "noSelection":
        return Grade.noSelection;
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

enum AdQual { noSelection, none, ldad, adid, acad, cpad }

extension AdQualFromString on String {
  AdQual? get adQual {
    switch (this) {
      case "noSelection":
        return AdQual.noSelection;
      case "none":
        return AdQual.none;
      case "ldad":
        return AdQual.ldad;
      case "adid":
        return AdQual.adid;
      case "acad":
        return AdQual.acad;
      case "cpad":
        return AdQual.cpad;
    }
    return null;
  }
}

enum PilotQual { noSelection, fpq, fpc, mp, ip }

extension PilotQualFromString on String {
  PilotQual? get pilotQual {
    switch (this) {
      case "noSelection":
        return PilotQual.noSelection;
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

enum DayNight { noSelection, day, night }

extension DayNightFromString on String {
  DayNight? get dayNight {
    switch (this) {
      case "noSelection":
        return DayNight.noSelection;
      case "day":
        return DayNight.day;
      case "night":
        return DayNight.night;
    }
    return null;
  }
}

enum SortieType {
  noSelection,
  local,
  ims,
  mission,
  ost,
  instmtSim,
  tacticsSim,
  mmp,
  lfe
}

extension SortieTypeFromString on String {
  SortieType? get sortieType {
    switch (this) {
      case "noSelection":
        return SortieType.noSelection;
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

enum Weather { noSelection, vmc, imc }

extension WeatherFromString on String {
  Weather? get weather {
    switch (this) {
      case "noSelection":
        return Weather.noSelection;
      case "vmc":
        return Weather.vmc;
      case "imc":
        return Weather.imc;
    }
    return null;
  }
}
