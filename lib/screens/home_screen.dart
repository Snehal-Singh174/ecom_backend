import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:ecom_backend/controllers/order_stats_controller.dart';
import 'package:ecom_backend/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/order_stats_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My eCommerce'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Add the bar chart here
            FutureBuilder(
                future: orderStatsController.stats.value,
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderStats>> snapShot) {
                  if (snapShot.hasData) {
                    return Container(
                        height: 250,
                        padding: const EdgeInsets.all(10),
                        child: CustomBarChart(orderStats: snapShot.data!));
                  } else if (snapShot.hasError) {
                    return Text('${snapShot.error}');
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text("Go to Product"),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => OrderScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text("Go to Orders"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({Key? key, required this.orderStats}) : super(key: key);

  final List<OrderStats> orderStats;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
          id: 'orders',
          data: orderStats,
          domainFn: (series, _) =>
              DateFormat.d().format(series.dateTime).toString(),
          measureFn: (series, _) => series.orders,
          colorFn: (series, _) => series.barColor!)
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
