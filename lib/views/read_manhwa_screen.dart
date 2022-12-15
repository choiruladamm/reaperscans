// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ReadManhwaScreen extends StatefulWidget {
  final detailReadManhwa;
  const ReadManhwaScreen({Key? key, this.detailReadManhwa}) : super(key: key);

  @override
  State<ReadManhwaScreen> createState() => _ReadManhwaScreenState();
}

class _ReadManhwaScreenState extends State<ReadManhwaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.network(
                    widget.detailReadManhwa['content'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
