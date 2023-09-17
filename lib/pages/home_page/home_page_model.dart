import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/rating_star/rating_star_widget.dart';
import '/flutter/flutter_icon_button.dart';
import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import '/flutter/flutter_widgets.dart';
import 'dart:ui';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for ratingStar dynamic component.
  late FlutterDynamicModels<RatingStarModel> ratingStarModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    ratingStarModels = FlutterDynamicModels(() => RatingStarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    ratingStarModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
