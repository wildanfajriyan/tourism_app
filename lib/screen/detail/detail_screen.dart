import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';
import 'package:tourism_app/screen/detail/bookmark_icon_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.tourism});

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism Detail'),
        actions: [BookmarkIconWidget(tourism: tourism)],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Hero(
                tag: tourism.image,
                child: Image.network(
                  tourism.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox.square(
                dimension: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tourism.name,
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(
                        tourism.address,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      Icon(Icons.favorite),
                      SizedBox.square(
                        dimension: 4,
                      ),
                      Text(
                        tourism.like.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )
                ],
              ),
              SizedBox.square(
                dimension: 16,
              ),
              Text(
                tourism.description,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ])),
      ),
    );
  }
}
