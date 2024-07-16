import 'package:flutter/material.dart';
import 'package:my_first_app/utils/product.dart';

Widget category(
    {required String SelectIndex, required RangeValues rangeslidervalue}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: products
              .where(
                (e) =>
                    e['price'] >= rangeslidervalue.start &&
                    e['price'] <= rangeslidervalue.end &&
                    e['category'] == SelectIndex,
              )
              .toList()
              .length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(
                  products
                      .where((e) =>
                          e['price'] >= rangeslidervalue.start &&
                          e['price'] <= rangeslidervalue.end &&
                          e['category'] == SelectIndex)
                      .toList()[index]['thumbnail'],
                ),
              ),
              Text(
                "${products.where((e) => e['price'] >= rangeslidervalue.start && e['price'] <= rangeslidervalue.end && e['category'] == SelectIndex).toList()[index]['title']},",
              ),
              Text(
                "${products.where((e) => e['price'] >= rangeslidervalue.start && e['price'] <= rangeslidervalue.end && e['category'] == SelectIndex).toList()[index]['price']},",
              ),
            ],
          ),
        ),
      )
    ],
  );
}
