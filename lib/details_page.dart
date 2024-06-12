import 'package:akarna/choose_country.dart';
import 'package:cupertino_text_button/cupertino_text_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchfield/searchfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class detailspage extends StatefulWidget {
      var _product;
      detailspage(this._product);



  @override
  State<detailspage> createState() => _detailspageState();
}

class _detailspageState extends State<detailspage> {
  List<String> images= [
    "assets/img/1.png",
    "assets/img/2.png",

  ];
int num =0;
  int _value = 5;
  double min = 1.0;
  double max = 20.0;
  void _token() {
    setState(() {
      num = num++;
    });
  }
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
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.3,),
                    Text(widget._product['price'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 30),
                    child: Text("Tokens",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 20),
                child: Row(
                  children: [


                    Container(
                        height: 40,
                        width:  40,
                        decoration: BoxDecoration(
                            color: Colors.green ,
                            borderRadius: BorderRadius.circular(50)
                        ),
                      child: IconButton(
                          color: Colors.white,
                          onPressed:(){
                        setState((){
                          if(_value < max){
                            /// Add as many as you want
                            _value++;
                          }
                        });
                      }, icon: const Icon(Icons.add)),
                    ),
                    SizedBox(width: 5,),
                    Text(_value.toString(),style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Container(
                      height: 40,
                      width:  40,
                      decoration: BoxDecoration(
                        color: Colors.green ,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: IconButton(
                          color: Colors.white,
                          onPressed:(){
                        setState((){
                          if(_value > min){
                            /// Subtract as many as you want
                            _value--;
                          }

                        });
                      }, icon: const Icon(Icons.remove)),
                    ),


                Slider(

                  value: _value.toDouble(),
                  min: min,
                  max: max,
                  activeColor: Colors.green,
                  inactiveColor: Colors.orange,
                  label: 'Set volume value',
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },

                ),

                ],

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
                  label: Text("Invest",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
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


