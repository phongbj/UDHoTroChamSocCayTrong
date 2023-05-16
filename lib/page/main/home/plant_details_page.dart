import 'package:chamsoccaytrong/constants/app_colors.dart';
import 'package:chamsoccaytrong/constants/app_styles.dart';
import 'package:chamsoccaytrong/constants/utils.dart';
import 'package:chamsoccaytrong/models/plant_model.dart';
import 'package:chamsoccaytrong/models/todo_work.dart';
import 'package:chamsoccaytrong/page/main/widget/logo_bar_widget.dart';
import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  PlantDetailsPage({super.key, required this.plantIndividual});
  
  final PlantModel plantIndividual;

  Size screenSize=Utils().getScreenSize();

  @override
  Widget build(BuildContext context) {
    scrollBehavior: const ConstantScrollBehavior();
    return Scaffold(
      appBar: LogoBarWidget(
        hasBackButton: false,
        todaysWeather: "The sun shines beautifully today. Make sure that the plants get enough water!"),
      body: CustomScrollView(
        
        slivers: [
          SliverAppBar(
              
              backgroundColor: Colors.transparent,
              stretch: true,
              //pinned: true,
              //floating: true,
              //snap: true,
              expandedHeight: screenSize.width+AppStyles.kAppBarHeight,
              flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: screenSize.height-(AppStyles.kAppBarHeight/2),
                width: screenSize.width,
                child: Column(
                  children: [
                    IntroductionWidgetAccountScreen(plantIndividual: plantIndividual,),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        fit:BoxFit.cover,
                        plantIndividual.url,),
            ),
            ],
          ),
        ),
            ),
          ),
          SliverAppBar(
            
            pinned: true,
            title: Text("Việc cần làm", ),
            automaticallyImplyLeading:false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.backgroundGradient,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,)
         ),
            ),
          ),
          TodoWorkList(),
        ],
      ),
    );
  
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  IntroductionWidgetAccountScreen({super.key, required this.plantIndividual});
  final PlantModel plantIndividual;
  Size screenSize=Utils().getScreenSize();
  @override
  Widget build(BuildContext context) {
     return Container(
      height: AppStyles.kAppBarHeight/2,
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.backgroundGradient,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,),
          ),
      child: Container(
        height: AppStyles.kAppBarHeight/2,
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: screenSize.width*0.6,
                  ),
                  child: Text(plantIndividual.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),),
                ),
                const SizedBox(
                width: 12,
              ),
              SizedBox(
                  width: screenSize.width*0.25,
                  child: Text(
                    "${plantIndividual.age} ngày tuổi",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),),
                ),
            ],
          ),
         
    ),
    );
  }
}

class TodoWorkList extends StatefulWidget {
  const TodoWorkList({Key? key}) : super(key: key);

  @override
  State<TodoWorkList> createState() => _TodoWorkListState();
}

class _TodoWorkListState extends State<TodoWorkList> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList (
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index){
          final TodoWork todoWork=Server.getTodoWorkByID(index);
          return Card(
            child: Row(
              children: [
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Icon(Icons.water_drop_outlined),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                          todoWork.jobName,
                          style: textTheme.headlineSmall,
                                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                        TextSpan(
                          text: "${todoWork.repetition} ",
                          style: TextStyle(color: Colors.grey[800]),),
                        TextSpan(
                          text: todoWork.time,
                          style: TextStyle(color: Colors.grey[800])),
                                          ],
                                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Switch(
                  value: todoWork.setAlarm, 
                  onChanged: (value){
                    setState(() {
                      todoWork.setAlarm=value;
                    });
                  }),
              ),
    
              ],
              
            ),
          );
        },
        childCount: Server.getTodoWorkList().length,
      ),
    );
  }
}

class ConstantScrollBehavior extends ScrollBehavior {
  const ConstantScrollBehavior();

  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}




