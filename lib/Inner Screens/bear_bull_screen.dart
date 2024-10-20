// ignore_for_file: unnecessary_string_interpolations

import 'package:crypto_app/Services/api_service.dart';
import 'package:crypto_app/components/bear_bull_card.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:crypto_app/models/bearish_bullish.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class BearBullScreen extends StatefulWidget {
  const BearBullScreen({super.key});

  @override
  State<BearBullScreen> createState() => _BearBullScreenState();
}

class _BearBullScreenState extends State<BearBullScreen> {
  ApiService bullbeardata = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cblack,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            navigator!.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Cwhite,
            size: 20,
          ),
        ),
        title: Text(
          "Crypto Trading Signals",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Cwhite,
          ),
        ),
      ),
      body: FutureBuilder<BullBearData>(
        future: bullbeardata.fetchbearishbullish(),
        builder: (BuildContext context, AsyncSnapshot<BullBearData> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    BearBullCard(
                      screenSize: screenSize,
                      data: data,
                      name: 'NetGrowth',
                      symbol: '${data!.symbol}',
                      cat: '${data.netgrowth.category}',
                      senti: '${data.netgrowth.sentiment}',
                      val: '${data.netgrowth.value}',
                      scor: '${data.netgrowth.score}',
                      thresbear: '${data.netgrowth.threshbear}%',
                      threshbull: '${data.netgrowth.threshbull}%',
                    ),
                    BearBullCard(
                      screenSize: screenSize,
                      data: data,
                      name: 'ConcentrationVar',
                      symbol: '${data.symbol}',
                      cat: '${data.concentrationvar.category}',
                      senti: '${data.concentrationvar.sentiment}',
                      val: '${data.concentrationvar.value}',
                      scor: '${data.concentrationvar.score}',
                      thresbear: '${data.concentrationvar.threshbear}%',
                      threshbull: '${data.concentrationvar.threshbull}%',
                    ),
                    BearBullCard(
                      screenSize: screenSize,
                      data: data,
                      name: 'LargetxsVar',
                      symbol: '${data.symbol}',
                      cat: '${data.largestvar.category}',
                      senti: '${data.largestvar.sentiment}',
                      val: '${data.largestvar.value}',
                      scor: '${data.largestvar.score}',
                      thresbear: '${data.largestvar.threshbear}%',
                      threshbull: '${data.largestvar.threshbull}%',
                    ),
                    BearBullCard(
                      screenSize: screenSize,
                      data: data,
                      name: 'InOutVar',
                      symbol: '${data.symbol}',
                      cat: '${data.inoutvar.category}',
                      senti: '${data.inoutvar.sentiment}',
                      val: '${data.inoutvar.value}',
                      scor: '${data.inoutvar.score}',
                      thresbear: '${data.inoutvar.threshbear}%',
                      threshbull: '${data.inoutvar.threshbull}%',
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeAlign: 3,
                strokeCap: StrokeCap.round,
                color: Cgreen,
              ),
            ),
          );
        },
      ),
    );
  }
}
