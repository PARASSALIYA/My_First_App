import 'package:flutter/material.dart';
import 'package:my_first_app/utils/product.dart';
import 'package:my_first_app/veiws/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String SelectIndex = "All";
  double slidervalue = 0;
  RangeValues rangeslidervalue = const RangeValues(0, 25000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("paras"),
              accountEmail: Text("paras"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton(
              onChanged: (val) {
                setState(
                  () {
                    SelectIndex = val!;
                  },
                );
              },
              value: SelectIndex,
              items: [
                const DropdownMenuItem(
                  value: "All",
                  child: Text("All"),
                ),
                ...allcategory.map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "$SelectIndex Products",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            RangeSlider(
              min: 0,
              max: 25000,
              divisions: 25000,
              labels: RangeLabels(
                rangeslidervalue.start.toInt().toString(),
                rangeslidervalue.end.toInt().toString(),
              ),
              values: rangeslidervalue,
              onChanged: (value) {
                rangeslidervalue = value;

                products
                    .where((e) =>
                        e['price'] >= rangeslidervalue.start &&
                            e['price'] <= rangeslidervalue.end &&
                            SelectIndex == 'All' ||
                        e['category'] == SelectIndex)
                    .toList();
                setState(() {});
              },
            ),
            (SelectIndex == "All")
                ? Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                    SelectIndex == 'All' ||
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
                                          SelectIndex == 'All' ||
                                      e['category'] == SelectIndex)
                                  .toList()[index]['thumbnail'],
                            ),
                          ),
                          Text(
                            "${products.where((e) => e['price'] >= rangeslidervalue.start && e['price'] <= rangeslidervalue.end && SelectIndex == 'All' || e['category'] == SelectIndex).toList()[index]['title']},",
                          ),
                          Text(
                              "${products.where((e) => e['price'] >= rangeslidervalue.start && e['price'] <= rangeslidervalue.end && SelectIndex == 'All' || e['category'] == SelectIndex).toList()[index]['price']},"),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: category(
                      SelectIndex: SelectIndex,
                      rangeslidervalue: rangeslidervalue,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
