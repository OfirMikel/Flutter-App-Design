import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/app_cubit.dart';
import 'package:untitled/widgets/app_large_text.dart';
import 'package:untitled/widgets/app_text.dart';
import 'package:untitled/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img/welcome-one.png",
    "img/welcome-two.png",
    "img/welcome-three.png",
  ];
  List colors = [
    const Color(0xFF5D69B3),
    const Color(0xFFFFFFFF),
    const Color(0xFF000000),
    const Color(0x605D69B3),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      images[index]
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150 , left: 20 , right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          AppLargeText(text: "Trips"),
                          AppText(text: "Mountain", size: 30,),
                          const SizedBox(height: 20,),
                          Container(
                            width: 250,
                            child: AppText(
                              text: "this is a lot of words without any meaning great success good for you, get a new hair cut more over camembert",
                              size: 14,
                            ),

                          ), //small Text
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                                width: 200,
                                child: Row(children: [ ResponsiveButton(width: 150,)]
                                )
                            ),
                          )
                      ],),
                    Column(
                      children: List.generate(images.length, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 8,
                          height: index == indexDots ? 25 : 8 ,
                          decoration: BoxDecoration(
                            borderRadius:  BorderRadius.circular(10),
                            border: Border.all(),
                            color: index == indexDots ? colors[0] : colors[3]

                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }) ,
    );
  }
}
