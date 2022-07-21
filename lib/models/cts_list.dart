import 'package:app_prototype/models/grade_sheet.dart';

class CTSItem {
  // TODO add int value for keeping list location integrity
  final int id;
  final String name;
  final bool isAirdrop;
  final String performance;
  final String standards;

  CTSItem(this.id, this.name, this.isAirdrop, this.performance, this.standards);
}

//Map<String, CTSItem> ctsList = {};

// Hard coded list of all grading parameters, Could be replaced with a database in order to allow new grading parameters
List<CTSItem> ctsItems = [
  CTSItem(
      1,
      "Communication Skills",
      false,
      "Effectively expresses thoughts or information. Convey information logically, with explanation, in a professional manner.",
      "Utilizes support aids and briefings to convey information and communicate at recipients' comprehension level(s). Leaves no doubt as to information presented and is clear, concise, listens, interprets, is efficient, and receives feedback. IP Only: Demonstrates an ability to instruct others in an efficient and effective manner."),
  CTSItem(
      2,
      "Systems Knowledge",
      false,
      "Utilizes systems knowledge to accomplish normal and abnormal aircraft systems operations.",
      "Identify, understand, explain, analyze and create solutions on knowledge principals, and skills surrounding: a. Technical knowledge of the aircraft and its systems as outlined in: TO 1C-17A-1, TO 1C-17A-1-2, TO 1C- 17A-1-4, TO 1C-17A-1-1, and other flight manuals (as applicable). b. Utilizes appropriate checklists, successfully load HQ, secure voice, and SATCOM, as well as successfully checked with another aircraft, if available."),
  CTSItem(
      3,
      "Combat Governing Documents",
      false,
      "Utilizes tactical governing documents (SPINS, ATO, etc) to correctly and effectively operate in a combat environment.",
      "Identify, understand, explain, analyze and create solutions on knowledge principals, and skills surrounding: a. Tactical principals outlined in AFTTP 3-3.C-17, and AFTTP 3-1.C-l7A, DTB, ATO, ACO, governing documents, and SPINS (as applicable)."),
  CTSItem(
      4,
      "Threat Analysis & Mitigation/ Intel Integration",
      false,
      "Demonstrates level of understanding of threat laydown, kinetic and non-kinetic threats and supporting intelligence.",
      "a. Demonstrates ability to keep the mission within the given Acceptable Level of Risk (ALR). b. Organizes and applies intel information and threat knowledge in a manner that can be applied to the mission and tactical scenario. c. Kinetic Threats. Demonstrates application of: intel integration, threat mitigation techniques, exposure time, exploiting enemy TTPs, defensive systems use, and applicable preemptive/reactive tactics. d. Non-kinetic threats. Ability to utilize preemptive/reactive tactics including: EM spectrum management, EMCON signature awareness, GPS/Communications jamming counter tactics, etc e. Selects correct tactics that maximize combined effectiveness against IR, ADA, RF, airborne, jamming, passive detection, and/or CBRNE threats, with proper threat prioritization. f. Identifies and exploits the adversary's weaknesses in order to minimize risk while ensuring mission success. g. Plans sound tactics with knowledge of aircraft performance, terrain, geography, and effective use of aircraft defensive systems. Ability to establish effective commit/maneuvering points to minimize threat exposure."),
  CTSItem(5, "Mission Planning", false,
      '''Utilizes tools available to plan a mission and apply
those tools in a scenario.''', '''Mission plan uses applicable directives and
commander’s intent/ALR. Minor deviations that do not
detract from mission success allowed.
Recommended products (as needed):
- Computer Flight Plan (to include bank angles, pre-
mission configuration, and fuel planning).
- Low Level Chart
- Bullseye Chart
- Route/LZ/DZ Stick (with terrain analysis)
- Comm Card/Mission Data Card
- Commit Points/Maneuvering Points
- VFR chart
- Threat analysis
- Ground Movement Plan
- Giant Reports
- Special Departure Procedures
- Host Nation Products'''),
  CTSItem(
      6,
      "Combat Communications/Brevity",
      false,
      "Demonstrates knowledge of SV/HQ and or SATCOM procedures, combat communication procedures, authentication, brevity, etc.",
      "a. Correctly utilizes, understands, and reacts to brevity terms. b. Complies with the communications plan and procedures. Ensures transmissions were concise with correct terminology. Complies with and acknowledges all required instructions while minimizing missed information."),
  CTSItem(
      7,
      "Tactical Airspace Awareness/Flight Procedures",
      false,
      "Operates equipment, perform mission duties, used FalconView moving map, DRC, or tactics developed MFD overlays.",
      "Tracks and maintains awareness of airspace throughout Correctly enters coordinates for an ACM (ROZ, killbox/keypad, etc) into the Mission Computer/DTB moving map. Correctly identifies present position with reference to the TAC airspace structure, such as bullseye or CGARS (killbox/keypad). Demonstrates ability to recognize airspace to avoid due to C2 restrictions."),
  CTSItem(
      8,
      "Defensive System Setup/Operation",
      false,
      "Setup and operates defensive systems against a threat in a given tactical scenario.",
      "Demonstrates proper understanding of how to enable and use all C-17 defensive systems. Demonstrates understanding of each C-17 defensive system by operating it, or explaining how each system works, and which threats it is effective/ineffective against."),
  CTSItem(
      9,
      "Tactical Departure Planning/Execution",
      false,
      "Demonstrates proper tactical departure procedures based off performance, or for a given threat scenario (radar, IR, small arms, ADA, terrain, etc.)",
      "a. Plans a departure which maximizes mission success and minimizes risks for the given scenario by accurately considering: aircraft performance, terrain, environmental conditions, LZ attributes, ground support capabilities, airspace restrictions, and/or threat and asset deconfliction. b. Follows procedures as briefed or required by tactical scenario. Smooth, positive control throughout the departure. Aircraft avoids or mitigates exposure to briefed or actual threat. Maintains airspeed +/- 10 kts of target, levels off within +/- 500ft of planned level off altitude. Clears area of intended flight."),
  CTSItem(
      10,
      "Low Level & VFR Planning/Execution",
      false,
      "Plans and executes a low level or VFR route to an objective area while maintaining situational awareness of known threat locations.",
      "a. Planning: Demonstrates sufficient knowledge of AFTTP 3-3.C-17A low-level or VFR planning procedures, AFMAN 11-2C-17V3, AFMAN 11-202V3, AP, GP, and other governing directives, FalconView/CFPS/JMPS features and product production to include minimum required documents to successfully complete mission. (bullseye chart, DTED analysis, and SLAT, etc). b. Fly low level or VFR IAW briefed plan; deviations are for mission necessity (threat/traffic/bird/weather avoidance, ATC instruction, time control, etc). Maintain thorough knowledge of time status with relation to objective area. Comply with all altitude/airspace restrictions. Displays thorough knowledge of mission computer flight plan management. Uses GPS denied navigation TTPs as applicable."),
  CTSItem(
      11,
      "Time Control",
      false,
      "Utilizes various timing techniques to arrive at a defined fix.",
      "Crosses the defined fix within 60 seconds of desired time (-60/+60 sec). a. Departs high/low altitude holding at designated time, b. Establishes and meets TOA at an airfield, DZ, or CT."),
  CTSItem(12, "Air Refueling", false, "Demonstrates sustained contacts.",
      "a. Establishes and maintains proper refueling position. Aircraft control is positive and smooth. Shows complete knowledge of rendezvous and closure procedures. Accomplishes rendezvous with formation of tankers, moved between tankers, as applicable. Accomplishes IAW applicable checklists and governing directives. b. Accomplish IAW briefed ATP-3.3.4.2 EMCON level."),
  CTSItem(
      13,
      "Tactical Arrival Planning/Execution",
      false,
      "Demonstrates proper tactical arrival planning and execution procedures (2/4 TR descent, High-Low transition, etc) for a given aircraft performance, or threat scenario (radar, IR, small arms, ADA, terrain, etc.)",
      "a. Plans arrival which maximizes mission success and minimizes risks for the given scenario by accurately considering: aircraft performance, environmental conditions, objective area analysis, ground support capabilities, airspace restrictions, and/or threat and asset deconfliction. b. Follows procedures as planned/briefed. Smooth, positive control throughout the recovery. Aircraft in position to intercept glide path to ALZ or normal runway. Maintains airspeed +/- 10% of target, levels off within +/- 2NM and +/- 500ft of planned level off altitude and distance. Clears area of intended flight."),
  CTSItem(
      14,
      "Assault Landing",
      false,
      "Demonstrates proper procedures for full flap assault landing on a runway certified for assault operations IAW AFI 13-217 or a runway marked appropriately for practice assault operations.",
      "Maintains smooth approach path. Maintains constant control of flight path vector or made positive corrections. Touches down on centerline within the marked zone within the published sink rate limitations. Maintains runway centerline during rollout. Airspeed +/- 5 kts."),
  CTSItem(
      15,
      "Semi Prepared Runway Operations",
      false,
      "Plans and flies mission into a threat environment that includes at least 3 of the following types of threats: IR, ADA, RF, airborne, jamming, passive detection, and/or CBRNE threats. Applies to formation threat maneuvers.",
      "a. Performs SPRO landing procedures and follows guidance in TO 1C-17A-1 and TO 1C-17A-1-1. b. Calculates landing and predicted takeoff weight in flight before landing. Ensures weights follow guidance in TO 1C-17A-1 and TO 1C-17A-1-1. c. Performs applicable ground checklist IAW TO 1C- 17A-1 (i.e. Dusty Airfield Environmental Procedure). d. Perform alternate takeoff procedures and guidance in TO 1C-17A-1 and TO 1C-17A-1-1."),
  CTSItem(
      16,
      "Pre-emptive / Reactive Tactics",
      false,
      "Plans and flies mission into a threat environment that includes at least 3 of the following types of threats: IR, ADA, RF, airborne, jamming, passive detection, and/or CBRNE threats. Applies to formation threat maneuvers.",
      "Pre-emptive: Demonstrates ability to formulate a plan of action to avoid lethal range and/or detection of given threat system. Adequately analyzes and degrades all threats ensuring effective mitigation; maintains briefed ALR. IP Only: Demonstrates ability to instruct appropriate tactics to avoid threats and exposure. b. Reactive: Demonstrates ability to acquire potential threats, applies effective lookout techniques for all phases of flight, and executes the proper reactive maneuver in a timely manner in order to defeat a given immediate threat."),
  CTSItem(
      17,
      "Red Force Awareness / Management",
      false,
      '''Plans and flies mission into an environment with a
dynamic red force.''',
      '''Demonstrates ability to maintain a level of situational
awareness on red force status. Makes decisions
consistent with the threat, current directives, and good
judgment. Executes the plan and achieves mission goals
while adapting to a changing threat environment.'''),
  CTSItem(
      18,
      "Supporting Force Awareness / Management",
      false,
      '''Plans and flies mission into an environment with a
dynamic supporting force.''',
      '''Demonstrates ability to maintain a level of situational
awareness on supporting force status. Makes decisions
consistent with support package capabilities, min force,
current directives, and good judgment. Executes the
plan and achieved mission goals while adapting to a
changing environment based on friendly forces.'''),
  CTSItem(
      19,
      "Threat Plotting / Avoidance",
      false,
      '''Plots and avoids threats utilizing bullseye chart,
mission computer or moving map. Receive threat
location using bullseye and/or BRAA formats.''',
      '''Successfully plots a threat (in the most time appropriate
manner) based on calls given in bullseye, CGARS
(killbox/keypad), or BRAA format. Identifies threats
which pose an impact to the mission. Displays accuracy
in position reporting if requested.'''),
  CTSItem(20, "Ground Operations", false,
      '''Demonstrates proper procedures for executing taxi
operations, star turns, backing, ERO, or combat
offloads as applicable.''', '''a. Performs maneuvers safely IAW TO 1C-17A-1
procedures, AFTTP 3-3.C17A techniques, and as
briefed with appropriate power and speed management.
Maintains positive coordination with Loadmaster and
ground personnel (as required). Updates mission
computer as needed.
b. Ground operations are thoroughly pre-briefed
allowing for efficient execution of checklists. Execution
is performed to a level commensurate to mission
objectives.'''),
  CTSItem(
      21,
      "Mission Execution / Management",
      false,
      '''Executes and manages sortie objectives throughout the
mission. Applies leadership/followership, as
applicable, throughout the mission.''',
      '''a. Mission Leadership: Demonstrates the ability to
manage and lead mission execution within the scope of
assigned objectives, consistent with procedures,
briefings, and threats. Relays information to assigned
crew, other aircraft, and applicable parties both internal
and external. Coordinates maneuver, intent, and
contingency actions with other mission agencies (C2,
Mission Commander, etc.). Stays ahead of mission
status and determined collective actions to ensure the
commander's intent and mission objectives are met
within the scope of acceptable risk. Acts as a conduit of
information and direction between other leaders and
followers participating in the sortie/mission. Ensures
communication occurs and is disseminated in order to
enable/support objectives and events. Adapts to
changing mission conditions and deviations from the
standard or briefed plan when appropriately necessary.
b. Mission Followership: Demonstrates the ability to
comply with the direction of the IP, AC, or MC, and
pass relevant information in an efficient and effective
manner, positively contributing to leadership's
situational awareness and decision-making ability.
Stays ahead of mission and is prepared to take
command of the sortie if necessary.'''),
  CTSItem(22, "Situational Awareness / In-Flight Decision Making", false,
      '''Makes key decisions throughout the mission that
impacted overall success and maintains a high degree
of understanding and comprehension of events and
ALR.''', '''Demonstrates ability to identify and react to situations,
contingencies, and alternatives. Aides in the ability to
gather and cross check relevant data and use facts to
determine solutions. Acts decisively when required and
makes timely decisions contributing to mission success.
Anticipates the need for future action. Provides clearly
stated decisions and provides rationale for decisions
(when appropriate).'''),
  CTSItem(
      23,
      "Crew Coordination / Crew Resource Management (CRM)",
      false,
      "Applies CRM skills throughout mission.",
      '''a. Effectively coordinates with other aircrew members
throughout the assigned mission.
b. Demonstrates knowledge of other crewmembers’
duties and responsibilities, which contributes to safety
of flight and mission accomplishment.
c. Ensures crew members are thoroughly briefed,
assigns roles and responsibilities relevant to the scope
of each individual crew member’s capabilities and
responsibilities while identifying crunch points in the
sortie.'''),
  CTSItem(
      24,
      "Automation Management",
      false,
      "Demonstrates use of automation/autopilot.",
      '''Adheres to, and demonstrates appropriate knowledge of,
published guidance regarding the operation of automated
aircraft flight systems, Pilot Flying (PF) or Pilot
Monitoring (PM) flight automation responsibilities, and
Verbalize, Verify, and Monitor (VVM) procedures as
they relate to flight automation. Proficiently programs,
reviews, verifies, and operates automated flight systems
at suitable levels to enhance situational awareness and/or
to reduce pilot workload. Either makes no flight
automation errors or quickly identifies and mitigates
those errors.'''),
  CTSItem(
      25,
      "Pilot Monitoring",
      false,
      '''Accomplishes duties as PM during all phase of flight
(ALZ, AR, Low Level, Landing, etc).''',
      '''Effectively monitors aircraft configuration, energy state,
performance, radios, and flight path. Supports PF by
advising and intervening, as appropriate. Complies with
applicable flight policies and procedures and makes
required flight callouts (e.g., mandatory advisory calls,
VVM, etc.). Remains vigilant to identify, communicate,and mitigate events or distractions that may adversely
affect safe flight operations. Watchful of and
communicates erroneous or conflicting aircraft
instrumentation, incongruent control inputs, and
inaccurate navigational information. Effectively
addresses aircraft system failures and any unexpected
aircraft flight guidance, performance, or configuration.'''),
  CTSItem(26, "Takeoff", false, "Demonstrates takeoff.",
      '''Maintains smooth, positive aircraft control throughout
the takeoff. Performs the takeoff IAW flight manual and
as published or directed/briefed.'''),
  CTSItem(27, "Touch-And-Go", false, "Demonstrates touch-and-go procedure.",
      '''Maintains proper crosswind controls and procedures
followed IAW flight manual / AFTTP 3-3.C-17A.'''),
  CTSItem(28, "Landing", false, '''Demonstrates normal or full-flap landing.
Specific items to grade include aim point, threshold
altitude, airspeed, sink rate, runway alignment, power
push, power management, touchdown attitude, landing
in a crab, and adherence to Stabilized Approach
Criteria IAW AFMAN 11-2C-17V3.''',
      '''a. Performs landings as published/directed IAW flight
manual and C-17 specific guidance for stabilized
approach criteria as outlined in the AFMAN 11-2C-
17V3:
Airspeed: +5/-0 KIAS
Touchdown zone: 500-2,000 feet
Centerline: +/-15 feet left or right
b. Full Stop: Performs as published and/or
directed/briefed IAW flight manual. Braking action and
reverse thrust appropriate to environmental conditions
and aircraft state. Maintains centerline during landing
ground roll.'''),
  CTSItem(29, "Go Around / Missed Approach", false,
      '''Demonstrates a go-around and/or missed approach
procedure.''', '''a. Initiates and performs go-around promptly IAW flight
manual and directives. Applies smooth control inputs.
Adheres to flight director guidance and makes
configuration changes IAW flight manual.
b. Executes missed approach IAW with published
procedures or complies with controller’s instructions.
Applies smooth control inputs.'''),
  CTSItem(
      30,
      "Instrument Departure",
      false,
      "Plans and executes instrument departure.",
      '''Complies with all restrictions and/or controlling agency
instructions. Makes all required reports. Applies course
or heading corrections promptly. Demonstrates smooth,
positive control.
Adheres to C-17A Departure Planning Checklist,
AFMAN 11-202V3, AFMAN 11-2C-17V3, FLIP, and
other directives as required.'''),
  CTSItem(31, "En Route Navigation", false,
      '''Demonstrates proper en-route instrument or VFR
navigation.''', '''Navigates using all available means. Uses appropriate
navigation procedures. Complies with clearance
instructions. Aware of position at all times.
Adheres to procedural airspace requirements (Red Sea
Procedures, NAT Doc 007, PACOTS, etc).'''),
  CTSItem(
      32,
      "Instrument Holding",
      false,
      '''Performs high and/or low altitude holding within
defined criteria (EFC time, DME, etc).''',
      '''Performs entry and holding IAW published directives
and TTPs. Takes into account wind corrections.
Timing: +/-30 seconds holding leg length
DME: +/-2 DME
Azimuth: Within two dots (ILS/MLS)'''),
  CTSItem(33, "Instrument Descent / Arrival", false,
      '''Demonstrates proper instrument descent and/or arrival
procedures.''', '''Performs descent as directed. Complies with all flight
manual, controller-issued and/or STAR restrictions in a
proficient manner. Accomplishes all required checks.'''),
  CTSItem(34, "Instrument Approach", false, '''Demonstrates approach procedures.
a. ILS
b. PAR
c. CAT II ILS
d. MLS
e. LOC
f. TACAN/VOR(DME)
g. RNAV
h. ASR/Other''', '''Accomplishes approach IAW published procedures.
Uses appropriate descent rate to remain on glideslope.
Uses appropriate descent rate to arrive at MDA at or
before Visual Descent Point (VDP). Position permits a
safe landing. Smooth and timely response to controller’s
instructions (PAR/ASR). If accomplishing an RNAV
approach verify RAIM and RNAV mission computer
data vs IAP (leg lengths, headings and altitudes). Utilizes
CDFA procedures effectively. Maintains composite
crosscheck.
Airspeed: +10/-5 KIAS
Altitude: Initiated missed approach at decision
altitude +50/-0 feet
Heading: +/-5 degrees of controller’s instructions
(PAR)
Glide Slope: Within one dot (ILS/MLS)
Azimuth: Within one dot (ILS/MLS)
MDA: +100/-0 feet
Course: +/-5 degrees at MAP (NDB, VOR, TACAN),
less than one dot deflection (LOC, GPS)
Timing: Computed/adjusted timing to determine MAP
within 20 seconds (when required).
Distance: Determined MAP within 0.5 NM prior or
0.5 NM after actual MAP.'''),
  CTSItem(35, "Circling Approach", false, "Demonstrates circling approach.",
      '''Properly identifies aircraft category for the approach and
remains within the lateral limits for that category.
Complies with controller’s instructions. Attains runway
alignment without excessive bank angles. Does not
descend from the MDA until in a position to place the
aircraft on a normal glide path or execute a normal
landing.
Airspeed: +10/-5 KIAS.
Altitude: +100/-0 feet'''),
  CTSItem(
      36,
      "General Aircraft Control",
      false,
      "Demonstrates correct flight maneuvers or procedures.",
      '''a. Possesses a thorough knowledge and application of in-
flight maneuvers, procedures, and directives. Maneuvers
the aircraft to maintain the required/desired parameters
while complying with safety and good judgment.
b. General Tolerances:
Airspeed: +/- 5% (unless otherwise stated)
Altitude: +/-100 feet
Heading/Course: +/-5 degrees
c. Maintains smooth positive aircraft control at all times.
Avoids hazards (other airborne objects, ground
obstructions, terrain, and severe weather).'''),
  CTSItem(
      37,
      "Checklist Usage",
      false,
      "Demonstrates accurate and timely checklist usage.",
      '''a. Completes checklist IAW published guidance in a
timely manner. Enhances overall CRM, does not omit
critical steps.
b. Reacts to situations, contingencies, and alternatives
aided in the ability to gather and cross check aircraft
performance data and facts to derive checklist sequences
and solutions.'''),
  CTSItem(
      38,
      "Formation Operations - Visual Procedures",
      true,
      "Demonstrates proper visual formation procedures.",
      '''a. Establishes and maintains appropriate formations
utilizing published and briefed procedures in visual
formation (All).
b. Maintains positive control of flight/element
(AC/IP/LD). Maintains situational awareness of
formation members (FP).
c. Displays smooth control and considers the wingman
appropriately as lead. Maintains position applies
immediate corrections as wing/element lead (AC/IP/LD).
d. Understands deconfliction contracts (FP).
Communicates to other flight members and make timely
decisions to ensure adherence to deconfliction contracts
(AC/IP/LD).
e. Creatively adapts formation geometry and utilizes FM
to accomplish mission objectives and avoid threats
(IP/LD).'''),
  CTSItem(
      39,
      "Formation Operations - SKE Procedures",
      true,
      "Demonstrates proper SKE formation procedures.",
      '''a. Establishes and maintains appropriate formations
utilizing published and briefed procedures in SKE
formation (All).
b. Maintains positive control of flight/element
(AC/IP/LD). Maintains situational awareness of
formation members (FP).
c. Displays smooth control and considers the wingman
appropriately as lead. Maintains position applies
immediate corrections as wing/element lead (AC/IP/LD).
d. Understands deconfliction contracts (FP).
Communicates to other flight members and make timely
decisions to ensure adherence to deconfliction contracts
(AC/IP/LD).'''),
  CTSItem(40, "Formation Air Refueling Operations", true,
      '''Demonstrates formation (multiple receivers) air
refueling procedures.''', '''a. Executes formation air refueling movements IAW
AFTTP 3-3.C-17A and TO 1-C17A-1.
b. Establishes and maintains appropriate formation
position in awaiting AR and post AR (as required).'''),
  CTSItem(
      41,
      "Personnel Airdrop Operations",
      true,
      "Demonstrates personnel airdrop operations.",
      '''a. Positively acquires drop zone, determines CARP, and
calculates exact slowdown profile required for TOT.
b. Executes according to plan and per procedures
outlined in AFTTP 3-3.C-17A (proper deck angle,
airspeed, drift kill heading etc), TO 1-C17A-1-4, and
applicable directives.
c. Makes positive adjustments based off wind, weather,
threat or mission conditions.
d. Displays skill level on mission computer setup, and
operations.
e. Establishes and maintains appropriate formations
position and spacing.'''),
  CTSItem(42, "Equipment Airdrop Operations", true,
      '''Demonstrates equipment (CDS, Heavy, DRAS) airdrop 
operations.''', '''a. Positively acquires drop zone, determines CARP, and
calculates exact slowdown profile required for TOT.
b. Executes according to plan and per procedures
outlined in AFTTP 3-3.C-17 (proper deck angle,
airspeed, drift kill heading etc), TO 1-C17A-1-4, and
applicable directives.
c. Makes positive adjustments based off winds, weather,
threat or mission conditions.
d. Displays skill level on mission computer setup,
alternate airdrop methods (if applicable) and ADE
considerations.
e. Establishes and maintains appropriate formations
position in both SKE and visual.'''),
  CTSItem(
      43,
      "High Altitude Airdrop Operations",
      true,
      '''Ability to execute high altitude airdrop operations
(HALO, JAPDS etc) with proficiency.''',
      '''a. Positively acquires drop zone, determines HARP,
CARP, etc and calculates exact slowdown profile
required for TOT.
b. Executes according to plan and per procedures
outlined in AFTTP 3-3.C-17A (proper deck angle,
airspeed, drift kill heading etc), TO 1-C17A-1-4, and
applicable directives.
c. Makes positive adjustments based off wind, weather,
threat or mission conditions.
d. Displays skill level on mission computer setup, usage,
alternate airdrop methods (if applicable) and high altitude
considerations.'''),
  CTSItem(
      44,
      "Precision Airdrop System Operator",
      true,
      '''Ability to execute precision airdrop system (PADS) as
the operator with proficiency.''',
      '''a. Executes according to procedures outlined in AFTTP
3-3.C-17A, TO 1-C17A-1-4, and applicable directives.
b. Displays skill level on AGU, dropsondes, CF-20 and
mission computer setup/usage.'''),
];

// For calling with new GradeSheets
List<GradeItem> baseGradeItems =
    ctsItems.map((item) => GradeItem(name: item.name)).toList();

List<GradeDescription> gradeDescriptions = [
  GradeDescription("Expert (4)",
      'Grades earning a “4” represent an unusually high degree of ability and reflect “Expert” level performance. Expert level performance encompasses an individual’s ability to successfully perform a specific skill/task/topic with an extraordinary level of ability, speed, accuracy, safety, and technique in a highly stressful and/or complex environment. Can evaluate/explain/describe facts/principles and nomenclature/terms and/or perform and create new concepts/techniques involved in the skillset/subject.'),
  GradeDescription("Proficient (3)",
      'Grades of “3” are labeled "Proficient" and are consistent with performance that is correct, skillful, and without hesitation. Proficient level performance encompasses an individual\'s ability to successfully and decisively perform a specific skill with full understanding of actions, reactions, and applications under various circumstances and when exposed to various environments. Can analyze, state, describe facts/principles and nomenclature/terms and/or preform procedures and techniques involved in a skillset/subject with no assistance from an instructor; and little to no doubt remains in the operator\'s ability to perform the event.'),
  GradeDescription("Familiar (2)",
      'A grade of “2” is considered “Familiar” and represents performance that is essentially correct. Although some areas of imprecision or flaws exist, the skill was accomplished satisfactorily given a specific set of circumstances and/or environments. Can state/discuss facts and nomenclature/terms and/or perform procedures and basic techniques involved in a skill/subject with some assistance from an instructor; and the use of the specific skill was generally effective and, despite relatively minor errors, performance contributed positively towards the desired goal.'),
  GradeDescription("Introductory (1)",
      '“Introductory” grades are labeled “1” and are based on performance that is marginal or limited in proficiency. Introductory level performance indicates an inability to achieve a familiar or proficient level of accomplishment and accuracy, not because of a fundamental lack of knowledge of the required skill, but due to a lack of experience, proper execution, technique, or application. Can identify basic facts and state nomenclature/terms and/or perform basic procedures involved in the skill/subject with significant assistance from an instructor. This the lowest passing grade possible.'),
  GradeDescription("Unsatisfactory (0)",
      'Performance indicating a lack of ability or knowledge is deemed “Unsatisfactory” and will be graded as “0”. The student is unsafe, showed dangerous tendencies, unable, or lacks sufficient knowledge, skill or ability to perform the operation, maneuver, or task.'),
  GradeDescription("No Grade (NG)",
      'The instructor demonstrates a maneuver the pilot does not practice or performance was not observed, element was not performed.'),
  GradeDescription("NOTES",
      'Crewmembers graded an unsatisfactory (0) on any required individual task should not receive any higher overall sortie grade than Familiar (2). Likewise, instructors should consider awarding an overall grade of (0) if the same specific procedure is graded as unsatisfactory (0) three sorties in a row. A Crewmember’s performance is expected to improve during training and upgrade, and lack of progression will be reflected in the overall grade.'),
];

class GradeDescription {
  final String proficiencyGrade;
  final String description;
  GradeDescription(this.proficiencyGrade, this.description);
}

List<TableDescription> tableDescriptions = [
  TableDescription(1, "Communication Skill", 1, 2, 3, 3),
  TableDescription(2, "Systems Knowledge", 2, 2, 3, 3),
  TableDescription(3, "Combat Governing Documents", 1, 2, 3, 3),
  TableDescription(
      4, "Threat Analysis & Mitigation/Intel Integration", 1, 2, 3, 3),
  TableDescription(5, "Mission Planning", 2, 2, 3, 3),
  TableDescription(6, "Combat Communication / Brevity", 1, 2, 2, 3),
  TableDescription(
      7, "Tactical Airspace Awareness / Flight Procedures", 1, 2, 3, 3),
  TableDescription(8, "Defensive System Setup / Operation", 2, 3, 3, 3),
  TableDescription(9, "Tactical Departure Planning / Execution", 1, 2, 3, 3),
  TableDescription(10, "Low Level & VFR Planning / Execution", 2, 2, 3, 3),
  TableDescription(11, "Time Control", 1, 2, 3, 3),
  TableDescription(12, "Air Refueling", 1, 2, 3, 3),
  TableDescription(13, "Tactical Arrival Planning / Execution", 1, 2, 3, 3),
  TableDescription(14, "Assault Landing", 1, 2, 3, 3),
  TableDescription(15, "Semi Prepared Runway Operations", 1, 2, 3, 3),
  TableDescription(16, "Pre-Emptive / Reactive Tactics", 2, 2, 3, 3),
  TableDescription(17, "Red Force Awareness / Management", 1, 1, 2, 3),
  TableDescription(
      18, "Supporting Force Awareness / Management (C2)", 1, 1, 2, 3),
  TableDescription(19, "Threat Plotting / Avoidance", 2, 2, 3, 3),
  TableDescription(20, "Ground Operations", 2, 2, 3, 3),
  TableDescription(21, "Mission Execution / Management", 1, 2, 3, 3),
  TableDescription(
      22, "Situational Awareness / In-Flight Decision Making", 2, 2, 3, 3),
  TableDescription(23, "Crew Coordination / CRM", 2, 2, 3, 3),
  TableDescription(24, "Automation Management", 2, 2, 3, 3),
  TableDescription(25, "Pilot Monitoring", 2, 3, 3, 3),
  TableDescription(26, "Takeoff", 2, 3, 3, 3),
  TableDescription(27, "Touch-and-Go", 2, 2, 3, 3),
  TableDescription(28, "Landing", 2, 3, 3, 3),
  TableDescription(29, "Go Around / Missed Approach", 2, 3, 3, 3),
  TableDescription(30, "Instrument Departure", 2, 2, 3, 3),
  TableDescription(31, "En Route Navigation", 1, 2, 3, 3),
  TableDescription(32, "Instrument Holding", 2, 2, 3, 3),
  TableDescription(33, "Instrument Descent / Arrival", 2, 2, 3, 3),
  TableDescription(34, "Instrument Approach", 2, 2, 3, 3),
  TableDescription(35, "Circling Approach", 2, 2, 3, 3),
  TableDescription(36, "General Aircraft Control", 2, 2, 3, 4),
  TableDescription(37, "Checklist Usage", 2, 3, 3, 4)
];

List<AirDropTableDescription> airDropDescriptions = [
  AirDropTableDescription(
      38, "Formation Operations - Visual Procedures", 2, 3, 3, 4),
  AirDropTableDescription(
      39, "Formation Operations - SKE Procedures", 2, 3, 3, 4),
  AirDropTableDescription(40, "Formation Air Refueling Operations", 2, 3, 3, 4),
  AirDropTableDescription(41, "Personnel Airdrop Operations", 2, 3, 3, 4),
  AirDropTableDescription(42, "Equipment Airdrop Operations", 2, 3, 3, 4),
  AirDropTableDescription(43, "High Altitude Airdrop Operations", 2, 3, 3, 3),
  AirDropTableDescription(44, "Precision Airdrop System Operator", 2, 3, 3, 3)
];

class TableDescription {
  final int id;
  final String ctsItem;
  final int fpc;
  final int fpq;
  final int mp;
  final int ip;
  TableDescription(this.id, this.ctsItem, this.fpc, this.fpq, this.mp, this.ip);
}

class AirDropTableDescription {
  final int id;
  final String ctsItem;
  final int cpad;
  final int acad;
  final int adip;
  final int ldad;
  AirDropTableDescription(
      this.id, this.ctsItem, this.cpad, this.acad, this.adip, this.ldad);
}
