class QuoteModel {
  final String title;
  final String author;

  QuoteModel({required this.title, required this.author});

  factory QuoteModel.fromJson(json) {
    return QuoteModel(title: json['q'], author: json['a']);
  }
}
