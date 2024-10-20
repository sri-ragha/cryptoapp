import 'package:crypto_app/constants/theme.dart';
import 'package:crypto_app/models/bearish_bullish.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BearBullCard extends StatelessWidget {
  const BearBullCard({
    super.key,
    required this.screenSize,
    required this.data,
    required this.name,
    required this.symbol,
    required this.cat,
    required this.senti,
    required this.val,
    required this.scor,
    required this.thresbear,
    required this.threshbull,
  });

  final Size screenSize;
  final BullBearData? data;
  final String name;
  final String symbol;
  final String cat;
  final String senti;
  final String val;
  final String scor;
  final String thresbear;
  final String threshbull;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: screenSize.height * 0.2,
        width: screenSize.width * 0.95,
        decoration: BoxDecoration(
          color: Cblack.withOpacity(0.03),
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: NetworkImage(
              'https://i.pngimg.me/thumb/f/720/comvecteezy570746.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Cblack,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            symbol,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Cblack,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            cat,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Cblack.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    senti,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Cblack,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Value:  ${val}',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Cblack.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Score:  ${scor}',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Cblack.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: screenSize.height * 0.035,
                    width: screenSize.width * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      thresbear,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Cwhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: screenSize.height * 0.035,
                    width: screenSize.width * 0.15,
                    decoration: BoxDecoration(
                      color: Cgreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      threshbull,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Cwhite,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
