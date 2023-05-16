import 'package:chamsoccaytrong/constants/app_colors.dart';
import 'package:chamsoccaytrong/constants/app_styles.dart';
import 'package:chamsoccaytrong/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoBarWidget extends StatelessWidget with PreferredSizeWidget{
  LogoBarWidget({super.key,required this.hasBackButton ,required this.todaysWeather}): preferredSize=const Size.fromHeight(AppStyles.kAppBarHeight);
 
  final String todaysWeather;
  final bool hasBackButton;
  OutlineInputBorder border=OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide:const BorderSide(color: Colors.grey,width: 1.5));

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    Size screenSize=Utils().getScreenSize();
    return Container(
      height: AppStyles.kAppBarHeight,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backgroundGradient,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,)),
      child: Row(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: hasBackButton?
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back))
          :SvgPicture.asset(
              'assets/plantixlogo.svg',
              height: AppStyles.kAppBarHeight*0.7,),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 26),
              
              child: Text(
                todaysWeather,
                style: const TextStyle(
                  color: Colors.white, 
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  letterSpacing: 0.8,
                  wordSpacing: 0.8,
                  ),
            )
            ),
            ),
        ],
      ),
    );
  }
}