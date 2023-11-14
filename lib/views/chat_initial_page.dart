import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/service/chat_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class ChatInitialPage extends StatefulWidget {
  final UserResponseDTO userLogado;

  final List<int> listMatchs;

  const ChatInitialPage(
      {super.key, required this.userLogado, required this.listMatchs});
  @override
  _ChatInitialPageState createState() => _ChatInitialPageState();
}

class _ChatInitialPageState extends State<ChatInitialPage> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('users');

  late int numberOfMatches;

  late List<int> listOfMatches;

  late UserResponseDTO userLogado;

  late String nomeCortado;

  ChatService chatService = new ChatService();

  void initState() {
    userLogado = widget.userLogado;
    List<String> corte = widget.userLogado.getNome().split(' ');
    nomeCortado = corte[0];
    listOfMatches = widget.listMatchs;
    numberOfMatches = listOfMatches.length;
    super.initState();
  }

  void onTapUser(String userID, String userName, String userAvatarUrl) {
    String logado = userLogado.getId().toString();
    final chatID = 'userID$logado-$userID';
    print(chatID);
    final chatReference =
        FirebaseDatabase.instance.reference().child('chats').child(chatID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F141E),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xFF0F141E),
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: RichText(
                    text: TextSpan(
                  text: "Olá",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                    fontFamily: 'Lexend',
                  ),
                  children: [
                    TextSpan(
                        text: ", ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Lexend',
                        )),
                    TextSpan(
                        text: "$nomeCortado!",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold)),
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.red,
                        Colors.orange,
                        Colors.yellow,
                      ]),
                      shape: BoxShape.circle),
                  child: Padding(
                    //this padding will be you border size
                    padding: EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 34, 42, 58),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundImage:
                              Image.file(userLogado.getFotoWithPath()).image,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF0F141E),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0.2),
                  hintText: 'Procure por alguém...',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w300),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Row(
              children: [
                Text(
                  "Confira seus ",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "matches! ",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontFamily: 'Lexend',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 18,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$numberOfMatches",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          /*



          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListView(),
          ),

          */
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Colors.white,
              thickness: 1,
              height: 20,
              indent: 20,
              endIndent: 20,
            ),
          ),
          Text(
            "Chat",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }
}
