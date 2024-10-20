// ignore_for_file: unused_local_variable

import 'package:crypto_app/DB%20service/card_db.dart';
import 'package:crypto_app/Inner%20Screens/bear_bull_screen.dart';
import 'package:crypto_app/Inner%20Screens/crypto_minning_screen.dart';
import 'package:crypto_app/components/hero_container.dart';
import 'package:crypto_app/components/input_field.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardData cardData = Get.put(CardData());

  List<Map<String, dynamic>> cardDataList = [];

  Future<void> _allpersons() async {
    final allcard = await cardData.getallcarddetails();
    setState(() {
      cardDataList = allcard;
    });
  }

  Future<void> _addcard(BuildContext context) async {
    TextEditingController controllername = TextEditingController();
    TextEditingController controllercardnum = TextEditingController();
    TextEditingController controllercvv = TextEditingController();
    TextEditingController controllerdate = TextEditingController();

    final screenSize = MediaQuery.of(context).size;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Add Care Person",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Cblack,
            ),
          ),
          content: SizedBox(
            height: screenSize.height * 0.33,
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                  child: Inputfield(
                    Controller: controllername,
                    labeltxt: 'Person name',
                    tap: () {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                  child: Inputfield(
                    Controller: controllercardnum,
                    labeltxt: 'Card Number',
                    tap: () {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                  child: Inputfield(
                    Controller: controllercvv,
                    labeltxt: 'CVV',
                    tap: () {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                  child: Inputfield(
                    Controller: controllerdate,
                    labeltxt: 'Expiry Date',
                    tap: () {},
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                navigator!.pop(context);
                Map<String, dynamic> newrow = {
                  'name': controllername.text,
                  'cardnumber': controllercardnum.text,
                  'cvv': controllercvv.text,
                  'expdate': controllerdate.text,
                };

                int newpersonid = await cardData.insertcarddetail(newrow);
                _allpersons();
              },
              child: Text(
                "Add Card Detail",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Cgreen,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cblack,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Crypto Mania",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Cwhite,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                const BearBullScreen(),
              );
            },
            icon: const Icon(
              Icons.update_rounded,
              size: 22,
              color: Cgreen,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Cblack.withOpacity(0.5),
                ),
              ),
              Text(
                "User@1234",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Cblack,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              HeroContainer(
                txt1: 'Crypto Minning',
                txt2: 'Revise the market and start minning',
                url:
                    'https://c8.alamy.com/comp/M382W1/rocket-icon-business-concept-rocket-launch-pictogram-vector-illustration-M382W1.jpg',
                inkwell: () {
                  Get.to(
                    const CryptoMinning(),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              HeroContainer(
                txt1: 'Credit / Debit Card',
                txt2: 'Make transaction with cards to get offers',
                url:
                    'https://cdn.dribbble.com/users/452635/screenshots/11498036/media/995438019f609c30157ddeb3d7e77e49.png?resize=400x0',
                inkwell: () {
                  _addcard(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
