import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    bool isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    return Scaffold(
      appBar: AppBar(
        title: isMobile
            ? const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Humming \nBird'),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: const Text(
                'Humming \nBird',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Episodes'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('About'),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: isMobile
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SKILL UP NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'TAP HERE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 50),
              leading: Image.asset('assets/icon/episode.png', height: 30),

              title: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Episodes'),
              ),
              minVerticalPadding: 50,
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 50),
              leading: Image.asset(
                'assets/icon/message.png',
                height: 30,
              ),

              title: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'About',
                ),
              ),
            ),
          ],
        ),
      )
          : null,
      body: SizedBox(
        width: isMobile ? double.infinity : 800,
        child: ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
              ?CrossAxisAlignment.center:
          CrossAxisAlignment.start,
          layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Padding(
                padding: isDesktop? const EdgeInsets.symmetric(horizontal: 80):const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: ResponsiveBreakpoints.of(context).largerThan(MOBILE) && ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? MediaQuery.of(context).size.width /1.5: null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isDesktop? CrossAxisAlignment.start:
                    CrossAxisAlignment.center,
                    children: [
                      Text(
                        'FLUTTER WEB. \nTHE BASICS',
                        style: TextStyle(
                          fontSize: ResponsiveValue<double>(context,
                              defaultValue: 40,
                              conditionalValues: [
                                const Condition.smallerThan(
                                    name: TABLET, value: 30.0),
                                const Condition.largerThan(
                                    name: DESKTOP, value: 50.0),
                              ]).value,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET) ? TextAlign.center : TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: isDesktop? MediaQuery.of(context).size.width /5:null,
                        child: Text(
                          'In this course, we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout, Deploying, Font Changes, Hover functionality, Modals, and more.',
                          textAlign: ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET) ? TextAlign.center : TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Align(
                  alignment:  ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET)
                      ? Alignment.center
                      : Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    width:  ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                        ? double.infinity
                        : 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      onPressed: () {},
                      child: const Text("learn more",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}