import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plantcare/app_colors.dart';
import 'package:plantcare/plant.dart';

class DetailPage extends StatelessWidget {
  final Plant plant;

  DetailPage({this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.backgroundGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 16),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  plant.commonName,
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                                Text(
                                  plant.scientificName,
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: plant.status == 'Healthy'
                                          ? AppColors.lightGreen
                                              .withOpacity(0.8)
                                          : AppColors.yellow,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      plant.status,
                                      style: TextStyle(
                                        color: plant.status == 'Healthy'
                                            ? AppColors.green
                                            : AppColors.lightYellow,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Hero(
                            tag: plant.scientificName,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(plant.image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Text(
                  'Plant Care',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        child: SvgPicture.asset(
                                          plant.plantCare[index].icon,
                                          color: AppColors.lightGreen,
                                          width: 20,
                                        ),
                                        backgroundColor: AppColors.green,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          plant.plantCare[index].description,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: plant.plantCare.length,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Watering',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                CircularPercentIndicator(
                                  lineWidth: 10,
                                  radius: 100,
                                  percent: plant.nextWatering / 10,
                                  center: Text(
                                    '${plant.nextWatering}\ndays',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  backgroundColor: AppColors.lightGreen,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Information',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(right: 31),
                            child: Text(
                              plant.description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontFamily: 'OpenSans',
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
