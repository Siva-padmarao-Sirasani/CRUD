import 'package:flutter/material.dart';
import 'AddProductScreen.dart';
class HomeScreen extends StatefulWidget {
  final Map<String, String>? editDetails;
  final Function(Map<String, String>) onUpdate;
  const HomeScreen({Key? key, required this.editDetails, required this.onUpdate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                hintText: 'Search Product Name or Category',
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,

           itemCount: products.length,
           itemBuilder: (context, index) {
             Map<String, String> product = products[index];
             return ListTile(
               title: Text(product['title'] ?? ''),
               subtitle: Text(product['description'] ?? ''),
               // Add edit and delete buttons
               trailing: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   IconButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => AddProductScreen(
                             editDetails: product,
                             onUpdate: (editedDetails) {
                               setState(() {
                                 products[index] = editedDetails;
                               });
                             },
                           ),
                         ),
                       );
                     },
                     icon: Icon(Icons.edit),
                   ),
                   IconButton(
                     onPressed: () {
                       setState(() {
                         products.removeAt(index);
                       });
                     },
                     icon: Icon(Icons.delete),
                   ),
                 ],
               ),
             );
           },
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(
                editDetails: null,
                onUpdate: (newProduct) {
                  setState(() {
                    products.add(newProduct);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
