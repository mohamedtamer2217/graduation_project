import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model/user_model.dart';


class Wallet extends StatefulWidget
{
  const Wallet({super.key, required this.email});
  final String email;

  @override
  State<Wallet> createState() => _Wallet();
}
class _Wallet extends State<Wallet>
{
  List<dynamic> profiles = [], activities = [], activitiesRents = [];

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  fetchProducts() async
  {
    QuerySnapshot qn = await _firestore.collection('users').get();
    setState(()
    {
      for (int i = 0; i < qn.docs.length; i++)
      {
        profiles.add({
          "balance": qn.docs[i]["balance"],
          "email": qn.docs[i]["email"],
          "firstName": qn.docs[i]["firstName"],
          "imageURL": qn.docs[i]["imageURL"],
          "secondName": qn.docs[i]["secondName"],
          "uid": qn.docs[i]['uid'],
        });
      }
    });

    return qn.docs;
  }

  fetchActivities() async
  {
    QuerySnapshot qn = await _firestore.collection('investments').get();
    setState(()
    {
      for (int i = 0; i < qn.docs.length; i++)
      {
        activities.add({
          'email': qn.docs[i]['email'],
          'tokens': qn.docs[i]['tokens'],
          'imageUrl': qn.docs[i]['imageUrl'],
          'price': qn.docs[i]['price'],
          'location': qn.docs[i]['location'],
        });
      }
    });

    return qn.docs;
  }

  fetchActivitiesRent() async
  {
    QuerySnapshot qn = await _firestore.collection('rents').get();
    setState(()
    {
      for (int i = 0; i < qn.docs.length; i++)
      {
        activitiesRents.add({
          'email': qn.docs[i]['email'],
          'isRented': qn.docs[i]['isRented'],
          'imageUrl': qn.docs[i]['imageUrl'],
          'price': qn.docs[i]['price'],
          'location': qn.docs[i]['location'],
        });
      }
    });

    return qn.docs;
  }

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
    fetchProducts();
    fetchActivities();
    fetchActivitiesRent();
  }

  @override
  Widget build(BuildContext context)
  {
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
      body: Column(
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

                      child: Column(
                        children: [
                          const Row(
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
                          const Padding(
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
                              '${widget.email == profiles[index]['email'] ? profiles[index]['balance'] : 0}',
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

          const Text("Investments Activities",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

          SizedBox(
            height:150.h,
            width:370,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: activities.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)
              {
                return activities.isNotEmpty ? (activities[index]['email'] == widget.email ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 380,
                    decoration:  const BoxDecoration(

                        color: Colors.grey

                    ),
                    child: Row(
                      children: [

                        const Column(
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
                            Text(activities[index]['location'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            const SizedBox(height:20, width:10,),
                            Row(
                              children: [
                                Text("-\$${activities[index]['price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                SizedBox(height:0, width:50,),
                                Text("${activities[index]['tokens']} Tokens",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ) : const SizedBox.shrink()) : const SizedBox.shrink();
              },
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

          const Text("Rents Activities",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

          SizedBox(
            height:150.h,
            width:370,
            child: ListView.builder(
              itemCount: activitiesRents.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)
              {
                return activitiesRents.isNotEmpty ? (activitiesRents[index]['email'] == widget.email ? Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 380,
                    decoration:  const BoxDecoration(

                        color: Colors.grey

                    ),
                    child: Row(
                      children: [

                        const Column(
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
                            Text(activitiesRents[index]['location'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            const SizedBox(height:20, width:10,),
                            Row(
                              children: [
                                Text("-\$${activitiesRents[index]['price']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                SizedBox(height:0, width:50,),
                                Text("Rented",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ) : const SizedBox.shrink()) : const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }
}
