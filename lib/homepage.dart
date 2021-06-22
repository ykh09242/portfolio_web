import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/content_view.dart';
import 'package:portfolio_web/utils/tab_controller_handler.dart';
import 'package:portfolio_web/utils/view_wrapper.dart';
import 'package:portfolio_web/views/about_view.dart';
import 'package:portfolio_web/views/home_view.dart';
import 'package:portfolio_web/views/projects_view.dart';
import 'package:portfolio_web/widgets/bottom_bar.dart';
import 'package:portfolio_web/widgets/custom_tab.dart';
import 'package:portfolio_web/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ItemScrollController itemScrollController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  List<ContentView> contentViews = <ContentView>[
    ContentView(
      tab: const CustomTab(title: 'Home'),
      content: const HomeView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'About'),
      content: const AboutView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'Projects'),
      content: const ProjectsView(),
    )
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E24),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:
            ViewWrapper(desktopView: desktopView(), mobileView: mobileView()),
      ),
    );
  }

  Widget desktopView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        /// Tab Bar
        SizedBox(
          height: screenHeight * 0.05,
          child: CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((ContentView e) => e.tab).toList()),
        ),

        /// Tab Bar View
        SizedBox(
          height: screenHeight * 0.8,
          child: TabControllerHandler(
            tabController: tabController,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((ContentView e) => e.content).toList(),
            ),
          ),
        ),

        /// Bottom Bar
        const BottomBar()
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                iconSize: screenWidth * 0.08,
                icon: const Icon(Icons.menu_rounded),
                color: Colors.white,
                splashColor: Colors.transparent,
                onPressed: () => scaffoldKey.currentState?.openEndDrawer()),
            Expanded(
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.vertical,
                itemScrollController: itemScrollController,
                itemCount: contentViews.length,
                itemBuilder: (BuildContext context, int index) =>
                    contentViews[index].content,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return SizedBox(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: <Widget>[Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((ContentView e) => ListTile(
                        title: Text(
                          e.tab.title,
                          style: Theme.of(context).textTheme.button,
                        ),
                        onTap: () {
                          itemScrollController.scrollTo(
                              index: contentViews.indexOf(e),
                              duration: const Duration(milliseconds: 300));
                          Navigator.pop(context);
                        },
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
