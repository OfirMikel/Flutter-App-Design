import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/app_cubit.dart';
import 'package:untitled/cubit/app_cubit_states.dart';
import 'package:untitled/widgets/app_buttons.dart';
import 'package:untitled/widgets/app_large_text.dart';
import 'package:untitled/widgets/app_text.dart';
import 'package:untitled/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  int starRating = 3;
  Color colorPurple = const Color(0xFF5D69B3);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      DetailState detailState = state as DetailState;
      return Scaffold(
        body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detailState.place.img),
                              fit: BoxFit.cover
                          )
                      ),
                    )
                ),
                Positioned(
                    top: 45,
                    left: 10,
                    right: 20,
                    child:
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          BlocProvider.of<AppCubits>(context).goHome();
                        }, icon: Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )
                ),
                Positioned(
                    top: 315,
                    child: Container(
                      padding: const EdgeInsets.only(top: 30 , right: 20 , left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              AppLargeText(text: detailState.place.name, color: Colors.black.withOpacity(0.8),),
                              AppLargeText(text: "\$" + detailState.place.price.toString() , size: 20, color: colorPurple,)

                            ],),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.location_on,color: colorPurple,),
                              const SizedBox(width: 3,),
                              AppText(text: detailState.place.location)
                            ],),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index){
                                  starRating = detailState.place.stars;
                                  return Icon(Icons.star , color: index < starRating ? Colors.orangeAccent : Colors.grey,);
                                }),
                              ),
                              AppText(text:"(" + detailState.place.stars.toString() + ")", color: Colors.grey,)
                            ],
                          ),
                          const SizedBox(height: 25,),
                          AppLargeText(text: "People" , size: 20, ),
                          const SizedBox(height: 5,),
                          AppText(text: "Test Test Test Test Blah Blah"),
                          const SizedBox(height: 15,),
                          Wrap(
                            children: List.generate(5, (index){
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(colorChosen: Colors.white ,
                                    borderColor: Colors.white,
                                    backgroundColor: selectedIndex == index ? Colors.black87  : Colors.grey.withOpacity(0.4),
                                    size:50,
                                    text: (index+1).toString(),),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 15,),
                          AppLargeText(text: "Description", color: Colors.black87,),
                          const SizedBox(height: 5,),
                          AppText(text: detailState.place.description),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    )
                ),
                Positioned(
                    bottom: 25,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(size: 60, borderColor: Colors.black,
                          colorChosen: Colors.black87,
                          backgroundColor: Colors.white ,
                          iconData: Icons.favorite_border,
                          isIcon: true,),
                        const SizedBox(width: 25,),
                        ResponsiveButton(
                          isResponsive: true,
                          text: "Book Trip Now",
                        )
                      ],
                    ))

              ],
            )
        ),
      );
    });
  }
}
