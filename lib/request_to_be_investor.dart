import 'package:akarna/model/token_notifier.dart';
import 'package:akarna/stream_token.dart';
import 'package:akarna/update_tokens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


class RequestInvest extends StatefulWidget {
  const RequestInvest({super.key,required this.email});
  final String email;

  @override
  State<RequestInvest> createState() => _RequestInvestState();
}

class _RequestInvestState extends State<RequestInvest> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Request to be Investor',style:TextStyle(fontWeight: FontWeight.bold , color:Colors.white),),

          backgroundColor: Colors.green,


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Center(child: Text("Terms and Conditions")),

              ],
            ),
            Row(
              children: [
                Text("dhjdkjdjsdhijoshinsjkoifjkljnwsijfikosioekjfikoikoslejfiklojweisojfikojewiosjifjeiopwjfioewjfjewjneiklowj")
              ],
            ),
            FloatingActionButton.extended(
            backgroundColor: Colors.green,
            label: const Text("Send Request",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
            onPressed: () async
            {
              QuerySnapshot querySnapshot = await FirebaseFirestore
                  .instance
                  .collection(
                  'users') // Replace with your collection name
                  .where('email', isEqualTo: widget.email)
                  .get();

              DocumentSnapshot documentSnapshot = querySnapshot.docs
                  .first;


              String Name = documentSnapshot['firstName'];


              FirebaseFirestore firebaseFirestore = FirebaseFirestore
                  .instance;
              await firebaseFirestore.collection('invest_request').add(
                  {
                    'email': widget.email,
                    'Name': Name,

                  });


              setState(() {});

              Fluttertoast.showToast(msg: 'request sent');
              Navigator.pop(context);
            }

            )



          ],
        ),
      ),
    );
  }
}
