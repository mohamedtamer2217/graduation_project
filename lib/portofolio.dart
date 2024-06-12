import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class Portofolio extends StatefulWidget {
  const Portofolio({super.key});

  @override
  State<Portofolio> createState() => _Portofolio();
}
class _Portofolio extends State<Portofolio> {
  List<String> images= [
    "assets/img/1.png",
    "assets/img/2.png",

  ];

  @override
  Widget build(BuildContext context) {



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
              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.40),

                child: Text("My Performance",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),


              SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

              Padding(
                padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.27),

                child: Text("My Tokens for invest",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),


              SizedBox(
                height:200,
                width:double.infinity,
                child: ListView.builder(
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.black,width: 2.5)

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image(image: AssetImage(images[index])),
                            Text("egp 20000"),
                            Text("400m^2")

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
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
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(

                            border: Border.all(color: Colors.black,width: 2.5)

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image(image: AssetImage(images[index])),
                            Text("egp 20000"),
                            Text("400m^2")

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                ),
              )


            ],
          ),
        ),
    );
  }
}
