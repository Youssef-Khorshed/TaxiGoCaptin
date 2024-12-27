import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StarRating(
      rating: 3.5,
      allowHalfRating: false,
      starCount: 5,
      color: Colors.amber,
    );
  }
}
