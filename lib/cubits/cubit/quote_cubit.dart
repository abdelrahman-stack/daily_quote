import 'package:bloc/bloc.dart';
import 'package:daily_quote/models/quote_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final Dio dio;
  QuoteCubit(this.dio) : super(QuoteInitial());
  void fetchAllQuotes() async {
    emit(Quoteloading());
    try {
      var response = await dio.get('https://zenquotes.io/api/quotes');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<QuoteModel> quotes = data
            .map((quote) => QuoteModel.fromJson(quote))
            .toList();
        emit(QuoteSuccess(quotes));
      }
    } catch (e) {
      emit(QuoteFailure(e.toString()));
    }
  }
}
