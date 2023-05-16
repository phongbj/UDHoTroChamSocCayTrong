import 'package:chamsoccaytrong/constants/app_styles.dart';
import 'package:chamsoccaytrong/page/main/widget/location_details_bar.dart';
import 'package:chamsoccaytrong/page/main/widget/logo_bar_widget.dart';
import 'package:chamsoccaytrong/page/main/widget/plants_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  ScrollController controller=ScrollController();
  double offset=0;

  @override
  void initState() {
     controller.addListener(() {
      setState(() {
        offset=controller.position.pixels;
      });
    }
    );
    super.initState();
  }
  @override 
  void dispose()
  {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:LogoBarWidget(
        hasBackButton: false,
        todaysWeather: "The sun shines beautifully today. Make sure that the plants get enough water!"),
      body: Stack(
        children:[ SingleChildScrollView(
          controller: controller,
          child: Column(
            children:const [
                  SizedBox(
                    height: AppStyles.kAppBarHeight/2,
                  ),
                  PlantsGridview(),
                  ],
                  ),
                  ),
        LocationDetailsBar(offset: offset, location: "Tp Hồ Chí Minh",temperature: 29),
        ],
      ),
    );
  }
}
