import 'package:chamsoccaytrong/constants/utils.dart';
import 'package:chamsoccaytrong/models/plant_model.dart';
import 'package:chamsoccaytrong/page/main/home/plant_details_page.dart';
import 'package:flutter/material.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({super.key, required this.index, required this.plantIndividual});
  final int index;
  final PlantModel plantIndividual;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> PlantDetailsPage(plantIndividual: plantIndividual)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
    
            ),
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                fit:BoxFit.cover,
              plantIndividual.url,),
            ),
           
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom: 4.0,),
                      child: Text(
                        plantIndividual.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                  "${plantIndividual.age} ngày tuổi ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
                  ],
                ),
              ),
            ),
            
            ],
        ),
      ),
    );

    
  }
}