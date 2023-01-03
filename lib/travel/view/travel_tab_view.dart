import 'package:flutter/material.dart';
import 'package:mobx_learn/travel/view/travel_view.dart';

enum _TravelPages {
  home,
  bookmark,
  nofication,
  profile,
}

class TravelTabView extends StatelessWidget {
  const TravelTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _TravelPages.values.length,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.access_alarm),
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TravelView(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
