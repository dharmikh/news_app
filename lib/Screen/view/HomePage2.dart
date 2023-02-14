import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Provider/HomeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

HomeProvider? providerTrue;
HomeProvider? providerFalse;

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<HomeProvider>(context, listen: true);
    providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "${providerTrue!.articles!.title}",
            maxLines: 1,
            style: GoogleFonts.caveatBrush(
              fontSize: 25,
              textStyle: TextStyle(overflow: TextOverflow.ellipsis),
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFB9F3E4),
        ),
        backgroundColor: Color(0xFFB9F3E4),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40.h,
                width: 160.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Image.network("${providerTrue!.articles!.urlToImage}",fit: BoxFit.fill,)
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "${providerTrue!.articles!.description}",
                maxLines: 6,
                style: GoogleFonts.caveatBrush(
                    fontSize: 25,
                    textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
              ),
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse("${providerTrue!.articles!.url}"));
              },
              child: Text("Read More...."),
            ),
          ],
        ),
      ),
    );
  }
}
