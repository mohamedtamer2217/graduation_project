import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Portofolio extends StatefulWidget
{
  const Portofolio({super.key, required this.email});
  final String email;

  @override
  State<Portofolio> createState() => _Portofolio();
}
class _Portofolio extends State<Portofolio>
{
  List<dynamic> investments = [], rents = [];


  List<String> images= [
    "assets/img/1.png",
    "assets/img/2.png",
  ];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  fetchProducts() async
  {
    QuerySnapshot qn = await _firestore.collection('investments').get();
    setState(()
    {
      for (int i = 0; i < qn.docs.length; i++)
      {
        investments.add({
          "email": qn.docs[i]["email"],
          "imageUrl": qn.docs[i]["imageUrl"],
          "location": qn.docs[i]["location"],
          "price": qn.docs[i]["price"],
          "tokens": qn.docs[i]["tokens"],
        });
      }


    });

    return qn.docs;
  }





  fetchRents() async
  {
    QuerySnapshot qn = await _firestore.collection('rents').get();
    setState(()
    {
      for (int i = 0; i < qn.docs.length; i++)
      {
        rents.add({
          "email": qn.docs[i]["email"],
          "imageUrl": qn.docs[i]["imageUrl"],
          "location": qn.docs[i]["location"],
          "price": qn.docs[i]["price"],
          "isRented": qn.docs[i]["isRented"],
        });
      }
    });

    return qn.docs;
  }


  @override
  void initState()
  {
    super.initState();
    fetchProducts();
    fetchRents();

  }
  


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Portofolio',style:TextStyle(fontWeight: FontWeight.bold , color:Colors.white),),
        actions: <Widget>[
          IconButton(

            icon:  Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),

            onPressed: () {
              // do something
            },
          ),
          IconButton(

            icon:  Icon(
              CupertinoIcons.heart_fill,
              color: Colors.white,
            ),

            onPressed: () {
              // do something
            },
          ),
          IconButton(

            icon:  Icon(
              Icons.more_vert,
              color: Colors.white,
            ),

            onPressed: () {
              // do something
            },
          )
        ],
        backgroundColor: Colors.green,

      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.27),

                child: Text("My Tokens for invest",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),


              SizedBox(
                height:200,
                width:double.infinity,
                child: ListView.builder(
                  itemCount: investments.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return widget.email == investments[index]['email'] ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.black,width: 2.5)

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image.network(
                              investments[index]['imageUrl'],
                              height: 100.h,
                            ),
                            Text('${investments[index]['price']} EGP'),
                            Text('Location: ${investments[index]['location']}'),
                            Text('Tokens: ${investments[index]['tokens'].toString()}'),
                          ],
                        ),
                      ),
                    ) : const SizedBox.shrink();
                  },
                ),
              ),


              SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.60),

                child: Text("My rent",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),


              SizedBox(
                height:200,
                width:double.infinity,
                child: ListView.builder(
                  itemCount: rents.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return widget.email == rents[index]['email'] ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.black,width: 2.5)

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image.network(
                              rents[index]['imageUrl'],
                              height: 100.h,
                            ),
                            Text('${rents[index]['price']} EGP'),
                            Text('Location: ${rents[index]['location']}'),
                          ],
                        ),
                      ),
                    ) : const SizedBox.shrink();
                  },
                ),
              )


            ],
          ),
        ),
    );
  }
}
