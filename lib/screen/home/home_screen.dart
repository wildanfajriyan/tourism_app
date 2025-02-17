import 'package:flutter/material.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/data/model/tourism.dart';
import 'package:tourism_app/data/model/tourism_list_response.dart';
import 'package:tourism_app/screen/home/tourism_card_widget.dart';
import 'package:tourism_app/static/navigation_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<TourismListResponse> _futureTourismResponse;

  @override
  void initState() {
    super.initState();
    _futureTourismResponse = ApiService().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tourism List')),
      body: FutureBuilder(
          future: _futureTourismResponse,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                final listOfTourism = snapshot.data!.places;
                return ListView.builder(
                  itemCount: listOfTourism.length,
                  itemBuilder: (context, index) {
                    final tourism = listOfTourism[index];

                    return TourismCard(
                      tourism: tourism,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          NavigationRoute.detailRoute.name,
                          arguments: tourism.id,
                        );
                      },
                    );
                  },
                );
              default:
                return SizedBox();
            }
          }),
    );
  }
}
