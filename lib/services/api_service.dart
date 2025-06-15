import 'package:daily_quote/models/quote_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<QuoteModel>> getQuote() async {
    try {
      var response = await dio.get('https://zenquotes.io/api/quotes');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((quote) => QuoteModel.fromJson(quote)).toList();
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception('Error fetching quote: $e');
    }
  }
}
