import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/services/userlogin.dart';
import 'package:notesapp/services/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class notespage extends StatefulWidget {
  @override
  State<notespage> createState() => _notespageState();
}

class _notespageState extends State<notespage> {
  userregistrationlogin data = userregistrationlogin();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES', style: GoogleFonts.poppins(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () async{
                await data.userlogout();
                Navigator.of(context).pushNamedAndRemoveUntil("/login/", (route) => false);
              },
              child: Icon(Icons.logout)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil('/addnotespage/', (route) => false);
      },
      child: Icon(Icons.add),),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection(userid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Text("No notes available."); // Display a message when no notes are available.
          }

          var notes = snapshot.data!.docs;
          print("documents are , ${notes}");

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var note = notes[index].data();
              return Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // side: BorderSide(width: 5)
                  ),
                  onTap: (){
                    data.navigateToDetailScreen(context, note['title'], note['content']);
                  },
                  title: Text(note['title'], style: GoogleFonts.poppins(fontSize: MediaQuery.of(context).size.height * 0.03, color: Colors.white)),
                  tileColor: randomcolorselection(),
                  trailing: GestureDetector(
                    onTap: (){
                      data.deleteNote(notes[index].reference);
                    },
                    child: Icon(Icons.delete, color: Colors.white,)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
