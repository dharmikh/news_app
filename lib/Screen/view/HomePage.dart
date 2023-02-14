import 'package:flutter/material.dart';
import 'package:news_app/Screen/Provider/HomeProvider.dart';
import 'package:news_app/Screen/model/NewsModel.dart';
import 'package:news_app/utils/api_http.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providerTrue;
  HomeProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<HomeProvider>(context, listen: true);
    providerFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFB9F3E4),
          title: Container(
            height: 7.h,
            width: 100.w,
            child: TextFormField(
              controller: providerTrue!.txtSearch,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                    gapPadding: 10, borderRadius: BorderRadius.circular(50)),
              ),
              onFieldSubmitted: (value) {
                // print("ghyrhytrytr");
                newsdata().getnewsdata(providerTrue!.txtSearch.text.isEmpty
                    ? "India"
                    : providerTrue!.txtSearch.text);
              },
              cursorColor: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xFFB9F3E4),
        body: FutureBuilder<NewsModel?>(
          future: newsdata().getnewsdata(providerTrue!.txtSearch.text.isEmpty
              ? "India"
              : providerTrue!.txtSearch.text),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<Articles>? data = snapshot.data!.articles;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      providerFalse!.AddData(data[index]);
                      Navigator.pushNamed(context, 'Home');
                    },
                    child: Container(
                      height: 25.h,
                      width: 100.w,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 25.h,
                            width: 100.w,
                            child: Image.network(
                              "${data[index].urlToImage}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Text(
                                "${data[index].title}",
                                maxLines: 2,
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
