List<String> datas = [
  '''PRACTICAL RESEARCH 1 
Module 1: Chapter 1
Lesson 4: Scope and Delimitation of the Study


1. What does the scope of a study refer to?
A) The constraints and limitations of the study
B) The boundaries of the research design and methodology
C) The range and depth at which the research will be explored
D) The variables and their characteristics being studied

2. How do delimitations in a study differ from the scope?
A) Delimitations focus on the range of data interpretation, while scope focuses on the variables.
B) Delimitations describe the boundaries and constraints the researcher sets, while the scope defines the range of the study.
C) Delimitations refer to the research methods used, while the scope defines the research questions.
D) Delimitations are irrelevant in the context of research design and methodology.

3. What is an example of a delimitation in a study on bullying among teenagers?
A) Including all age groups in the study
B) Focusing only on cyberbullying among teenagers in urban areas
C) Including both adults and teenagers in the study
D) Studying bullying in both rural and urban areas without distinction

4. What does the term "construct" refer to in the context of a study's variables?
A) A collection of characteristics that can be found in a dictionary
B) A new characteristic that results from conducting the research
C) A concept that refers to existing definitions in textbooks
D) A research method used to manipulate variables

5. Which of the following is NOT typically covered in the scope and delimitation of a study?
A) The time frame for the study
B) The specific issues being addressed
C) The personal opinions of the researcher
D) The participants' age, sex, or traits


'''
];

void main() {
  for (int i = 0; i < datas.length; i++) {
    int index = i + 5;

    String data = datas[i];

    int module = getNumberAfterString(data: data, string: 'Module');
    int chapter = getNumberAfterString(data: data, string: 'Chapter');
    int lesson = getNumberAfterString(data: data, string: 'Lesson');

    String level = '''
    Level(
      level: $index,
      levelName: Module $module Chapter $chapter Lesson $lesson,
      monsterName: '???',
      monsterFilename: 'assets/images/monsters/lvl${index % 3}_monster.png'
      bg: 'assets/images/backgrounds/lvl${index % 3}_bg.png',
      lesson: ref.read(reviewersProvider)[${module - 1}].modules[${chapter - 1}].lesson[${lesson - 1}],
      Question(
        question: "${getSentenceAfterString(data: data, string: '1. ')}",
        choices: {
          Choice.A: "${getSentenceAfterString(data: data, string: 'A)')}"
          Choice.B: "${getSentenceAfterString(data: data, string: 'B)')}"
          Choice.C: "${getSentenceAfterString(data: data, string: 'C)')}"
          Choice.D: "${getSentenceAfterString(data: data, string: 'D)')}"
        },
      ),
    ),
    ''';

    print(level);
  }
}

int getNumberAfterString({required String data, required String string}) {
  // Use a regular expression to find "Module" followed by a number.
  final regex = RegExp('$string (\\d+)');
  final match = regex.firstMatch(data);

  // If a match is found, parse the number and return it.
  if (match != null) {
    return int.parse(match.group(1)!);
  }

  throw Exception('no match for $string');
}

String? getSentenceAfterString({required String data, required String string}) {
  // Create a regular expression to match the target string followed by a newline, period, or question mark,
  // then capture the sentence after it.
  final regex = RegExp(
    r'(?<=\b' + RegExp.escape(string) + r')[\.\n\?]\s*(.*?)(?=[\.\n\?]|\s|$)',
    multiLine: true,
  );

  final match = regex.firstMatch(data);

  if (match != null) {
    return match.group(1);
  }

  throw Exception('No match for $string');
}
