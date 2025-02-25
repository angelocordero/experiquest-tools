import 'dart:io';

List<String> datas = [
  '''
PRACTICAL RESEARCH 1 
Module 5: Chapter 5
Lesson 3: Recommendations

1. According to Barrot (2022), what is a critical aspect of writing recommendations?
A) They should address limitations of the study that were unavoidable during research.
B) They must provide general solutions applicable to any field of study.
C) They should propose remedies for every constraint encountered in the study.
D) They must avoid aligning with the study's conclusions.

2. Which of the following is an appropriate focus for recommendations?
A) Suggesting theoretical research that lacks practical application.
B) Proposing detailed solutions that directly address agenda issues from the findings.
C) Reiterating findings without offering actionable solutions.
D) Avoiding future studies to concentrate on current limitations.

3. What makes recommendations specific and practical?
A) Generalizing solutions for use across multiple contexts
B) Avoiding direct alignment with the study’s conclusions
C) Outlining detailed, feasible plans of action based on the research findings
D) Proposing actions that are theoretical and difficult to implement

4. What makes a recommendation feasible and specific?
A) It is directly linked to the conclusions and proposes clear actions.
B) It discusses the findings broadly to include various contexts.
C) It focuses on theoretical implications rather than practical solutions.
D) It generalizes the findings to cover populations outside the study’s scope.

5. When addressing study limitations, what is the best approach?
A) Recommend improvements for limitations that were unavoidable.
B) Include all limitations, even those that could have been resolved during the study.
C) Ignore limitations and focus only on findings.
D) Avoid discussing limitations to keep the recommendations concise.
''',
];

void main() {
  for (int i = 0; i < datas.length; i++) {
    int index = i + 21;

    String data = datas[i];

    int module = getNumberAfterString(data: data, string: 'Module');
    int chapter = getNumberAfterString(data: data, string: 'Chapter');
    int lesson = getNumberAfterString(data: data, string: 'Lesson');

    String level = '''
    Level(
      level: $index,
      levelName: Module $module Chapter $chapter Lesson $lesson,
      monsterName: '???',
      bg: 'assets/images/backgrounds/lvl${index % 3}_bg.png',
      monsterFilename: 'assets/images/monsters/lvl${index % 3}_monster.png',
      lesson: ref.read(reviewersProvider)[${module - 1}].modules[${chapter - 1}].lesson[${lesson - 1}],
      questions: [ 
        Question(
          question: "${getSentenceAfterString(data: data, string: '1.',)}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '1.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '1.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '1.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '1.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '2.')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '2.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '2.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '2.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '2.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '3.')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '3.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '3.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '3.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '3.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '4.')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '4.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '4.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '4.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '4.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '5.')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '5.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '5.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '5.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '5.')}",
          },
        ),
      ]
    ),
    ''';

    print(level);

    File file = File('output.txt');
    file.writeAsStringSync(level ,mode: FileMode.append);
  }
}

int getNumberAfterString({required String data, required String string}) {
  final regex = RegExp('$string (\\d+)');
  final match = regex.firstMatch(data);
  return int.parse(match!.group(1)!);
}

String getSentenceAfterString({
  required String data,
  required String string,
  String? startingString,
  String? delimiter,
}) {
  String substring = '';

  if (startingString != null) {
    String tmp = data.substring(data.indexOf(startingString));
    substring = tmp.substring(tmp.indexOf(string));
  } else {
    substring = data.substring(data.indexOf(string));
  }

  int indexOfDelimiter =
      delimiter != null
          ? substring.indexOf(delimiter)
          : substring.indexOf('\n');

  String question = substring.substring(2, indexOfDelimiter + 1).trim();

  return question;
}
