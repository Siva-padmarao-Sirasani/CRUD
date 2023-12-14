import 'package:flutter/material.dart';

import 'AddProductScreen.dart';
class UpdateProductScreen extends StatefulWidget {
  final List<Map<String,String>> enteredDetails;
  const UpdateProductScreen({Key? key,required this.enteredDetails}):super(key: key);

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to AddProductScreen if only one list is present
        if (widget.enteredDetails.length <= 1) {
          Navigator.pop(context);
          return true;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title:Center(child: Text("update")),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.enteredDetails.length,
            itemBuilder: (context, index) {
              Map<String, String> details = widget.enteredDetails[index];
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ${details['title']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Description: ${details['description']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Brand: ${details['brand']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Price: ${details['price']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Category: ${details['category']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rating: ${details['rating']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Stock: ${details['stock']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Thumbnail: ${details['thumbnail']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Images: ${details['image']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      children: [
                        SizedBox(width: 50.0,),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProductScreen(
                                  editDetails: details,
                                  onUpdate: (editedDetails) {
                                    setState(() {
                                      widget.enteredDetails[index] = editedDetails;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),

                        SizedBox(width: 50.0,),
                        IconButton(
                          onPressed: () {
                            if (index >= 0 && index < widget.enteredDetails.length) {
                              setState(() {
                                widget.enteredDetails.removeAt(index);
                              });
                            }
                          },
                          icon: Icon(Icons.delete,),
                        ),
                      ],
                    ),

                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
