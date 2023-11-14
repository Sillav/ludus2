import 'dart:io';
import 'package:Ludus/dto/response/user_responseDTO.dart';
import 'package:Ludus/service/auth_service.dart';
import 'package:Ludus/service/home_service.dart';
import 'package:Ludus/views/chat_initial_page.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:side_sheet/side_sheet.dart';

class HomePage extends StatefulWidget {
  final List<UserResponseDTO> usersList;
  final UserResponseDTO userLogado;

  const HomePage(
      {super.key, required this.usersList, required this.userLogado});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = new AuthService();

  List<UserResponseDTO> users = [];

  CarouselController carouselController = CarouselController();

  HomeService homeService = new HomeService();

  int currentIndex = 0;

  late UserResponseDTO userLogado;

  @override
  void initState() {
    userLogado = widget.userLogado;
    users = widget.usersList;
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showBottomSheet(BuildContext context) async {
    String remetente_id = userLogado.getId().toString();

    String destinatario_id = users[currentIndex].getId().toString();

    var euCurti = await homeService.verificarMinhasCurtidas(
        remetente_id, destinatario_id);

    var meCurtiu = await homeService.verificarOutrasCurtidas(
        remetente_id, destinatario_id);

    var match =
        await homeService.verificarMeusMatchs(remetente_id, destinatario_id);

    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 34, 42, 58),
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          child: Container(
            color: Color.fromARGB(255, 34, 42, 58),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, bottom: 25, top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(
                      text: users[currentIndex].getNome(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 251, 230, 45),
                        fontWeight: FontWeight.bold,
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
                            text: users[currentIndex].getIdade().toString(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Lexend',
                            )),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Sobre mim",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      users[currentIndex].getDescricao(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Lexend'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Área do curso",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: OutlineGradientButton(
                        child: Text(
                          users[currentIndex].getDescricaoCurso(),
                          style: TextStyle(
                              fontSize: 9,
                              color: Colors.white,
                              fontFamily: 'Lexend'),
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.white, Colors.white]),
                        strokeWidth: 1,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        radius: Radius.circular(12),
                        onTap: () async {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Center(
                      child: OutlineGradientButton(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.red, Colors.orange],
                            ).createShader(bounds);
                          },
                          child: (match)
                              ? Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                  size: 22,
                                )
                              : (euCurti)
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 22,
                                    )
                                  : (meCurtiu)
                                      ? Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                          size: 22,
                                        )
                                      : Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange, Colors.yellow]),
                        strokeWidth: 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        radius: Radius.circular(50),
                        onTap: () async {
                          if (match) {
                            //NAVEGA PARA O CHAT
                          } else {
                            if (euCurti) {
                              //BLOQUEIA BOTÃO DE CHECK
                            }
                            if (meCurtiu) {
                              //PERMITE AINDA BOTÃO DE TE CURTIU COM MENSSAGEM TE CURTIU
                            }
                          }
                          //PERMITE BOTÃO DE TE CURTIU
                        },
                      ),
                    ),
                  ),
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
          Center(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 60),
            ),
          ),
          FlutterCarousel(
              options: CarouselOptions(
                controller: carouselController,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 2),
                showIndicator: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: users
                  .map((user) => Container(
                        child: Center(
                            child: Image.file(
                          user.getFotoWithPath(),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                        )),
                      ))
                  .toList()),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70, right: 25),
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 8, bottom: 15),
                            child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.red, Colors.orange],
                                  ).createShader(bounds);
                                },
                                child: GestureDetector(
                                  onTap: () async {
                                    List<int> matchs =
                                        await homeService.getUsersMatch();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ChatInitialPage(
                                                userLogado: userLogado,
                                                listMatchs: matchs)));
                                  },
                                  child: Icon(
                                    Icons.chat_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ))),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => SideSheet.right(
                            context: context,
                            sheetBorderRadius: 25,
                            width: MediaQuery.of(context).size.width * 0.85,
                            body: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 34, 42, 58),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25))),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 80),
                                    child: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.red,
                                            Colors.orange,
                                            Colors.yellow,
                                          ]),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        //this padding will be you border size
                                        padding: EdgeInsets.all(3.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                foregroundImage: Image.file(
                                                        userLogado
                                                            .getFotoWithPath())
                                                    .image),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.home_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Início",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 2.5,
                                      thickness: 2,
                                      indent: 50,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.person_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Perfil",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 2.5,
                                      thickness: 2,
                                      indent: 50,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.help_outline_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Ajuda",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 2.5,
                                      thickness: 2,
                                      indent: 50,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.settings_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Configurações",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 2.5,
                                      thickness: 2,
                                      indent: 50,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 50),
                                          child: Icon(
                                            Icons.lock_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Segurança",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Divider(
                                      color: Colors.white,
                                      height: 2.5,
                                      thickness: 2,
                                      indent: 50,
                                      endIndent: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 135),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: Icon(
                                            Icons.logout_outlined,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 35),
                                          child: Text(
                                            "Sair",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 25,
                                                fontFamily: 'Lexend'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: Container(
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
                              padding: EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundImage:
                                        Image.file(userLogado.getFotoWithPath())
                                            .image,
                                  ),
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
                  padding: EdgeInsets.only(top: 500),
                  child: RichText(
                      text: TextSpan(
                    text: users[currentIndex].getNome(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 251, 230, 45),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Lexend',
                    ),
                    children: [
                      TextSpan(
                          text: ", ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                          )),
                      TextSpan(
                          text: users[currentIndex].getIdade().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend',
                          )),
                    ],
                  ))),
              Padding(
                padding: const EdgeInsets.only(top: 30),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            ),
                          ],
                        )),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange, Colors.yellow]),
                    strokeWidth: 2,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    radius: Radius.circular(50),
                    onTap: () async {
                      _showBottomSheet(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.grey.shade400,
                    size: 40,
                  ),
                  onPressed: () => carouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.shade400,
                    size: 40,
                  ),
                  onPressed: () => carouselController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
