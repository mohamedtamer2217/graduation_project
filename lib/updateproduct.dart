

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_text_button/cupertino_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'model/product_model.dart';
import 'model/user_model.dart';

class updateproduct extends StatefulWidget {
   updateproduct({super.key,required this.imageURL,required this.Name,required this.bath,required this.bed,required this.description,required this.location,required this.price,required this.space,required this.token});
  final String imageURL;
   final String Name;
   final int bath;
   final int bed;
   final String description;
   final String location;
   final int price;
   final int space;
   final int token;


  @override
  State<updateproduct> createState() => _updateproductState();
}

class _updateproductState extends State<updateproduct> {

  String _savedbath = '';
  String _savedName = '';
  String _savedbed = '';
  int _savedprice = 0;
  String _savedcredit = '';
  bool _showNameField = false;
  bool _showbedField = false;
  bool _showpriceField = false;
  bool _showbathField = false;
  bool _showcreditField = false;
  final NameEditingController = new TextEditingController();
  final bedEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();
  final bathEditingController = new TextEditingController();
  final creditEditingController = new TextEditingController();





 final products = FirebaseFirestore.instance;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:130,left: 160),
                  child: Row(

                    children: [
                      Container(
                          width:60,
                          height: 60,

                          decoration:BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child:
                          Icon(CupertinoIcons.person,size: 50,color: Colors.white,)),
                    ],
                  ),
                ) ,

                Padding(
                  padding: const EdgeInsets.only(top:80,left: 0),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Column(
                        children: [

                          Row(
                            children: [
                              Container(
                                  width: 250,
                                  height: 30,
                                  child: Text("Name:${widget.Name} ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () =>
                                    setState(() =>
                                    _showNameField = !_showNameField),
                                child: Text(_showNameField ? 'Done' : 'Edit'),

                              ),


                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 150,
                                child: Visibility(

                                  visible: _showNameField,
                                  child: Row(


                                      children: [

                                        Expanded(

                                          child: TextField(
                                            controller:NameEditingController,
                                            decoration: InputDecoration(

                                                hintText: 'Enter text here'),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: () async {
                                            QuerySnapshot querySnapshot = await FirebaseFirestore
                                                .instance
                                                .collection(
                                                'products') // Replace with your collection name
                                                .where('imageURL', isEqualTo: widget.imageURL)
                                                .get();

                                            DocumentSnapshot documentSnapshot = querySnapshot.docs
                                                .first;
                                            String docId = documentSnapshot.id;
                                            setState(() async{
                                              _savedName = NameEditingController.text;
                                              _showNameField = false; // Hide the text field after saving
                                              NameEditingController.clear();
                                              await FirebaseFirestore.instance
                                                  .collection('products')
                                                  .doc(docId)
                                                  .update(
                                                  {'Name': _savedName});
                                              setState(() {});

                                              Fluttertoast.showToast(msg: 'Successful edited'); // Clear the text field for next use
                                            });
                                            // Perform any additional actions with the saved text (optional)
                                            print('Saved text: $_savedName');
                                          },
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  width: 250,
                                  height: 30,
                                  child: Text("bath:${widget.bath}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () =>
                                    setState(() =>
                                    _showbathField = !_showbathField),
                                child: Text(_showbathField ? 'Done' : 'Edit'),

                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 150,
                                child: Visibility(

                                  visible: _showbathField,
                                  child: Row(


                                      children: [

                                        Expanded(

                                          child: TextField(
                                            controller:bathEditingController,
                                            decoration: InputDecoration(

                                                hintText: 'Enter text here'),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: () async {
                                            QuerySnapshot querySnapshot = await FirebaseFirestore
                                                .instance
                                                .collection(
                                                'products') // Replace with your collection name
                                                .where('imageURL', isEqualTo: widget.imageURL)
                                                .get();

                                            DocumentSnapshot documentSnapshot = querySnapshot.docs
                                                .first;
                                            String docId = documentSnapshot.id;
                                            setState(() async{
                                              _savedbath = bathEditingController.text;
                                              _showbathField = false; // Hide the text field after saving
                                              bathEditingController.clear();
                                              await FirebaseFirestore.instance
                                                  .collection('products')
                                                  .doc(docId)
                                                  .update(
                                                  {'bath': _savedbath});
                                              setState(() {});

                                              Fluttertoast.showToast(msg: 'Successful edited'); // Clear the text field for next use
                                            });
                                            // Perform any additional actions with the saved text (optional)
                                            print('Saved text: $_savedbath');
                                          },
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 250,
                                  height: 30,
                                  child: Text("bed:${widget.bed}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () =>
                                    setState(() =>
                                    _showbedField = !_showbedField),
                                child: Text(_showbedField ? 'Done' : 'Edit'),

                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 200,
                                child: Visibility(

                                  visible: _showbedField,
                                  child: Row(


                                      children: [

                                        Expanded(

                                          child: TextField(
                                            controller:bedEditingController,
                                            decoration: InputDecoration(

                                                hintText: 'Enter text here'),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: () async {
                                            QuerySnapshot querySnapshot = await FirebaseFirestore
                                                .instance
                                                .collection(
                                                'products') // Replace with your collection name
                                                .where('bed', isEqualTo: widget.bed)
                                                .get();

                                            DocumentSnapshot documentSnapshot = querySnapshot.docs
                                                .first;
                                            String docId = documentSnapshot.id;
                                            setState(() async{
                                              _savedbed = bedEditingController.text;
                                              _showbedField = false; // Hide the text field after saving
                                              bedEditingController.clear();
                                              await FirebaseFirestore.instance
                                                  .collection('products')
                                                  .doc(docId)
                                                  .update(
                                                  {'bed': _savedbed});
                                              setState(() {});

                                              Fluttertoast.showToast(msg: 'Successful edited'); // Clear the text field for next use
                                            });
                                            // Perform any additional actions with the saved text (optional)
                                            print('Saved text: $_savedbed');
                                          },
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(height:80,
                                  width: 250,

                                  child: Text("price:${widget.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () =>
                                    setState(() =>
                                    _showpriceField = !_showpriceField),
                                child: Text(_showpriceField ? 'Done' : 'Edit'),

                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 150,
                                child: Visibility(

                                  visible: _showpriceField,
                                  child: Row(


                                      children: [

                                        Expanded(

                                          child: TextField(
                                            controller:priceEditingController,
                                            decoration: InputDecoration(

                                                hintText: 'Enter text here'),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: () async {
                                            QuerySnapshot querySnapshot = await FirebaseFirestore
                                                .instance
                                                .collection(
                                                'products') // Replace with your collection name
                                                .where('imageURL', isEqualTo: widget.imageURL)
                                                .get();

                                            DocumentSnapshot documentSnapshot = querySnapshot.docs
                                                .first;
                                            String docId = documentSnapshot.id;
                                            setState(() async{
                                              int priceCount = int.parse(priceEditingController.text);
                                              _savedprice = priceCount;
                                              _showpriceField = false; // Hide the text field after saving
                                              priceEditingController.clear();
                                              await FirebaseFirestore.instance
                                                  .collection('products')
                                                  .doc(docId)
                                                  .update(
                                                  {'price': _savedprice});
                                              setState(() {});

                                              Fluttertoast.showToast(msg: 'Successful edited'); // Clear the text field for next use
                                            });
                                            // Perform any additional actions with the saved text (optional)
                                            print('Saved text: $_savedprice');
                                          },
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),



                        ],
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 50,),



              ],
            )
        )

    );
  }
}
