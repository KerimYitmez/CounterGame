import 'package:flutter/material.dart';
import 'package:meylin_avel/game_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    String backgroundImage = useMobileLayout
        ? 'lib/assets/images/background_startpage_smartphone.jpeg'
        : 'lib/assets/images/background_startpage_tablet.jpeg';

    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text("Meylin & Avel's Counter Game"),
      ),
      */
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          // Logo
          Align(
            alignment: Alignment(
                0, -0.5), // Zentriert horizontal, oben im oberen Viertel
            child:
                Image.asset('lib/assets/images/logo_counter_game_100x103.png'),
          ),
          // Spielen-Button
          Align(
            alignment: Alignment(
                0, 0.5), // Zentriert horizontal, unten im unteren Viertel
            child: ElevatedButton(
              child: Text('Spielen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
/*
class _SplashScreenState {
   @override
  void initState() {
    super.initState();
    navigateToHome();
  }
 
} */



/*
import 'package:flutter/material.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var useMobileLayout = shortestSide < 600;
    String splashImage = useMobileLayout
        ? 'lib/assets/images/meylin_avel_cover_smartphone.jpg'
        : 'lib/assets/images/meylin_avel_cover_tablet.jpg';

    return Scaffold(
        body: Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                splashImage,
                // 'lib/assets/images/kinder_500x500.jpg',

                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showSpecialGraphic = false;
  int maxGraphicNumber = 4;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 10 == 0) {
        showSpecialGraphic = true;
        Future.delayed(Duration(seconds: 5), () {
          setState(() {
            showSpecialGraphic = false;
          });
        });
      }
    });
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
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/assets/images/background_blue_500x500.jpg', // Ändern Sie den Pfad zur Bilddatei hier
                //  'lib/assets/images/background_blue_500x500_blurt.jpg',
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 50),
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
                            height: 200,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          child: Image.asset(
                            'lib/assets/images/jesus_331x407.jpg',
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('>> 0'),
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
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/assets/images/background_blue_500x500.jpg', // Ändern Sie den Pfad zur Bilddatei hier
                //  'lib/assets/images/background_blue_500x500_blurt.jpg',
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 60),
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
                            height: 200,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          child: Image.asset(
                            'lib/assets/images/jesus_331x407.jpg',
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('>> 0'),
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
    double scaleFactor = MediaQuery.of(context).size.shortestSide / 340;

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/assets/images/background_blue_190x190.jpg', // Ändern Sie den Pfad zur Bilddatei hier

                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineLarge,
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
                SizedBox(height: 50 * scaleFactor),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('>> 0'),
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
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 2.0, // Vergrößert das Bild um das 2-fache
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/assets/images/background_blue_500x500.jpg', // Ändern Sie den Pfad zur Bilddatei hier
                //  'lib/assets/images/background_blue_500x500_blurt.jpg',
                fit: BoxFit
                    .cover, // This is important as it allows the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(height: 50),
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
                            height: 200,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: _incrementCounter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55.0),
                          child: Image.asset(
                            'lib/assets/images/jesus_331x407.jpg',
                            height: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: Text('>> 0'),
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
*/