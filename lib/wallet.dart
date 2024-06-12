import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'model/user_model.dart';


class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _Wallet();
}
class _Wallet extends State<Wallet> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text('My Wallet',style:TextStyle(fontWeight: FontWeight.bold , color:Colors.white),),
        actions: <Widget>[
          CircleAvatar(backgroundImage:AssetImage("assets/img/logo.png") ,),

        ],
        backgroundColor: Colors.green,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.55),

              child: Text("Welcome Mr.${loggedInUser.secondName}",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            ),


            SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),



            SizedBox(
              height:150,

              child: ListView.builder(
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:7),
                    child: Container(
                      width: 370,
                      decoration: const BoxDecoration(
                        color:Colors.green,

                      ),

                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 150,top: 10,left: 35),
                                  child:  Text(
                                    'Your Wallet',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.more_vert,
                                  color: Colors.white,)
                              ],
                            ),
                            SizedBox(height:20,),
                            Padding(
                              padding: EdgeInsets.only(right: 230),
                              child:  Text(
                                'Balance',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            ),
                            SizedBox(height:10,),
                            Padding(
                              padding: EdgeInsets.only(right: 190),
                              child:  Text(
                                '\$36,000,000',
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),



                  );
                },
                itemCount: 1,
                scrollDirection: Axis.horizontal,
              ),
            ),


            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

            Padding(
              padding:  EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.60,bottom: MediaQuery.sizeOf(context).height*0.02),

              child: Text("Activties",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            ),


            SizedBox(
              height:80,
              width:370,
              child: ListView.builder(
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:0),
                    child: Container(
                      width: 380,
                      decoration:  const BoxDecoration(

                         color: Colors.grey

                      ),
                      child: const Row(
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(backgroundImage:AssetImage("assets/img/logo.png"),radius: 30.0,),
                              ),


                            ],
                          ),

                          Column(
                            children: [
                              Text("Sheikh Zayed Town House Token",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                              SizedBox(height:20, width:10,),
                              Row(
                                children: [
                                  Text("-\$200,000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                  SizedBox(height:0, width:50,),
                                  Text("2 Tokens",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 1,
                scrollDirection: Axis.horizontal,
              ),
            )


          ],
        ),
      ),
    );
  }
}
