import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showSpecialGraphic = false;
  int maxGraphicNumber = 6;

  void _incrementCounter() {
    _counter++;
    if (_counter % 10 == 0) {
      showSpecialGraphic = true;
      _checkVibrator();

      setState(() {});
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          showSpecialGraphic = false;
        });
      });
    } else {
      setState(() {});
    }
  }

  void _checkVibrator() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator == true) {
      Vibration.vibrate();
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  String getGraphicName() {
    if (_counter % 10 == 0) {
      int graphicNumber = Random().nextInt(maxGraphicNumber) + 1;
      return 'lib/assets/images/special_graphic_$graphicNumber.jpg';
    } else {
      return 'lib/assets/images/special_graphic.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useWearLayout = shortestSide < 300;
    var useMobileLayout = shortestSide < 600 && !useWearLayout;
    var useTabletLayout =
        shortestSide < 1200 && !useMobileLayout && !useWearLayout;

    if (useMobileLayout) {
      // Layout für Handys
      return _buildMobileLayout();
    } else if (useTabletLayout) {
      // Layout für Tablets
      return _buildTabletLayout();
    } else if (useWearLayout) {
      // Layout für Wear OS

      return _buildWearLayout();
    } else {
      // Standard-Layout
      return _buildDefaultLayout();
    }
  }

  Widget _buildMobileLayout() {
    String backgroundImage =
        'lib/assets/images/background_startpage_smartphone.jpeg';

    if (_counter >= 50) {
      // Ändere den Hintergrund auf ein anderes Bild
      backgroundImage = 'lib/assets/images/background_blue_500x500.jpg';
    }

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                //'lib/assets/images/background_blue_500x500.jpg',
                // 'lib/assets/images/background_startpage_smartphone.jpeg',
                backgroundImage,
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, //MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      '$_counter',

                      //style: Theme.of(context).textTheme.headline1,
                      style: const TextStyle(
                        fontSize: 60.0, // Ändern Sie die Schriftgröße
                        fontWeight: FontWeight.bold, // Machen Sie den Text fett
                        fontFamily: 'Chilanka', // Ändern Sie die Schriftart
                        color: Colors
                            .black, // Setzen Sie die Schriftfarbe auf Schwarz
                        shadows: [
                          Shadow(
                            // Unten rechts
                            offset: Offset(1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben rechts
                            offset: Offset(1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben links
                            offset: Offset(-1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Unten links
                            offset: Offset(-1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            child: Image.asset(
                              'lib/assets/images/jhvh.jpg',
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            child: Image.asset(
                                'lib/assets/images/jesus_331x407.jpg',
                                height: 200),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('0'),
                ),
              ],
            ),
          ),
          if (showSpecialGraphic)
            Center(
              child: Image.asset(
                getGraphicName(),
                //'lib/assets/images/special_graphic.jpg'
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    String backgroundImage =
        'lib/assets/images/background_startpage_smartphone.jpeg';

    if (_counter >= 50) {
      // Ändere den Hintergrund auf ein anderes Bild
      backgroundImage = 'lib/assets/images/background_blue_1125x1125.jpg';
    }
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                backgroundImage,
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      '$_counter',

                      //style: Theme.of(context).textTheme.headline1,
                      style: const TextStyle(
                        fontSize: 60.0, // Ändern Sie die Schriftgröße
                        fontWeight: FontWeight.bold, // Machen Sie den Text fett
                        fontFamily: 'Chilanka', // Ändern Sie die Schriftart
                        color: Colors
                            .black, // Setzen Sie die Schriftfarbe auf Schwarz
                        shadows: [
                          Shadow(
                            // Unten rechts
                            offset: Offset(1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben rechts
                            offset: Offset(1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben links
                            offset: Offset(-1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Unten links
                            offset: Offset(-1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            // child: Image.asset('lib/assets/images/himmel_331.jpg',
                            child: Image.asset(
                              'lib/assets/images/jhvh.jpg',
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            child: Image.asset(
                              'lib/assets/images/jesus_331x407.jpg',
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('0'),
                ),
              ],
            ),
          ),
          if (showSpecialGraphic)
            Center(
              child: Image.asset(
                getGraphicName(),
                //'lib/assets/images/special_graphic.jpg'
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWearLayout() {
    String backgroundImage =
        'lib/assets/images/background_startpage_smartphone.jpeg';

    if (_counter >= 50) {
      // Ändere den Hintergrund auf ein anderes Bild
      backgroundImage = 'lib/assets/images/background_blue_500x500.jpg';
    }

    double scaleFactor = MediaQuery.of(context).size.shortestSide / 340;

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                backgroundImage,
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      '$_counter',
                      //style: Theme.of(context).textTheme.headline1,
                      style: const TextStyle(
                        fontSize: 60.0, // Ändern Sie die Schriftgröße
                        fontWeight: FontWeight.bold, // Machen Sie den Text fett
                        fontFamily: 'Chilanka', // Ändern Sie die Schriftart
                        color: Colors
                            .black, // Setzen Sie die Schriftfarbe auf Schwarz
                        shadows: [
                          Shadow(
                            // Unten rechts
                            offset: Offset(1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben rechts
                            offset: Offset(1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben links
                            offset: Offset(-1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Unten links
                            offset: Offset(-1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20 * scaleFactor),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: _incrementCounter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          // child: Image.asset('lib/assets/images/himmel_331.jpg',
                          child: Image.asset(
                            'lib/assets/images/jhvh.jpg',
                            height: 200 * scaleFactor,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          child: Image.asset(
                            'lib/assets/images/jesus_331x407.jpg',
                            //height: 200 * scaleFactor,
                            height: 200 * scaleFactor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('0'),
                ),
              ],
            ),
          ),
          if (showSpecialGraphic)
            Center(
              child: Image.asset(
                getGraphicName(),
                //'lib/assets/images/special_graphic.jpg'
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDefaultLayout() {
    String backgroundImage =
        'lib/assets/images/background_startpage_smartphone.jpeg';

    if (_counter >= 50) {
      // Ändere den Hintergrund auf ein anderes Bild
      backgroundImage = 'lib/assets/images/background_blue_1125x1125.jpg';
    }

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                backgroundImage,
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      '$_counter',
                      //style: Theme.of(context).textTheme.headline1,
                      style: const TextStyle(
                        fontSize: 60.0, // Ändern Sie die Schriftgröße
                        fontWeight: FontWeight.bold, // Machen Sie den Text fett
                        fontFamily: 'Chilanka', // Ändern Sie die Schriftart
                        color: Colors
                            .black, // Setzen Sie die Schriftfarbe auf Schwarz
                        shadows: [
                          Shadow(
                            // Unten rechts
                            offset: Offset(1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben rechts
                            offset: Offset(1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Oben links
                            offset: Offset(-1.5, -1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                          Shadow(
                            // Unten links
                            offset: Offset(-1.5, 1.5),
                            color: Colors.white,
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            // child: Image.asset('lib/assets/images/himmel_331.jpg',
                            child: Image.asset(
                              'lib/assets/images/jhvh.jpg',
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(
                              color: Colors
                                  .white, // Setzen Sie die Randfarbe auf Weiß
                              width: 3.0, // Setzen Sie die Randbreite
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            child: Image.asset(
                              'lib/assets/images/jesus_331x407.jpg',
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('0'),
                ),
              ],
            ),
          ),
          if (showSpecialGraphic)
            Center(
              child: Image.asset(
                getGraphicName(),
                //'lib/assets/images/special_graphic.jpg'
              ),
            ),
        ],
      ),
    );
  }
}
