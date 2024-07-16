import 'package:flutter/material.dart';

import 'package:my_first_app/veiws/HomePage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FilterPage(),
//     );
//   }
// }
//
// class FilterPage extends StatefulWidget {
//   @override
//   _FilterPageState createState() => _FilterPageState();
// }
//
// class _FilterPageState extends State<FilterPage> {
//   RangeValues _currentRangeValues = const RangeValues(20, 80);
//   String? _selectedCategory;
//   List<Product> _products = [
//     Product('Product 1', 10, 'Electronics'),
//     Product('Product 2', 25, 'Clothing'),
//     Product('Product 3', 50, 'Electronics'),
//     Product('Product 4', 75, 'Clothing'),
//     Product('Product 5', 100, 'Food'),
//   ];
//   List<Product> _filteredProducts = [];
//   List<String> _categories = ['All', 'Electronics', 'Clothing', 'Food'];
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredProducts = _products;
//     _selectedCategory = _categories[0];
//   }
//
//   void _applyFilter() {
//     setState(() {
//       _filteredProducts = _products.where((product) {
//         final withinPriceRange = product.price >= _currentRangeValues.start &&
//             product.price <= _currentRangeValues.end;
//         final matchesCategory =
//             _selectedCategory == 'All' || product.category == _selectedCategory;
//         return withinPriceRange && matchesCategory;
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category and Price Filter'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Select Category',
//               style: TextStyle(fontSize: 20),
//             ),
//             DropdownButton<String>(
//               value: _selectedCategory,
//               onChanged: (newValue) {
//                 _selectedCategory = newValue;
//                 setState(() {});
//               },
//               items: _categories.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Select Price Range',
//               style: TextStyle(fontSize: 20),
//             ),
//             RangeSlider(
//               values: _currentRangeValues,
//               min: 0,
//               max: 100,
//               divisions: 10,
//               labels: RangeLabels(
//                 _currentRangeValues.start.round().toString(),
//                 _currentRangeValues.end.round().toString(),
//               ),
//               onChanged: (RangeValues values) {
//                 setState(() {
//                   _currentRangeValues = values;
//                   _applyFilter();
//                 });
//               },
//             ),
//             Text(
//               'Selected range: \$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}',
//               style: TextStyle(fontSize: 16),
//             ),
//             // ElevatedButton(
//             //   onPressed: _applyFilter,
//             //   child: Text('Apply Filter'),
//             // ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _filteredProducts.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_filteredProducts[index].name),
//                     subtitle: Text(
//                         '\$${_filteredProducts[index].price} - ${_filteredProducts[index].category}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Product {
//   final String name;
//   final double price;
//   final String category;
//
//   Product(this.name, this.price, this.category);
// }
