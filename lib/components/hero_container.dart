import 'package:crypto_app/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroContainer extends StatelessWidget {
  const HeroContainer({
    super.key,
    required this.txt1,
    required this.txt2,
    required this.url,
    required this.inkwell,
  });

  final String txt1;
  final String txt2;
  final String url;
  final VoidCallback inkwell;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: inkwell,
      child: Container(
        height: screenSize.height * 0.09,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          color: Cblack.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.15,
                decoration: BoxDecoration(
                  color: Cblack.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    txt1,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Cblack,
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.55,
                    child: Text(
                      txt2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: Cblack.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: screenSize.height * 0.07,
                width: screenSize.width * 0.07,
                decoration: BoxDecoration(
                  color: Cblack.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Cblack,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
