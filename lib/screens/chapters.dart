import 'package:alqgp/consts.dart';
import 'package:alqgp/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alqgp/screens/body.dart';

import '../models/user_model.dart';
//import '../navBar.dart';
import '../navBar/naviigation_drawer.dart';
import '../widgets/CardWidget.dart';

class header extends StatefulWidget {
  //prop
  static const String screenRout = 'chapters';

  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
//with SingleTickerProviderStateMixin {
//   final colorstheme = Color(0xff4b4b87);

//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = new TabController(length: 3, vsync: this, initialIndex: 0)
//       ..addListener(() {});
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Status',
//           style: TextStyle(fontSize: 27, color: colorstheme),
//         ),
//         centerTitle: true,
//         shadowColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 15.0),
//           child: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: colorstheme,
//               size: 30,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[300]),
//             child: TabBar(
//                 isScrollable: true,
//                 indicatorPadding: EdgeInsets.all(10),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: colorstheme,
//                 labelStyle: TextStyle(fontSize: 20),
//                 labelPadding:
//                     EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
//                 indicator: BoxDecoration(
//                     color: colorstheme,
//                     borderRadius: BorderRadius.circular(20)),
//                 controller: _tabController,
//                 tabs: [
//                   Text('Day'),
//                   Text('Week'),
//                   Text('Month'),
//                 ]),
//           ),
//           Expanded(
//             child: TabBarView(controller: _tabController, children: [
//               CardWidget(),
//               CardWidget(),
//               CardWidget(),
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }

  //cource from sign up

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("student")
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
      drawer: NavigationDrawer(),
      appBar: buildAppBar(),
      body: Body(),
      // Stack(
      //   children: [
      //     // Container(
      //     //   decoration: BoxDecoration(
      //     //     image: DecorationImage(
      //     //       image: AssetImage("images/backgraund4.png"),
      //     //       fit: BoxFit.cover,
      //     //     ),
      //     //   ),
      //     //   child: null /* add child content here */,
      //     // ),
      //     Body(),
      //   ],
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 196, 93, 83),
      elevation: 0,
      /*
      logo
      leading: IconButton(
        iconSize: 100,
        icon: Image.asset("images/logo.jpeg"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const header()),
          );
        },
      ),
      */
      title: const Text(
        "ALQ",
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
    );
    // actions: [
    //   IconButton(
    //     icon: Image.asset('images/profile3.png'),
    //     onPressed: () => {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => ProfileScreen()))
    //     }, //go to profile page
    //   ),
    // ],
  }
}
//chpters
//padding: EdgeInsets.only(left:90, bottom: 70, right: 50, top:70),

/*
title: const Text(
        "ALQ",
        style: TextStyle(
          fontSize: 23,
          color: Colors.black,
        ),
      ),
Image.asset(
          "images/profile2.PNG",
        ),
import 'package:flutter/material.dart';
import 'package:alqgp/navBar.dart';

import '../models/user_model.dart';

class header extends StatefulWidget {
  //prop
  static const String screenRout = 'chapters';

  const header({super.key});

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("student")
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
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "ALQ",
          //start the changes
          style: TextStyle(
            fontSize: 23,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: Container(
        child: Container(
          height: 800,
          width: double. infinity,
          decoration: BoxDecoration(
            color: Colors .white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30,top: 30),
                child: Text(
                  "Select chapter",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


*/
