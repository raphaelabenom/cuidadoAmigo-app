import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter/flutter_theme.dart';
import '/flutter/flutter_util.dart';
import '/flutter/flutter_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountModel extends FlutterModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nameFieldCreate widget.
  TextEditingController? nameFieldCreateController;
  String? Function(BuildContext, String?)? nameFieldCreateControllerValidator;
  // State field(s) for emailFieldCreate widget.
  TextEditingController? emailFieldCreateController;
  String? Function(BuildContext, String?)? emailFieldCreateControllerValidator;
  // State field(s) for passwordFieldCreate widget.
  TextEditingController? passwordFieldCreateController;
  late bool passwordFieldCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordFieldCreateControllerValidator;
  // State field(s) for passwordFieldCreateConfirm widget.
  TextEditingController? passwordFieldCreateConfirmController;
  late bool passwordFieldCreateConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordFieldCreateConfirmControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordFieldCreateVisibility = false;
    passwordFieldCreateConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFieldCreateController?.dispose();
    emailFieldCreateController?.dispose();
    passwordFieldCreateController?.dispose();
    passwordFieldCreateConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
