import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/first_round.dart';
import 'package:screw/screens/second_round.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_dialog.dart';
import 'package:screw/widgets/player_widget.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key, required this.oldPlayers}) : super(key: key);
  final Map<String,int> oldPlayers;

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  late Map<String,int> players;

  @override
  void initState() {
    super.initState();
    players = Map.from(widget.oldPlayers); // Create a copy of oldPlayers
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> onBackButtonPressed(context),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondryColor],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Players',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: players.length,
                      itemBuilder: (context, index) =>
                          AddPlayerWidget(
                            text: players.keys.elementAt(index),
                            onPressedRemove: () {
                              setState(() {
                                players.remove(players.keys.elementAt(index));
                              });
                            },
                          ),
                    ),
                    players.length >=6 ? Container() : Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.account_circle),
                          ),
                          title: const Text(
                            'Add Player',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.add_circle_outlined),
                            color: Colors.white,
                            iconSize: 35,
                            onPressed: () {
                              _showPlayerDialog(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    players.length>=3 ? CustomButton(text: 'Let\'s Start',color: kSecondryColor,
                      onTap: ()
                      {
                        players.keys.forEach((value)
                        {
                          players[value] = 0;
                        });
                        Get.offAll(() => const FirstRound(), arguments: players,transition: Transition.rightToLeft);
                      },
                    ) : Container(),
                    const SizedBox(height: 20,),
                    players.isNotEmpty ? CustomButton(
                      text: 'Clear All',
                      color: kPrimaryColor,
                      onTap: ()
                      {
                        setState(() {
                          players.clear();
                        });
                      },
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showPlayerDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PlayerDialog(
          onPlayerAdded: (name) {
            setState(() {
              players[name] = 0;

            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

}
