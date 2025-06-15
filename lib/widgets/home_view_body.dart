import 'package:daily_quote/cubits/quote_cubit/quote_cubit.dart';
import 'package:daily_quote/widgets/custom_quote_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Quote Of the Day',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<QuoteCubit, QuoteState>(
                builder: (context, state) {
                  if (state is Quoteloading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QuoteSuccess) {
                    
                    return ListView.builder(
                      itemCount: state.quotes.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return  CustomQuoteItem(quoteModel: state.quotes[index] ,);
                      },
                    );
                  } else if (state is QuoteFailure) {
                    return Text(state.errMessage);
                  } else {
                    return const Center(child: Text('There was an error '));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
