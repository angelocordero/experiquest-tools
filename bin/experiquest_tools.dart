List<String> datas = [
  '''
PRACTICAL RESEARCH 1 
Module 1: Chapter 1
Lesson 5: Definition of Terms

1. What is the primary purpose of the Definition of Terms section in a research study?
A) To present the research findings in a concise manner
B) To clarify significant terms and concepts used in the study
C) To summarize the literature review
D) To provide a general overview of the methodology

2. Which of the following is an example of a theoretical definition of terms?
A) Children with special needs refer to children with disabilities in Manila's slum areas.
B) Children with special needs are children with any of the following disabilities: mental retardation, speech impairment, etc.
C) Children with special needs are those who are diagnosed by a medical professional.
D) Children with special needs are those participating in a school-based program.

3. In the operational definition of terms, how are terms described?
A) Based on their common, ordinary meaning
B) Based on how they are used in the context of the study
C) According to their dictionary definitions
D) In relation to historical events and findings

4. What is the difference between theoretical and operational definitions of terms?
A) Theoretical definitions focus on the context of the study, while operational definitions are based on common meanings.
B) Theoretical definitions provide specific details related to the study, while operational definitions focus on general meanings.
C) Theoretical definitions describe terms in general terms, while operational definitions are specific to the study's context.
D) There is no significant difference between theoretical and operational definitions.

5. Why is it important to have reliable definitions of terms in a research study?
A) To ensure that the study’s methodology is fully detailed
B) To clarify any confusion for the readers and maintain consistency in the research
C) To make the study sound more professional
D) To avoid including too many variables in the study


''',
];

void main() {
  for (int i = 0; i < datas.length; i++) {
    int index = i + 9;

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
          question: "${getSentenceAfterString(data: data, string: '1.', delimiter: '?')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '1.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '1.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '1.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '1.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '2.', delimiter: '?')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '2.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '2.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '2.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '2.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '3.', delimiter: '?')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '3.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '3.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '3.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '3.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '4.', delimiter: '?')}",
          answer: ,
          choices: {
            Choice.A: "${getSentenceAfterString(data: data, string: 'A)', startingString: '4.')}",
            Choice.B: "${getSentenceAfterString(data: data, string: 'B)', startingString: '4.')}",
            Choice.C: "${getSentenceAfterString(data: data, string: 'C)', startingString: '4.')}",
            Choice.D: "${getSentenceAfterString(data: data, string: 'D)', startingString: '4.')}",
          },
        ),
        Question(
          question: "${getSentenceAfterString(data: data, string: '5.', delimiter: '?')}",
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
