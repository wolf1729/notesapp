import 'package:flutter/material.dart';
import 'package:notesapp/services/userlogin.dart';
import 'package:notesapp/views/loginview.dart';
import 'package:notesapp/services/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class addnotespage extends StatefulWidget {
  const addnotespage({Key?key}): super(key: key);

  @override
  State<addnotespage> createState() => _addnotespageState();
}

class _addnotespageState extends State<addnotespage> {
  TextEditingController titl = TextEditingController();
  TextEditingController content = TextEditingController();
  userregistrationlogin data = userregistrationlogin();
  var name = "";

  getuser() async {
    var user = await data.checkcurrentuser();
    print("user is ${user}");
    name = await data.getid();
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: GestureDetector(
          onTap:(){
            Navigator.of(context).pushNamed('/notespage/');
          },
          child: Icon(Icons.arrow_back_ios)
        ),
        title: Text("Add Notes", style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: ()async{
              await data.userlogout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginview()));
            },
            child: Icon(Icons.logout)
          )
        ],
      ),
      body: Container(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
              child: TextField(
                controller: titl,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)))
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
              child: TextField(
                controller: content,
                decoration: InputDecoration(
                  hintText: "Content",
                   border: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(20)))
                ),
                maxLines: 10,
                minLines: 1,
              ),
            ),
            TextButton(onPressed: ()async{
              setState(() {
                notes++;
              });
              await data.adduserdetails(title: titl.text, content: content.text, regemail: name, notes: notes.toString());
              Navigator.of(context).pushNamedAndRemoveUntil('/notespage/', (route) => false);
            }, child: Text("Add"))
          ],
        ),
      ),
    ));
  }
}