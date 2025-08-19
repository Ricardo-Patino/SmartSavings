import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailAddressRecover widget.
  FocusNode? emailAddressRecoverFocusNode;
  TextEditingController? emailAddressRecoverTextController;
  String? Function(BuildContext, String?)?
      emailAddressRecoverTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in SubmitButton widget.
  UsersRecord? userExist;
  // Stores action output result for [Custom Action - generateRandom] action in SubmitButton widget.
  String? randomNumber;
  // Stores action output result for [Custom Action - encryptData] action in SubmitButton widget.
  String? encryptedPasswordRecovery;
  // Stores action output result for [Backend Call - API (AboveLimitNotification)] action in SubmitButton widget.
  ApiCallResponse? apiResult41l;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressRecoverFocusNode?.dispose();
    emailAddressRecoverTextController?.dispose();
  }
}
