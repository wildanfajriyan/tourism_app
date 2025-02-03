import 'package:flutter/material.dart';
import 'package:tourism_app/model/tourism.dart';

class TourismCard extends StatelessWidget {
  const TourismCard({super.key, required this.tourism, required this.onTap});

  final Tourism tourism;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 120,
                      minWidth: 120,
                      maxHeight: 80,
                      minHeight: 80),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Hero(
                        tag: tourism.image,
                        child: Image.network(
                          tourism.image,
                          fit: BoxFit.cover,
                        ),
                      ))),
              SizedBox.square(
                dimension: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tourism.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox.square(
                      dimension: 6,
                    ),
                    Row(
                      children: [
                        Icon(Icons.pin_drop),
                        SizedBox.square(
                          dimension: 4,
                        ),
                        Expanded(
                            child: Text(
                          tourism.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                      ],
                    ),
                    SizedBox.square(
                      dimension: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        SizedBox.square(
                          dimension: 4,
                        ),
                        Expanded(
                            child: Text(
                          tourism.like.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
