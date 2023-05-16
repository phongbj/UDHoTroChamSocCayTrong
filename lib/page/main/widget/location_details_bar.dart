import 'package:chamsoccaytrong/constants/app_colors.dart';
import 'package:chamsoccaytrong/constants/app_styles.dart';
import 'package:chamsoccaytrong/constants/utils.dart';
import 'package:flutter/material.dart';

class LocationDetailsBar extends StatelessWidget {
  const LocationDetailsBar({super.key, required this.offset, required this.location, required this.temperature});
  final double offset;
  final String location;
  final int temperature;
  @override
  Widget build(BuildContext context) {
    Size screenSize=Utils().getScreenSize();
    return Positioned(
      top: -offset*0.6,
      child: Container(
        height: AppStyles.kAppBarHeight*0.6,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.lightBackgroundaGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,)
         ),
         child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:5.0),
                  child: Icon(
                    Icons.location_on,
                    color:AppColors.darkRedColor,
                    size: 28,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: screenSize.width*0.5,
                  ),
                  child: Text(
                    "$location ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 15,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Icon(
                    Icons.thermostat,
                    color:Colors.amber[900],
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: screenSize.width*0.25,
                  child: Text(
                    "$temperature °C",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 15,
                    ),),
                ),
              ],
            ),),
      ),
    );
  }
}