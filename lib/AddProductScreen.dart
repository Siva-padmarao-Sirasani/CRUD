import 'package:flutter/material.dart';

import 'UpdateProductScreen.dart';
class AddProductScreen extends StatefulWidget {
  final Map<String, String>? editDetails;
  final Function(Map<String, String>) onUpdate;
  const AddProductScreen({Key? key,required this.editDetails,required this.onUpdate}) :super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  List<Map<String, String>> enteredDetails = [];
  @override
  void initState() {
    super.initState();

    // Check if editDetails are provided and update text controllers
    if (widget.editDetails != null) {
      titleController.text = widget.editDetails!['title'] ?? '';
      descriptionController.text = widget.editDetails!['description'] ?? '';
      priceController.text = widget.editDetails!['price'] ?? '';
      ratingController.text = widget.editDetails!['rating'] ?? '';
      stockController.text = widget.editDetails!['stock'] ?? '';
      categoryController.text = widget.editDetails!['category'] ?? '';
      brandController.text = widget.editDetails!['brand'] ?? '';
      thumbnailController.text = widget.editDetails!['thumbnail'] ?? '';
      imageController.text = widget.editDetails!['image'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(child: Text("Create Product")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Title',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Description',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product price',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Rating',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: brandController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Brand',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: categoryController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Category',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: stockController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Stock',
                    ),
                  ),
                  const SizedBox(height: 10.0,),

                  TextField(
                    controller: thumbnailController,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product ThumbNail',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  // Displaying Thumbnail Image
                  // Image.network(product.thumbnail),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: imageController,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Product Images',
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  ElevatedButton(
                    onPressed: () {
                      // String id=idController.text;
                      String title = titleController.text;
                      String description = descriptionController.text;
                      String price = priceController.text;
                      String rating = ratingController.text;
                      String stock = stockController.text;
                      String category = categoryController.text;
                      String brand = brandController.text;
                      String thumbnail = thumbnailController.text;
                      String image = imageController.text;
                      Map<String, String>? product = {
                        "title": title,
                        "description": description,
                        "price": price,
                        "rating": rating,
                        "stock": stock,
                        "category": category,
                        "brand": brand,
                        "thumbnail": thumbnail,
                        "image": image,
                      };
                      if (widget.editDetails != null) {
                        // Invoke the onUpdate callback for editing
                        widget.onUpdate(product);
                      } else {
                        // Handle adding logic
                        if (product.isNotEmpty) {
                          setState(() {
                            enteredDetails.add(product);
                          });
                        }
                      }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateProductScreen(
                              enteredDetails: enteredDetails,
                            ),
                          ),
                        );



                      titleController.clear();
                      descriptionController.clear();
                      priceController.clear();
                      ratingController.clear();
                      stockController.clear();
                      categoryController.clear();
                      brandController.clear();
                      thumbnailController.clear();
                      imageController.clear();
                    },
                    child: Text(widget.editDetails != null ? "Update" : "Add"),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
