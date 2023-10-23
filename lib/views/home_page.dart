import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Ludus/entity/user_entity.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _currentIndex = 0;
  List<String> images = ["assets/images/foto3.jpg", "assets/images/foto2.jpg"];
  final List _lastMessage = ['hello'];

  List<UserEntity> users = [];

  PageController _pageController = PageController();

  /*

  Future<List<UserEntity>> getUsers() async {
    var url = Uri.parse("https://ludust.duckdns.org/api/pessoas/all");
    var response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ0b2tlbiIsInN1YiI6Imd1aWxoZXJtZWFjYWFhYWFhQGdtYWlsLmNvbSIsImV4cCI6MTY5NTM0MTc3OH0.stSrAtarlq4apiD80DIwbUHNO_beG4Yvo41SaToqKB8'
    });
    List<dynamic> jsonList = json.decode(response.body);
    List<Map<String, dynamic>> jsonListCast =
        jsonList.cast<Map<String, dynamic>>();
    List<UserEntity> users =
        jsonListCast.map((json) => UserEntity.fromJson(json)).toList();
    print(users[0].nome);
    return users;
  }

  */

  void _previousImage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        print("anterior: $_currentIndex");
      });
    }
  }

  void _nextImage() {
    if (_currentIndex < images.length - 1) {
      setState(() {
        _currentIndex++;
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        print("proxima: $_currentIndex");
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          child: Container(
            color: Color(0xFF0F141E),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Nome, 23",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Sobre mim",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Texto sobre mim",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Área do curso",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: OutlineGradientButton(
                      child: Text(
                        "Engenharia",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.white, Colors.white]),
                      strokeWidth: 1,
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      radius: Radius.circular(12),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
          Center(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.red, Colors.orange],
                                    ).createShader(bounds);
                                  },
                                  child: Icon(
                                    Icons.notifications_active,
                                    color: Colors.white,
                                    size: 55,
                                  ),
                                )),
                            SizedBox(width: 10),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.yellow,
                                  ]),
                                  shape: BoxShape.circle),
                              child: Padding(
                                //this padding will be you border size
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      foregroundImage: AssetImage(
                                          "assets/images/careca.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 220, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.grey.shade400,
                            size: 40,
                          ),
                          onPressed: _previousImage,
                        ),
                        SizedBox(width: 270),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey.shade400,
                            size: 40,
                          ),
                          onPressed: _nextImage,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: RichText(
                          text: TextSpan(
                        text: "Thiago",
                        style: TextStyle(
                            color: Colors.yellow.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: [
                          TextSpan(
                              text: ", 21",
                              style: TextStyle(color: Colors.white))
                        ],
                      ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 36),
                    child: Align(
                      alignment: Alignment.center,
                      child: OutlineGradientButton(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.red, Colors.orange],
                            ).createShader(bounds);
                          },
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange, Colors.yellow]),
                        strokeWidth: 3,
                        padding:
                            EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                        radius: Radius.circular(50),
                        onTap: () async {
                          _showBottomSheet(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
