import 'package:flutter/material.dart';
import 'package:plantcare/app_colors.dart';
import 'package:plantcare/detail_page.dart';
import 'package:plantcare/plant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Plant> plants = Plant.plants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 26,
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Plants',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (builder, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGreen,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Hero(
                                tag: plants[index].scientificName,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage(plants[index].image),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.only(top: 20, bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          plants[index].commonName,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          plants[index].scientificName,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            color:
                                                Colors.white.withOpacity(0.8),
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: plants[index].status ==
                                                      'Healthy'
                                                  ? AppColors.green
                                                  : AppColors.lightYellow,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Text(
                                              plants[index].status,
                                              style: TextStyle(
                                                color: plants[index].status ==
                                                        'Healthy'
                                                    ? AppColors.lightGreen
                                                    : AppColors.yellow,
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPage(
                                                          plant: plants[index]),
                                                ),
                                              );
                                            },
                                          ),
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
                    );
                  },
                  itemCount: plants.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
