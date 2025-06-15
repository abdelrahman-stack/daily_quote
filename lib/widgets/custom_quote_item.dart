import 'package:daily_quote/models/quote_model.dart';
import 'package:flutter/material.dart';

class CustomQuoteItem extends StatelessWidget {
  const CustomQuoteItem({super.key, required this.quoteModel});
  final QuoteModel quoteModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  '"${quoteModel.title}"',
                  style: const TextStyle(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        quoteModel.author,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.favorite, size: 28, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
