class Riddle{
  String question="";
  String answer="";
  String difficulty="";

  Riddle({required this.question,required this.answer,required this.difficulty});
}

final List<Riddle> allRiddles=[
  Riddle(
    question: "I have cities, but no houses; forests, but no trees; and water, but no fish. What am I?",
    answer: "A map",
    difficulty: "Easy",
  ),
  Riddle(
    question: "What has an eye, but cannot see?",
    answer: "A needle",
    difficulty: "Easy",
  ),
  Riddle(
    question: "What is full of holes but still holds water?",
    answer: "A sponge",
    difficulty: "Easy",
  ),
  Riddle(
    question: "What question can you never answer yes to?",
    answer: "Are you asleep yet?",
    difficulty: "Easy",
  ),
  Riddle(
    question: "What has to be broken before you can use it?",
    answer: "An egg",
    difficulty: "Easy",
  ),

  Riddle(
    question: "What is always in front of you but can’t be seen?",
    answer: "The future",
    difficulty: "Medium",
  ),
  Riddle(
    question: "What has a head and a tail but no body?",
    answer: "A coin",
    difficulty: "Medium",
  ),
  Riddle(
    question: "What loses its head in the morning and gets it back at night?",
    answer: "A pillow",
    difficulty: "Medium",
  ),
  Riddle(
    question: "What has words, but never speaks?",
    answer: "A book",
    difficulty: "Medium",
  ),
  Riddle(
    question: "What goes up but never comes down?",
    answer: "Your age",
    difficulty: "Medium",
  ),

  Riddle(
    question: "What can travel around the world while staying in a corner?",
    answer: "A stamp",
    difficulty: "Hard",
  ),
  Riddle(
    question: "What has an ocean but no water, a continent but no land, and mountains but no trees?",
    answer: "A globe",
    difficulty: "Hard",
  ),
  Riddle(
    question: "I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I?",
    answer: "An echo",
    difficulty: "Hard",
  ),
  Riddle(
    question: "The more you take, the more you leave behind. What am I?",
    answer: "Footsteps",
    difficulty: "Hard",
  ),
  Riddle(
    question: "What is seen in the middle of March and April that can’t be seen at the beginning or end of either month?",
    answer: "The letter 'R'",
    difficulty: "Hard",
  ),
];