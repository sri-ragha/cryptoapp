import 'dart:async';

import 'package:crypto_app/Inner%20Screens/news_screen.dart';
import 'package:crypto_app/Services/api_service.dart';
import 'package:crypto_app/constants/theme.dart';
import 'package:crypto_app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CryptoNews extends StatefulWidget {
  const CryptoNews({super.key});

  @override
  State<CryptoNews> createState() => _CryptoNewsState();
}

class _CryptoNewsState extends State<CryptoNews> {
  ApiService futurenewscontroller = Get.put(ApiService());

  Future<void> refreshnews() async {
    await futurenewscontroller.fetchNewsData();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cblack,
        elevation: 0,
        title: Text(
          "Crypto Mania News",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Cwhite,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Cgreen,
        onRefresh: refreshnews,
        child: FutureBuilder<List<NewsModel>>(
          future: futurenewscontroller.fetchNewsData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
            if (snapshot.hasData) {
              List<NewsModel>? news = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: ListView.builder(
                  itemCount: news!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () => Get.to(
                          NewsScreen(
                            newsNumber: news[index].srcurl,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: screenSize.height * 0.24,
                          width: screenSize.width * 0.9,
                          decoration: BoxDecoration(
                            color: Cblack.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: screenSize.height * 0.09,
                                      width: screenSize.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: Cblack.withOpacity(0.03),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            news[index].imgurl,
                                          ),
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
                                          news[index].src,
                                          style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1,
                                            color: Cgreen,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.65,
                                          height: screenSize.height * 0.06,
                                          child: Text(
                                            news[index].title,
                                            overflow: TextOverflow.visible,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Cblack,
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
                                SizedBox(
                                  width: screenSize.width * 0.9,
                                  height: screenSize.height * 0.08,
                                  child: Text(
                                    news[index].desc,
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Cblack.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: screenSize.width * 0.85,
                                      child: Text(
                                        'Catewgory: ${news[index].category}',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1,
                                          color: Cblue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
