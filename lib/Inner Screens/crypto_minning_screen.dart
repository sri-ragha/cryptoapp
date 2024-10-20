import 'package:crypto_app/Services/api_service.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:crypto_app/models/crypto_minning_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoMinning extends StatefulWidget {
  const CryptoMinning({super.key});

  @override
  State<CryptoMinning> createState() => _CryptoMinningState();
}

class _CryptoMinningState extends State<CryptoMinning> {
  ApiService minningapi = Get.put(ApiService());

  String baseUrl = 'https://www.cryptocompare.com/';

  Future<void> refreshdata() async {
    await minningapi.fetchcryptominningData();
  }

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
          "Crypto Minning",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Cwhite,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Cgreen,
        onRefresh: refreshdata,
        child: FutureBuilder<List<Data>>(
          future: minningapi.fetchcryptominningData(),
          builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
            if (snapshot.hasData) {
              List<Data>? MinningData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: ListView.builder(
                  itemCount: MinningData!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.8,
                        decoration: BoxDecoration(
                          color: Cblack.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: screenSize.height * 0.07,
                                        width: screenSize.width * 0.15,
                                        decoration: BoxDecoration(
                                          color: Cblack.withOpacity(0.03),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              baseUrl +
                                                  MinningData[index]
                                                      .minning_model
                                                      .imgurl,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            MinningData[index]
                                                .minning_model
                                                .fullname,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Cblack,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                MinningData[index]
                                                    .minning_model
                                                    .algorithm,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Cblack.withOpacity(0.5),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                MinningData[index]
                                                    .minning_model
                                                    .prooftype,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Cblack.withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: screenSize.height * 0.04,
                                    width: screenSize.width * 0.15,
                                    decoration: BoxDecoration(
                                      color: Cgreen,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      MinningData[index].minning_model.name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        color: Cwhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '⛓ ${MinningData[index].minning_model.nethash.toString()} NetHashes',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Cgreen,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '🔗 ${MinningData[index].minning_model.blocknumber} Block Number',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.4),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '💰 ${MinningData[index].minning_model.blockreward} Block Reward',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '⏳ ${MinningData[index].minning_model.blocktime} Block Time',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Cgreen,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
      ),
    );
  }
}
