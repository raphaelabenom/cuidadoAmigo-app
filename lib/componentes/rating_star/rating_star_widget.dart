import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_star_model.dart';
export 'rating_star_model.dart';

class RatingStarWidget extends StatefulWidget {
  const RatingStarWidget({Key? key}) : super(key: key);

  @override
  _RatingStarWidgetState createState() => _RatingStarWidgetState();
}

class _RatingStarWidgetState extends State<RatingStarWidget> {
  late RatingStarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingStarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterTheme.of(context).primary,
      ),
      direction: Axis.horizontal,
      rating: 0.0,
      unratedColor: FlutterTheme.of(context).primaryBackground,
      itemCount: 5,
      itemSize: 20.0,
    );
  }
}
