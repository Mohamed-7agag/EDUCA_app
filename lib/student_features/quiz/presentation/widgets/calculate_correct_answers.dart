int calculateCorrectAnswers(
    List<String> studentAnswers, List<String> correctAnswers) {
  int correctAnswersCount = 0;
  for (int i = 0; i < studentAnswers.length; i++) {
    if (studentAnswers[i] == correctAnswers[i]) {
      correctAnswersCount++;
    }
  }
  return correctAnswersCount;
}
