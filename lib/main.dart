import 'package:daily_quote/core/app_router.dart';
import 'package:daily_quote/cubits/cubit/quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DailyQuote());
}

class DailyQuote extends StatelessWidget {
  const DailyQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit(Dio())..fetchAllQuotes(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: 'GTSectraFine',
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
