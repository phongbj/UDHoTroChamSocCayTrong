import 'package:chamsoccaytrong/constants/app_colors.dart';
import 'package:chamsoccaytrong/page/main/calendar/calendar_page.dart';
import 'package:chamsoccaytrong/page/main/home/home_page.dart';
import 'package:chamsoccaytrong/page/main/setting/setting_page.dart';
import 'package:chamsoccaytrong/page/main/widget/item_bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/function/on_will_pop.dart';
import 'analytic/analytic_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  List<Widget> screens = [
    const HomePage(),
    const CalendarPage(),
    const AnalyticPage(),
    const SettingPage()
  ];

  DateTime? currentBackPressTime;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => onWillPop(
          action: (now) => currentBackPressTime = now,
          currentBackPressTime: currentBackPressTime,
        ),
        child: PageStorage(
          bucket: bucket,
          child: screens[currentTab],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.whisperBackground,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemBottomTab(
                    text: "Home",
                    index: 0,
                    current: currentTab,
                    icon: FontAwesomeIcons.house,
                    action: () {
                      setState(() {
                        currentTab = 0;
                      });
                    },
                  ),
                  itemBottomTab(
                    text: "Crops",
                    index: 1,
                    current: currentTab,
                    size: 28,
                    icon: Icons.streetview_rounded,
                    action: () {
                      setState(() {
                        currentTab = 1;
                      });
                    },
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemBottomTab(
                    text: "community",
                    index: 2,
                    current: currentTab,
                    icon: FontAwesomeIcons.user,
                    action: () {
                      setState(() {
                        currentTab = 2;
                      });
                    },
                  ),
                  itemBottomTab(
                    text: "Setting",
                    index: 3,
                    current: currentTab,
                    icon: FontAwesomeIcons.gear,
                    action: () {
                      setState(() {
                        currentTab = 3;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
