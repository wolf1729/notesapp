import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class seenotepage extends StatelessWidget {
  final String title;
  final String content;

  seenotepage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TITLE", style: GoogleFonts.poppins(color: Colors.grey),),
                  Text(
                    title,
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("CONTENT", style: GoogleFonts.poppins(color: Colors.grey)),
                Text(content, style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
