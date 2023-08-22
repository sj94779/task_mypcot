import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypcot_assignment/helper/date_time_helpers.dart';
import '../../../core/app_colors.dart';
import '../../../widgets/stacked_widgets.dart';
import '../../../widgets/text_with_format.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0;

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
  DateTime currentDate = DateTime.now();

  final iconList = <String>[
    'assets/images/home_icon.svg',
    'assets/images/customer_icon.svg',
    'assets/images/khata_icon.svg',
    'assets/images/order_icon.svg',
  ];

  final titleList = <String>[
    'Home',
    'Customers',
    'Khata',
    'Orders',
  ];
  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var selectedDate;
    var size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding;
    final paddingBottom = MediaQuery.of(context).viewInsets.bottom;
    final availableHeight = size.height - paddingTop.top - paddingBottom;
    var deviceWidth = size.width;
    var deviceHeight = availableHeight;

    print('Device height is $deviceHeight');
    print('Device width is $deviceWidth');

    return SafeArea(
        child: Scaffold(
      appBar: NeumorphicAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/images/side_drawer_icon.svg',
                  height: 10.0,
                  width: 10.0,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
              //   ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/heart_circle_icon.svg',
                    height: 30.0,
                    width: 30.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                //   ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: TextWithFormat(
                                '2'.toString(),
                                fontSize: 10,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: Flexible(
                          child: RichText(
                            // maxLines: 10,
                            softWrap: true,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Welcome ',
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontWeight: FontWeight.bold,
                                    // backgroundColor: Colors.teal,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Mypcot !!',
                                  style: TextStyle(
                                    color: AppColors.fontColor,
                                    fontWeight: FontWeight.bold,
                                    // backgroundColor: Colors.teal,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // TextWithFormat(
                      //   'Welcome, Mypcot !!',
                      //   bold: true,
                      //   color: AppColors.fontColor,
                      //   fontSize: 18,
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      TextWithFormat(
                        'here is your dashboard...',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/search_icon.svg',
                            height: 25.0,
                            width: 25.0,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        //   ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 350,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          // background image and bottom contents

                          Container(
                            height: 270.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: AppColors.cardOneColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120.0,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/images/card_one_img_icon.svg',
                                          fit: BoxFit.cover,

                                          // allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 40.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColors.orange_300,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Center(
                                              child: TextWithFormat(
                                            'Orders',
                                            color: AppColors.white,
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            bottom:
                                200.0, // (background container size) - (circle height / 2)
                            child: Container(
                              height: 120,
                              width: 150,
                              child: Stack(children: [
                                Container(
                                  height: 100.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppColors.orange_300,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        child: Flexible(
                                          child: RichText(
                                            // maxLines: 10,
                                            softWrap: true,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'You have ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    // backgroundColor: Colors.teal,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '3 ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    // backgroundColor: Colors.teal,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'active orders from',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    // backgroundColor: Colors.teal,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  // right: 50,
                                  top: 60.0,
                                  child: SizedBox(
                                    height: 60,
                                    width: 150,
                                    child: buildBox(
                                      children: [
                                        buildStackedImagesForOrangeBox(
                                            direction: TextDirection.rtl),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            bottom:
                                70.0, // (background container size) - (circle height / 2)
                            child: Container(
                              height: 120,
                              width: 150,
                              child: Stack(children: [
                                Container(
                                  height: 80.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Flexible(
                                        child: RichText(
                                          // maxLines: 10,
                                          softWrap: true,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '02 ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  // backgroundColor: Colors.teal,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Pending\n ',
                                                style: TextStyle(
                                                  color: AppColors.fontColor,
                                                  // backgroundColor: Colors.teal,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Orders from',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  // backgroundColor: Colors.teal,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  // right: 50,
                                  top: 50.0,
                                  child: SizedBox(
                                    height: 60,
                                    width: 150,
                                    child: buildBox(
                                      children: [
                                        buildStackedImagesForWhiteBox(
                                            direction: TextDirection.rtl),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          // Profile image
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          // background image and bottom contents

                          Container(
                            height: 270.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: AppColors.cardTwoColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Positioned(
                            left: 0.0,
                            bottom: 50.0,
                            child: Column(
                              children: [
                                Stack(children: [
                                  Container(
                                    height: 120.0,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  Positioned(
                                    child: SvgPicture.asset(
                                      'assets/images/card_two_img_icon.svg',
                                      fit: BoxFit.cover,

                                      // allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 40.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColors
                                                    .blueBackgroundColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Center(
                                                  child: TextWithFormat(
                                                'Subscriptions',
                                                color: AppColors.white,
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 1,
                            bottom: 120.0,
                            child: Container(
                              width: 200,
                              height: 200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 50,
                                    top:
                                        110.0, // (background container size) - (circle height / 2)
                                    child: Container(
                                      height: 70,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Flexible(
                                            child: RichText(
                                              // maxLines: 10,
                                              softWrap: true,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '10 ',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.fontColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      // backgroundColor: Colors.teal,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Active ',
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.fontColor,
                                                      // backgroundColor: Colors.teal,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Subscriptions',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      // backgroundColor: Colors.teal,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: 150,
                                    child: Stack(children: [
                                      Container(
                                        height: 100.0,
                                        width: 150.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color:
                                                AppColors.blueBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Flexible(
                                              child: RichText(
                                                // maxLines: 10,
                                                softWrap: true,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '03 ',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // backgroundColor: Colors.teal,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'deliveries',
                                                      style: TextStyle(
                                                        color: AppColors.white,
                                                        // backgroundColor: Colors.teal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                        // right: 50,
                                        top: 60.0,
                                        child: SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: buildBox(
                                            children: [
                                              buildStackedImagesForOrangeBox(
                                                  direction: TextDirection.rtl),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            right: 20,
                            bottom:
                                60.0, // (background container size) - (circle height / 2)
                            child: Container(
                              height: 70,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Flexible(
                                    child: RichText(
                                      // maxLines: 10,
                                      softWrap: true,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '119 ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              // backgroundColor: Colors.teal,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Pending\n ',
                                            style: TextStyle(
                                              color: AppColors.fontColor,
                                              // backgroundColor: Colors.teal,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Deliveries',
                                            style: TextStyle(
                                              color: Colors.black,
                                              // backgroundColor: Colors.teal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          // Profile image
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          // background image and bottom contents

                          Container(
                            height: 270.0,
                            width: 350,
                            decoration: BoxDecoration(
                                color: AppColors.cardThreeColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Positioned(
                            left: 0.5,
                            bottom: 50.0,
                            child: Column(
                              children: [
                                Stack(children: [
                                  Container(
                                    height: 120.0,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  Positioned(
                                    child: SvgPicture.asset(
                                      'assets/images/card_three_img_icon.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 40.0,
                                            width: 150.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                color: AppColors
                                                    .pinkBackgroundColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Center(
                                                  child: TextWithFormat(
                                                'View Customers',
                                                color: AppColors.white,
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 170,
                            bottom: 120.0,
                            child: Container(
                              width: 200,
                              height: 200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 50,
                                    top:
                                        110.0, // (background container size) - (circle height / 2)
                                    child: Container(
                                      height: 70,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            TextWithFormat(
                                              '1.8 %',
                                              color: AppColors.black,
                                              maxLines: 2,
                                              bold: true,
                                              fontSize: 20,
                                            ),
                                            Icon(
                                              Icons.arrow_upward_rounded,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: 150,
                                    child: Stack(children: [
                                      Container(
                                        height: 100.0,
                                        width: 150.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color:
                                                AppColors.pinkBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Flexible(
                                              child: RichText(
                                                // maxLines: 10,
                                                softWrap: true,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '15 ',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        // backgroundColor: Colors.teal,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'New customers',
                                                      style: TextStyle(
                                                        color: AppColors.white,
                                                        // backgroundColor: Colors.teal,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                        // right: 50,
                                        top: 60.0,
                                        child: SizedBox(
                                          height: 60,
                                          width: 150,
                                          child: buildBox(
                                            children: [
                                              buildStackedImagesForOrangeBox(
                                                  direction: TextDirection.rtl),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Positioned(
                            right: 10,
                            bottom:
                                10.0, // (background container size) - (circle height / 2)
                            child: Container(
                              height: 120,
                              width: 160,
                              child: Stack(children: [
                                Container(
                                  height: 60.0,
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: RichText(
                                          // maxLines: 10,
                                          softWrap: true,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '10 ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  // backgroundColor: Colors.teal,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Active\n ',
                                                style: TextStyle(
                                                  color: AppColors.fontColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Customers',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Positioned(
                                  // right: 50,
                                  left: 45,
                                  top: 5.0,
                                  child: SizedBox(
                                    height: 60,
                                    width: 150,
                                    child: buildBox(
                                      children: [
                                        buildStackedImagesForThirdCard(
                                            direction: TextDirection.rtl),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          // Profile image
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.0,
                      width: 80.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWithFormat(
                            currentDate.getDateStringWithMonthAndDate(),
                            color: AppColors.fontColor,
                            fontSize: 10,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextWithFormat(
                            'Today',
                            bold: true,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 110.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                            child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: TextWithFormat('TIMELINE',
                                fontSize: 12, bold: true),
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        )),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 140.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(
                                width: 5,
                              ),
                              TextWithFormat(
                                selectedDate.getDateStringWithMonthName(),
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                child: AnimatedHorizontalCalendar(
                    tableCalenderIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    date: selectedDate,
                    textColor: Colors.black45,
                    backgroundColor: Colors.white,
                    tableCalenderThemeData: ThemeData.light().copyWith(
                      primaryColor: Colors.green,
                      buttonTheme:
                          ButtonThemeData(textTheme: ButtonTextTheme.primary),
                      colorScheme: ColorScheme.light(primary: Colors.green)
                          .copyWith(secondary: Colors.green),
                    ),
                    selectedColor: Colors.white10,
                    onDateSelected: (date) {
                      // selectedDate = date;
                      selectedDate = DateTime.parse(date);
                    }),
              ),
              Container(
                height: 200.0,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWithFormat(
                            'New order created',
                            fontSize: 18,
                            color: AppColors.fontColor,
                            bold: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextWithFormat(
                            'New Order created with Order'.toString(),
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextWithFormat(
                            '09:00 AM'.toString(),
                            fontSize: 12,
                            bold: true,
                            color: AppColors.orange_300,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.orange_300,
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/images/card_two_img_icon.svg',
                        height: 100.0,
                        width: 100.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.fontColor,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? AppColors.orange_300 : AppColors.orange_500;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconList[index],
                height: 20.0,
                width: 20.0,
                allowDrawingOutsideViewBox: true,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextWithFormat(
                  titleList[index],
                  maxLines: 1,
                ),
              )
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        hideAnimationController: _hideBottomBarAnimationController,
      ),
    ));
  }

  Widget buildBox({
    required List<Widget> children,
  }) =>
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      );

  Widget buildStackedImagesForOrangeBox({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 60;
    final double xShift = 20;
    final urlImages = [
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildStackedImagesForWhiteBox({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 60;
    final double xShift = 20;
    final urlImages = [
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildStackedImagesForThirdCard({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 40;
    final double xShift = 20;
    final urlImages = [
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ];

    final items =
        urlImages.map((urlImage) => buildImageForThirdCard(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    final double borderSize = 5;

    return ClipOval(
      child: Container(
        height: 30,
        width: 30,
        padding: EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildImageForThirdCard(String urlImage) {
    final double borderSize = 5;

    return ClipOval(
      child: Container(
        height: 10,
        width: 10,
        padding: EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
