import 'package:flutter/material.dart';
import 'package:uidesign_home/custom/BorderBox.dart';
import 'package:uidesign_home/custom/map_Button.dart';
import 'package:uidesign_home/utils/custom_functions.dart';
import 'package:uidesign_home/utils/sample_data.dart';
import 'package:uidesign_home/utils/widget_functions.dart';

import '../utils/constants.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: padding, top: 20),
                        child: BorderBox(
                            child: Icon(
                              Icons.menu,
                              color: COLOR_BLACK,
                            ),
                            width: 50,
                            height: 50),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: padding, top: 20),
                        child: BorderBox(
                            child: Icon(
                              Icons.settings,
                              color: COLOR_BLACK,
                            ),
                            width: 50,
                            height: 50),
                      ),
                    ],
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: EdgeInsets.only(left: padding, top: 20),
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: padding, top: 10),
                    child: Text(
                      "Banaras , India",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Divider(
                      color: COLOR_GREY,
                      height: padding,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Row(
                        children:
                            ["<\$200,00", "For Sale", "3-4 Beds", ">1000sqf","Near Airport"]
                                .map((filters) => Padding(
                                      padding: const EdgeInsets.only(right: 14),
                                      child: ChooseOptions(text: filters),
                                    ))
                                .toList(),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstate(itemData: RE_DATA[index]);
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 135,
                  bottom: 20,
                  child: MapButton(
                    color: COLOR_DARK_BLUE,
                    text: "Map View",
                    iconData: Icons.map,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseOptions extends StatelessWidget {
  final String text;
  const ChooseOptions({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: COLOR_BLACK,
        ),
      ),
    );
  }
}

class RealEstate extends StatelessWidget {
  final dynamic itemData;
  RealEstate({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(itemData["image"])),
                Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                ),
                addVerticalSpace(10),
              ],
            ),
            Text(
              "${itemData["bedrooms"]} bedrooms /${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
