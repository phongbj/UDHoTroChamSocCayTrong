import 'package:chamsoccaytrong/constants/app_styles.dart';
import 'package:chamsoccaytrong/constants/utils.dart';
import 'package:chamsoccaytrong/models/plant_model.dart';
import 'package:chamsoccaytrong/page/main/widget/plant_widget.dart';
import 'package:flutter/material.dart';

class PlantsGridview extends StatefulWidget {
  const PlantsGridview({super.key});

  @override
  State<PlantsGridview> createState() => _PlantsGridviewState();
}

class _PlantsGridviewState extends State<PlantsGridview> {
  String orderTitle="Set order from newest to oldest";
  String item1Order="Set order from A to Z";
  String item2Order="Set order from Z to A";
  String item3Order="Set order from newest to oldest";
  String item4Order="Set order from oldest to newest";
  List<PlantModel>gridPlantModelList=plantModelList;
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
        children: [
          SizedBox(
                height: AppStyles.kAppBarHeight*0.7,
                child:ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(orderTitle),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context)=>[
                      PopupMenuItem(
                        child: Text(item1Order),
                        value: item1Order,),
                      PopupMenuItem(
                        child: Text(item2Order),
                        value: item2Order,),
                         PopupMenuItem(
                        child: Text(item3Order),
                        value: item3Order,),
                      PopupMenuItem(
                        child: Text(item4Order),
                        value: item4Order,)
                    ],
                    onSelected: (String newValue){
                      setState(() {
                        orderTitle=newValue;
                        reoderGrid(orderTitle);
                      });
                    },
                  ),
                ),                
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count( 
              shrinkWrap: true, 
              physics: ScrollPhysics(),
              crossAxisCount: 3,  
              childAspectRatio: 2.2/3.5,
              crossAxisSpacing: 10.0,  
              mainAxisSpacing: 10.0,  
              children: List.generate(gridPlantModelList.length, (index) {  
                return Center(  
                  child: PlantWidget(index: index, plantIndividual:gridPlantModelList[index]),  
                );  
              }  
              )  ,
          ),
          // child: Container(
          //   color: Colors.orange,
          // ),
          ),
        ],);
  }
  
  void reoderGrid(String orderTitle) {
    if(orderTitle==item1Order)
    {
    gridPlantModelList.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    }
    else if(orderTitle==item2Order)
    {
    gridPlantModelList.sort((b, a) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    }
    else if(orderTitle==item3Order)
    {
    gridPlantModelList.sort((a, b) {
      return a.age.compareTo(b.age);
      });
    }
    else 
    {
    gridPlantModelList.sort((b, a) {
      return a.age.compareTo(b.age);
      });
    }
  }
}

