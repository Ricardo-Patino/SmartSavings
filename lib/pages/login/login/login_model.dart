import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for Birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  late MaskTextInputFormatter birthdateMask;
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  // State field(s) for PasswordInput widget.
  FocusNode? passwordInputFocusNode;
  TextEditingController? passwordInputTextController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - parseDate] action in SubmitButton widget.
  DateTime? birthday;
  // Stores action output result for [Custom Action - encryptData] action in SubmitButton widget.
  String? passwordEncrypted;
  // Stores action output result for [Backend Call - Create Document] action in SubmitButton widget.
  UsersRecord? result;
  // State field(s) for loginEmailAddress widget.
  FocusNode? loginEmailAddressFocusNode;
  TextEditingController? loginEmailAddressTextController;
  String? Function(BuildContext, String?)?
      loginEmailAddressTextControllerValidator;
  // State field(s) for loginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordTextController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordTextControllerValidator;
  // Stores action output result for [Custom Action - encryptData] action in SignInButton widget.
  String? passwordLogin;
  // Stores action output result for [Firestore Query - Query a collection] action in SignInButton widget.
  UsersRecord? user;
  // Stores action output result for [Backend Call - API (Create JWT)] action in SignInButton widget.
  ApiCallResponse? apiToken;

  @override
  void initState(BuildContext context) {
    passwordInputVisibility = false;
    confirmPasswordVisibility = false;
    loginPasswordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    passwordInputFocusNode?.dispose();
    passwordInputTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    loginEmailAddressFocusNode?.dispose();
    loginEmailAddressTextController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordTextController?.dispose();
  }
}
