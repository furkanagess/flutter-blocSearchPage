import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx_learn/product/padding/page_padding.dart';
import 'package:mobx_learn/travel/model/travel_model.dart';

class TravelView extends StatefulWidget {
  const TravelView({super.key});

  @override
  State<TravelView> createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {
  final seeAll = "See All";
  final popularDest = "Popular destinations near you";
  final opening = "Hey Jhon! \n Where do you want to go today?";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              opening,
              style: context.textTheme.subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            context.emptySizedHeightBoxLow,
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  popularDest,
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  seeAll,
                  style: context.textTheme.subtitle1
                      ?.copyWith(color: context.colorScheme.error),
                )
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.25),
              child: ListView.builder(
                itemCount: TravelModel.mockItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Card(
                  child: SizedBox(
                    width: context.dynamicWidth(0.35),
                    child: Image.asset(TravelModel.mockItems[index].imagePath),
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
