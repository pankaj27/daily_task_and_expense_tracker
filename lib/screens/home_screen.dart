import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  var isLogoutLoading = false;
  logout() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("hello", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue.shade900,
        actions: [IconButton(onPressed: (){
          logout();
        }, icon: isLogoutLoading ? const CircularProgressIndicator() : const Icon(Icons.exit_to_app,color: Colors.white,))],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.blue.shade900,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                Text("Total Balance", style: TextStyle(fontSize:18, color: Colors.white,height: 1.2,fontWeight:FontWeight.w600),),
                Text("₹58200", style: TextStyle(fontSize:50, color: Colors.white,height: 1.2,fontWeight:FontWeight.w600),),

              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, bottom: 10, right: 10,left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
              ),

              child: const Row(
                children: [
                 CardOne(color: Colors.green,),
                  SizedBox(width:10),
                  CardOne(color: Colors.red,)
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {

    return  Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
          ),
          
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Credit", style: TextStyle(color:color,fontSize: 14),), Text("₹5800",style: TextStyle(color:color,fontSize: 30))
              ],
            )

          ],
        ) ,
      ) ,
    ));
  }
}

