import 'package:flutter/material.dart';
import 'package:tourism_app/data/model/tourism.dart';

class BodyOfDetailScreen extends StatelessWidget {
  final Tourism tourism;

  const BodyOfDetailScreen({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        ]),
      ),
    );
  }
}
