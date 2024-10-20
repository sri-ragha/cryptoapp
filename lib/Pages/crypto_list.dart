import 'package:crypto_app/Services/api_service.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:crypto_app/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CryptoList extends StatefulWidget {
  const CryptoList({super.key});

  @override
  State<CryptoList> createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  ApiService futurecryptocontroller = Get.put(ApiService());

  Future<void> refreshdatacrypto() async {
    await futurecryptocontroller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cblack,
        elevation: 0,
        title: Text(
          "Crypto Currency",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Cwhite,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Cgreen,
        onRefresh: refreshdatacrypto,
        child: FutureBuilder<List<CryptoRawData>>(
          future: futurecryptocontroller.fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<CryptoRawData>> snapshot) {
            if (snapshot.hasData) {
              List<CryptoRawData>? cryptodata = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: ListView.builder(
                  itemCount: cryptodata!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: screenSize.height * 0.23,
                        width: screenSize.width * 0.9,
                        decoration: BoxDecoration(
                          color: Cblack.withOpacity(0.03),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cryptodata[index].name,
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Cblack,
                                        ),
                                      ),
                                      Text(
                                        cryptodata[index].symbol,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    cryptodata[index]
                                        .inr
                                        .cryptoinr
                                        .price
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Cgreen,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 1,
                                color: Cgreen.withOpacity(0.8),
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Max Supply',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack,
                                        ),
                                      ),
                                      Text(
                                        cryptodata[index].maxsupply.toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.45),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Percentage 1hr',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack,
                                        ),
                                      ),
                                      Text(
                                        cryptodata[index]
                                            .inr
                                            .cryptoinr
                                            .perchng
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.45),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Volume 24h',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack,
                                        ),
                                      ),
                                      Container(
                                        height: screenSize.height * 0.03,
                                        width: screenSize.width * 0.2,
                                        decoration: BoxDecoration(
                                          color: Cgreen,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          cryptodata[index]
                                              .inr
                                              .cryptoinr
                                              .volchng
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Cwhite,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Supply',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack,
                                        ),
                                      ),
                                      Text(
                                        cryptodata[index]
                                            .totalsupply
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.45),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Market Cap Dominance',
                                        style: GoogleFonts.poppins(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack,
                                        ),
                                      ),
                                      Text(
                                        cryptodata[index]
                                            .inr
                                            .cryptoinr
                                            .mrktcapdom
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Cblack.withOpacity(0.45),
                                        ),
                                      ),
                                    ],
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
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
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
