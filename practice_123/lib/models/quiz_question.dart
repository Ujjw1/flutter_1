class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> get suflelist {
    final sufalList = List.of(answer);
    sufalList.shuffle();
    return sufalList;
  }
}
