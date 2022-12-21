// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reaperscans/models/manhwa_models.dart';
import 'package:reaperscans/views/detail_latest_update_screen.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // show user yang sedang login
  final user = FirebaseAuth.instance.currentUser;

  // logout user
  void logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // custom app bar
            Padding(
              padding: EdgeInsets.only(top: 40, right: 2, left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                    ),
                    backgroundColor: Colors.grey[900],
                    radius: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      user!.email!,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    UniconsLine.search,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: logout,
                    icon: Icon(Icons.logout),
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            // latest update text
            Padding(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Latest Update",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            // heading slider content
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: SizedBox(
                height: 340.0,
                child: ListView.builder(
                  itemCount: latestUpdateManhwa.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 180.0,
                      margin: EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LatestUpdateScren(
                                    detailLatestUpdate:
                                        latestUpdateManhwa[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 270,
                              width: 180.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${latestUpdateManhwa.elementAt(index)['poster']}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                                color: Colors.grey[900],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    width: 80,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "MANHWA",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            alignment: Alignment.center,
                            height: 60,
                            child: Text(
                              "${latestUpdateManhwa.elementAt(index)['judul']}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Popular text
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Popular Manhwa",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            // popular content
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ListView.builder(
                itemCount: popularManhwa.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200.0,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      // color: Colors.grey[600],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: 140.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "${popularManhwa.elementAt(index)['poster']}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            color: Colors.grey[900],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${popularManhwa.elementAt(index)['judul']}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            RatingBar.builder(
                                              itemSize: 25,
                                              initialRating: 4.4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  EdgeInsets.only(right: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${popularManhwa.elementAt(index)['ratingstar']}",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${popularManhwa.elementAt(index)['genre']}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 150,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "Read Comics",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Icon(
                                        UniconsLine.arrow_right,
                                        size: 24.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
