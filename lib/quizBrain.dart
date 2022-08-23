import 'package:quizzler/quesitons.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question(
        "Aşk-ı Memnu dizisinde Bihter ile Behlül arasında geçen \n'-Saçını kestirmekle neyi ispat ettin? \n+Saçımı kestim. Çünkü çok uzadı, sıkıldım artık'\n repliği 59. bölümde geçmektedir.",
        false,
        "55. bölüm"), // 55. bölüm
    Question(
        'Ayrılsak da Beraberiz dizisinde Berna ve Teoman\'ın boşanma sebebi diş macununu ortadan sıkmaktı.',
        true,
        "Teoman diş macununu ortadan sıkmıştır."),
    Question(
        'Yaprak Dökümü\'nde Şevket en son Oğuz\'un suçunu üstlendiği için hapisteydi.',
        true,
        "Şevket, Leyla ve doğacak yeğeni için suçu üslenmiştir."),
    Question(
        'Ezel, Dostoyevski\'nin Kumarbaz kitabından esinlenerek hazırlanmıştır.',
        false,
        "Monte Kristo Kontu kitabından esinlenilmiştir."), //Monte Kristo Kontu
    Question(
        "'Sakın tek bir kelime daha edeyim deme! Neden biliyor musun? Çünkü inanırım.' repliği Kurtlar Vadisi dizisinde geçmektedir",
        false,
        "Replik Ezel dizisine aittir."), //Ezel
    Question('Kuzey Tekinoğlu ve Güney Tekinoğlu çift yumurta ikizidir.', false,
        "Güney, Kuzey'in abisidir"), // Güney abisi
    Question(
        'Kuzey ve Güney\'in beraber kurduğu ve sonra Güney\'in kazık üstüne kazık attığı tatlı Makara\'dır',
        true,
        "Tatlı Makara'dır."),
    Question(
        'Asmalı Konak\'ta Bahar ve Seymen ilk buluştuklarında Bahar\'ın beresinin rengi kırmızıdır.',
        true,
        "Baharı'ın beresi kırmızıdır."),
    Question(
        'Yaprak Dökümü\'nde ailesi çok kısa sürede tanışıp evlenme kararı aldıkları için Şevket\'in Ferhunde\'yle birlikte olmasını istememişti.',
        false,
        "Ferhunde evli olduğu için"), //evli olduğu için
  ];

  String getQuestion() {
    return _questions[_questionNumber].questionText;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  String getQuestionTrueAnswer() {
    return _questions[_questionNumber].trueAnwser;
  }

  void setQuestion(questionNumber) {
    questionNumber = _questionNumber;
  }

  bool getAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  //Soru numarasının soruların listesinin uzunluğundan küçük olup olmadığını kontrol etmek için
  void nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool finished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() {
    _questionNumber = 0;
  }
}
