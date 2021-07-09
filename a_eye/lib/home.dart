import 'package:a_eye/camera.dart';
import 'package:a_eye/classifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            onPressed: () {},
            child: Icon(
              CupertinoIcons.line_horizontal_3,
              color: CupertinoColors.white,
            ),
          ),
          backgroundColor: CupertinoColors.black,
          trailing: CupertinoButton(
            onPressed: () {},
            child: Icon(
              CupertinoIcons.settings_solid,
              color: CupertinoColors.white,
            ),
          ),
          middle: Text(
            'Seeing AI',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: CupertinoColors.white),
          )),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Container(
                constraints: BoxConstraints(
                  maxHeight: 600,
                  maxWidth: 800,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: _index == 0
                    ? CameraApp()
                    : _index == 1
                        ? CameraApp()
                        : _index == 2
                            ? CameraApp()
                            : _index == 1
                                ? CameraApp()
                                : Container()),
            Spacer(),
            Container(
              height: 80,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        _index = 0;
                      });
                    },
                    fillColor: _index == 0
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.textformat_alt,
                          color: _index == 0
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Short Text',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _index == 0
                                ? CupertinoColors.white
                                : CupertinoColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 1;
                    }),
                    fillColor: _index == 1
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.barcode_viewfinder,
                          color: _index == 1
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Barcode',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 1
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 2;
                    }),
                    fillColor: _index == 2
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.money_dollar_circle,
                          color: _index == 2
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Currency',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 2
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 3;
                    }),
                    fillColor: _index == 3
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.photo_camera,
                          color: _index == 3
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Classifier',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 3
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 4;
                    }),
                    fillColor: _index == 4
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.house_alt,
                          color: _index == 4
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Scene',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 4
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 5;
                    }),
                    fillColor: _index == 5
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.person,
                          color: _index == 5
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Person',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 5
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: RawMaterialButton(
                    onPressed: () => setState(() {
                      _index = 6;
                    }),
                    fillColor: _index == 6
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    constraints: BoxConstraints(
                        minHeight: 70,
                        minWidth: 80,
                        maxHeight: 70,
                        maxWidth: 80),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.pen,
                          color: _index == 6
                              ? CupertinoColors.white
                              : CupertinoColors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Handwriting',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: _index == 6
                                  ? CupertinoColors.white
                                  : CupertinoColors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
