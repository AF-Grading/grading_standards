//  Grade may need to be moved to another file to separate dependencies
enum Grade {
  noGrade,
  unsatisfactory,
  introductory,
  familiar,
  proficient,
  expert
}

class CTSItem {
  String name;
  Grade passingScore;
  String performance;
  String standards;

  CTSItem(this.name, this.passingScore, this.performance, this.standards);
}

//Map<String, CTSItem> ctsList = {};

// Hard coded list of all grading parameters, Could be replaced with a database in order to allow new grading parameters
List<CTSItem> ctsItems = [
  CTSItem(
      "Communication Skills",
      Grade.familiar,
      "Effectively expresses thoughts or information. Convey information logically, with explanation, in a professional manner.",
      "Utilizes support aids and briefings to convey information and communicate at recipients' comprehension level(s). Leaves no doubt as to information presented and is clear, concise, listens, interprets, is efficient, and receives feedback. IP Only: Demonstrates an ability to instruct others in an efficient and effective manner."),
  CTSItem(
      "Systems Knowledge",
      Grade.familiar,
      "Utilizes systems knowledge to accomplish normal and abnormal aircraft systems operations.",
      "Identify, understand, explain, analyze and create solutions on knowledge principals, and skills surrounding: a. Technical knowledge of the aircraft and its systems as outlined in: TO 1C-17A-1, TO 1C-17A-1-2, TO 1C- 17A-1-4, TO 1C-17A-1-1, and other flight manuals (as applicable). b. Utilizes appropriate checklists, successfully load HQ, secure voice, and SATCOM, as well as successfully checked with another aircraft, if available."),
  CTSItem(
      "Combat Governing Documents",
      Grade.familiar,
      "Utilizes tactical governing documents (SPINS, ATO, etc) to correctly and effectively operate in a combat environment.",
      "Identify, understand, explain, analyze and create solutions on knowledge principals, and skills surrounding: a. Tactical principals outlined in AFTTP 3-3.C-17, and AFTTP 3-1.C-l7A, DTB, ATO, ACO, governing documents, and SPINS (as applicable)."),
  CTSItem(
      "Threat Analysis & Mitigation/ Intel Integration",
      Grade.familiar,
      "Demonstrates level of understanding of threat laydown, kinetic and non-kinetic threats and supporting intelligence.",
      "a. Demonstrates ability to keep the mission within the given Acceptable Level of Risk (ALR). b. Organizes and applies intel information and threat knowledge in a manner that can be applied to the mission and tactical scenario. c. Kinetic Threats. Demonstrates application of: intel integration, threat mitigation techniques, exposure time, exploiting enemy TTPs, defensive systems use, and applicable preemptive/reactive tactics. d. Non-kinetic threats. Ability to utilize preemptive/reactive tactics including: EM spectrum management, EMCON signature awareness, GPS/Communications jamming counter tactics, etc e. Selects correct tactics that maximize combined effectiveness against IR, ADA, RF, airborne, jamming, passive detection, and/or CBRNE threats, with proper threat prioritization. f. Identifies and exploits the adversary's weaknesses in order to minimize risk while ensuring mission success. g. Plans sound tactics with knowledge of aircraft performance, terrain, geography, and effective use of aircraft defensive systems. Ability to establish effective commit/maneuvering points to minimize threat exposure."),
  CTSItem(
      "Combat Communications/Brevity",
      Grade.familiar,
      "Demonstrates knowledge of SV/HQ and or SATCOM procedures, combat communication procedures, authentication, brevity, etc.",
      "a. Correctly utilizes, understands, and reacts to brevity terms. b. Complies with the communications plan and procedures. Ensures transmissions were concise with correct terminology. Complies with and acknowledges all required instructions while minimizing missed information."),
  CTSItem(
      "Tactical Airspace Awareness/Flight Procedures",
      Grade.familiar,
      "Operates equipment, perform mission duties, used FalconView moving map, DRC, or tactics developed MFD overlays.",
      "Tracks and maintains awareness of airspace throughout Correctly enters coordinates for an ACM (ROZ, killbox/keypad, etc) into the Mission Computer/DTB moving map. Correctly identifies present position with reference to the TAC airspace structure, such as bullseye or CGARS (killbox/keypad). Demonstrates ability to recognize airspace to avoid due to C2 restrictions."),
  CTSItem(
      "Defensive System Setup/Operation",
      Grade.proficient,
      "Setup and operates defensive systems against a threat in a given tactical scenario.",
      "Demonstrates proper understanding of how to enable and use all C-17 defensive systems. Demonstrates understanding of each C-17 defensive system by operating it, or explaining how each system works, and which threats it is effective/ineffective against."),
  CTSItem(
      "Tactical Departure Planning/Execution",
      Grade.familiar,
      "Demonstrates proper tactical departure procedures based off performance, or for a given threat scenario (radar, IR, small arms, ADA, terrain, etc.)",
      "a. Plans a departure which maximizes mission success and minimizes risks for the given scenario by accurately considering: aircraft performance, terrain, environmental conditions, LZ attributes, ground support capabilities, airspace restrictions, and/or threat and asset deconfliction. b. Follows procedures as briefed or required by tactical scenario. Smooth, positive control throughout the departure. Aircraft avoids or mitigates exposure to briefed or actual threat. Maintains airspeed +/- 10 kts of target, levels off within +/- 500ft of planned level off altitude. Clears area of intended flight."),
  CTSItem(
      "Low Level & VFR Planning/Execution",
      Grade.familiar,
      "Plans and executes a low level or VFR route to an objective area while maintaining situational awareness of known threat locations.",
      "a. Planning: Demonstrates sufficient knowledge of AFTTP 3-3.C-17A low-level or VFR planning procedures, AFMAN 11-2C-17V3, AFMAN 11-202V3, AP, GP, and other governing directives, FalconView/CFPS/JMPS features and product production to include minimum required documents to successfully complete mission. (bullseye chart, DTED analysis, and SLAT, etc). b. Fly low level or VFR IAW briefed plan; deviations are for mission necessity (threat/traffic/bird/weather avoidance, ATC instruction, time control, etc). Maintain thorough knowledge of time status with relation to objective area. Comply with all altitude/airspace restrictions. Displays thorough knowledge of mission computer flight plan management. Uses GPS denied navigation TTPs as applicable."),
  CTSItem(
      "Time Control",
      Grade.familiar,
      "Utilizes various timing techniques to arrive at a defined fix.",
      "Crosses the defined fix within 60 seconds of desired time (-60/+60 sec). a. Departs high/low altitude holding at designated time, b. Establishes and meets TOA at an airfield, DZ, or CT."),
  CTSItem("Air Refueling", Grade.familiar, "Demonstrates sustained contacts.",
      "a. Establishes and maintains proper refueling position. Aircraft control is positive and smooth. Shows complete knowledge of rendezvous and closure procedures. Accomplishes rendezvous with formation of tankers, moved between tankers, as applicable. Accomplishes IAW applicable checklists and governing directives. b. Accomplish IAW briefed ATP-3.3.4.2 EMCON level."),
  CTSItem(
      "Tactical Arrival Planning/Execution",
      Grade.familiar,
      "Demonstrates proper tactical arrival planning and execution procedures (2/4 TR descent, High-Low transition, etc) for a given aircraft performance, or threat scenario (radar, IR, small arms, ADA, terrain, etc.)",
      "a. Plans arrival which maximizes mission success and minimizes risks for the given scenario by accurately considering: aircraft performance, environmental conditions, objective area analysis, ground support capabilities, airspace restrictions, and/or threat and asset deconfliction. b. Follows procedures as planned/briefed. Smooth, positive control throughout the recovery. Aircraft in position to intercept glide path to ALZ or normal runway. Maintains airspeed +/- 10% of target, levels off within +/- 2NM and +/- 500ft of planned level off altitude and distance. Clears area of intended flight."),
  CTSItem(
      "Assault Landing",
      Grade.familiar,
      "Demonstrates proper procedures for full flap assault landing on a runway certified for assault operations IAW AFI 13-217 or a runway marked appropriately for practice assault operations.",
      "Maintains smooth approach path. Maintains constant control of flight path vector or made positive corrections. Touches down on centerline within the marked zone within the published sink rate limitations. Maintains runway centerline during rollout. Airspeed +/- 5 kts."),
];
