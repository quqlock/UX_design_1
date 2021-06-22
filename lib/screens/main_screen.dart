import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:ux1/const.dart';
import 'package:ux1/model/destination.dart';
import 'package:ux1/screens/dest_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: buildTabBar(context),
          body: buildTabBarView(context),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  TabBarView buildTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue[200],
                        backgroundImage: NetworkImage(
                            'https://www.woolha.com/media/2020/03/eevee.png'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: TextStyle(
                                  color: colorGrey,
                                  fontSize: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                  'Adam Miauczyński',
                                  style: TextStyle(
                                    color: colorNavy,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: colorGrey,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Search Destination',
                              prefixIcon: Icon(Icons.search),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              color: Colors.blue,
                            ),
                            width: 45,
                            height: 45,
                            child: Icon(
                              Boxicons.bx_slider,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Recommended',
                            style: catStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Icon(
                            Icons.more_horiz,
                            color: colorGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          for (Destination dest in destinationsList)
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DestScreen(dest),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.asset(
                                        dest.destImg,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: 70,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            '\$' +
                                                dest.destPrice
                                                    .toStringAsFixed(0),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 25,
                                      left: 5,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 150,
                                              child: Text(
                                                dest.destName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              dest.destAddress +
                                                  ', ' +
                                                  dest.destCountry,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'Top Destination',
                            style: catStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                          ),
                          child: Icon(
                            Icons.more_horiz,
                            color: colorGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (Destination dest in destinationsList)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DestScreen(dest),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 80,
                                  width: 160,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        child: Image.asset(dest.destImg),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              dest.destAddress,
                                              style: TextStyle(
                                                color: colorNavy,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dest.destCountry,
                                              style: TextStyle(
                                                color: colorGrey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: colorGrey,
        ),
        Container(
          color: colorGrey,
        ),
        Container(
          color: colorGrey,
        ),
      ],
    );
  }

  Container buildTabBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
        bottom: 20,
        top: 20,
      ),
      child: TabBar(
        labelColor: colorBlue,
        unselectedLabelColor: colorGrey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: colorBlue,
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              size: iconSize,
            ),
          ),
          Tab(
            icon: Icon(
              Boxicons.bx_compass,
              size: iconSize,
            ),
          ),
          Tab(
            icon: Icon(
              Boxicons.bx_bookmark_minus,
              size: iconSize,
            ),
          ),
          Tab(
            icon: Icon(
              Boxicons.bx_user,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}