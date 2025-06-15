part of 'quote_cubit.dart';

sealed class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

final class QuoteInitial extends QuoteState {}

final class Quoteloading extends QuoteState {}

final class QuoteSuccess extends QuoteState {
  final List<QuoteModel> quotes;

const  QuoteSuccess(this.quotes);
}

final class QuoteFailure extends QuoteState {
  final String errMessage;

  const QuoteFailure(this.errMessage);
}
