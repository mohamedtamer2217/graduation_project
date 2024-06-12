import 'package:akarna/choose_country.dart';
import 'package:cupertino_text_button/cupertino_text_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchfield/searchfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class detailspagerent extends StatefulWidget {
  var _product;
  detailspagerent(this._product);



  @override
  State<detailspagerent> createState() => _detailspagerentState();
}

class _detailspagerentState extends State<detailspagerent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
            Padding(
              padding: const EdgeInsets.only(right: 330),
              child: IconButton(  onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back),color: Colors.black,),
            ),

            Image.network(
              widget._product["imageURL"],fit: BoxFit.contain,
              height: 280,
              width: MediaQuery.of(context).size.width,
            ),





            SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [

                  Icon(CupertinoIcons.star_fill,color: Colors.green,),
                  Icon(CupertinoIcons.star_fill,color: Colors.green,),
                  Icon(CupertinoIcons.star_fill,color: Colors.green,),
                  Icon(CupertinoIcons.star_fill,color: Colors.green,),
                  Icon(CupertinoIcons.star_lefthalf_fill,color: Colors.green,),
                  SizedBox(width: MediaQuery.sizeOf(context).width*0.15,),
                  Text(widget._product['price'].toString()+" Egp",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],

              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(widget._product['Name'],style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width*0.25,),
                  const Icon(CupertinoIcons.location_solid,color: Colors.green,),
                  Column(
                    children: [
                      Text( widget._product['location']),
                    ],
                  )
                ],


              ),

            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
            Container(
              width: 320,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                    Row(
                      children: [
                        Text("Space(m^2) :"+ widget._product["space"].toString(),style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Bedrooms :"+ widget._product["bed"].toString(),style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Bathrooms :"+ widget._product["bath"].toString(),style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Row(
                      children: [
                        Text("Price :"+ widget._product["price"].toString()+" Egp",style: TextStyle(color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
            Padding(

              padding: const EdgeInsets.only(top: 10.0,left: 22),
              child: Row(
                children: [
                  Text("Description" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 22),
              child: Row(
                children: [
                  Text( widget._product['description'])
                ],
              ),
            ),
            SizedBox(height:30,),
            FloatingActionButton.extended(
              backgroundColor: Colors.green,
              label: Text("Rent",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
              onPressed: () {
                setState(() {
                });
              },

            ),

          ],
        ),

      ),
    );
  }
}
