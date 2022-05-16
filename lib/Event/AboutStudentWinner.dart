import 'package:flutter/material.dart';
import 'package:splash_app/Model/eventModel.dart';
import 'package:splash_app/Model/studentModel.dart';
import 'package:splash_app/NetworkHandler.dart';

class AboutStudentWinner extends StatefulWidget {
  final StudentModel studentModel;
  final String eventid;
  final String place;
  const AboutStudentWinner({ Key? key, required this.studentModel, required this.eventid, required this.place}) : super(key: key);

  @override
  State<AboutStudentWinner> createState() => _AboutStudentWinnerState();
}

class _AboutStudentWinnerState extends State<AboutStudentWinner> {
  NetworkHandler networkHandler = NetworkHandler();
  EventModel eventModel = new EventModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async{
    var response = await networkHandler.get("/event/getEvent/${widget.eventid}");
    setState(() {
      eventModel = EventModel.fromJson(response["data"][0]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09488D),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              "🥳 Congratulations 🥳",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "MarckScript",
                fontWeight: FontWeight.bold,
                fontSize: 35
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding:EdgeInsets.only(left: 130, right: 130), 
              child: AspectRatio(
                aspectRatio: 1,
                child: CircleAvatar(
                  backgroundImage: (widget.studentModel.img.toString()).contains(widget.studentModel.regno.toString())? NetworkHandler().getImage(widget.studentModel.regno.toString()): NetworkImage(widget.studentModel.img.toString()),
                ),
              ),
            ),
            SizedBox(height:8),
            Text(
              widget.studentModel.name.toString(),
              style: TextStyle(
                color: Color(0xFFFAFCA8),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
            SizedBox(height:3),
            Text(
              widget.studentModel.regno.toString(),
              style: TextStyle(
                color: Color(0xFFF1BAFA),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 17
              )
            ),
            SizedBox(height:3),
            Text(
              widget.studentModel.academicstart.toString() + " - " + widget.studentModel.academicend.toString()+ " Batch",
              style: TextStyle(
                color: Color(0xFFF7FCBA),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
            ),
            SizedBox(height:3),
            Text(
              widget.studentModel.branch.toString(),
              style: TextStyle(
                color: Color(0xFFBAD4FA),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
            ),
            SizedBox(height:3),
            Text(
              widget.studentModel.college.toString(),
              style: TextStyle(
                color: Color(0xFFB8F4B6),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 16
              )
            ),
            SizedBox(height: 10),
            Divider(color: Colors.white, thickness: 2.0,),
            SizedBox(height:10),
            Text(
              widget.place,
              style: TextStyle(
                color: Color(0xFFFCA8B2),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 26,
                decoration: TextDecoration.underline,
                
              )
            ),
            SizedBox(height: 4),
            Text(
              eventModel.name.toString(),
              style: TextStyle(
                color: Color(0xFFFBFBFD),
                fontFamily: "MarckScript",
                fontWeight: FontWeight.bold,
                fontSize: 35
              )
            ),
            Text(
              "conducted by",
              style: TextStyle(
                color: Color(0xFFB3F6A8),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 20,  
              )
            ),
            SizedBox(height: 5),
            Text(
              eventModel.organizer.toString(),
              style: TextStyle(
                color: Color(0xFFDFC8F0),
                fontFamily: "QuickSand",
                fontWeight: FontWeight.bold,
                fontSize: 25,  
              )
            ),
          ]
        )
      )
    );
  }
}