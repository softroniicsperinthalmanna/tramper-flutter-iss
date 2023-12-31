import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icon.dart';
import 'package:tramper/Hosting2.dart';
import 'package:tramper/about.dart';
import 'package:tramper/contact2.dart';

import 'about2.dart';
import 'add_place.dart';
import 'bucket_list.dart';
import 'contact.dart';
import 'home.dart';
import 'hosting.dart';
class HosterProfile extends StatefulWidget {
  const HosterProfile({super.key});

  @override
  State<HosterProfile> createState() => _HosterProfileState();
}

class _HosterProfileState extends State<HosterProfile> {
  int current=0;
  // List of tab bar items

  List<Map<String,dynamic>>items=[
    {
      'name':'About',

    },{
      'name':'Hosting details',
    },{
      'name':'Contact',
    },
  ];
  List<Widget> pages=[
    about2(),
    Hosting2(),
    contact2(),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [

                Container(
                    alignment: Alignment.topLeft,
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage("asset/img_6.png")
                        )
                    ),


                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 5),
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,size: 26,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 145,top: 140),
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/img_9.png")
                        ),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.cyan
                    ),
                  ),
                )
              ],
            ),
            Text("Jennifer",style: GoogleFonts.niramit(fontSize: 28,fontWeight: FontWeight.w700),),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                current = index;
                              });
                            },
                            child:AnimatedContainer(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(5),
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                color: current == index?
                                HexColor("#055C9D")
                                    :HexColor("#FFFFFF"),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: HexColor("#055C9D")),),
                              duration:Duration() ,
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,top: 5),
                                    child: Text(items[index]['name'],style: GoogleFonts.niramit(color: HexColor("#68BBE3"),fontSize:14 ,fontWeight: FontWeight.bold),),
                                  ),

                                ],
                              ),
                            )


                        ),

                      ],
                    );
                  }),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,
                  right: 5),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.8,
                decoration: BoxDecoration(),
                child:pages[current],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
