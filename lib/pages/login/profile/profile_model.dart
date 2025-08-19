import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in Profile widget.
  UsersRecord? user;
  // Stores action output result for [Custom Action - decryptData] action in Profile widget.
  String? userPasswordLogged;
  // State field(s) for NicknameInput widget.
  FocusNode? nicknameInputFocusNode;
  TextEditingController? nicknameInputTextController;
  String? Function(BuildContext, String?)? nicknameInputTextControllerValidator;
  String? _nicknameInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '31b6ggmn' /* Nickname is required */,
      );
    }

    return null;
  }

  // State field(s) for EmailInput widget.
  FocusNode? emailInputFocusNode;
  TextEditingController? emailInputTextController;
  String? Function(BuildContext, String?)? emailInputTextControllerValidator;
  String? _emailInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zpx5g2wa' /* email is required */,
      );
    }

    return null;
  }

  // State field(s) for CurrentPasswordInput widget.
  FocusNode? currentPasswordInputFocusNode;
  TextEditingController? currentPasswordInputTextController;
  late bool currentPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordInputTextControllerValidator;
  String? _currentPasswordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c8jvl7u2' /* Password is required */,
      );
    }

    return null;
  }

  // State field(s) for NewPasswordInput widget.
  FocusNode? newPasswordInputFocusNode;
  TextEditingController? newPasswordInputTextController;
  late bool newPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      newPasswordInputTextControllerValidator;
  // State field(s) for ConfirmPasswordInput widget.
  FocusNode? confirmPasswordInputFocusNode;
  TextEditingController? confirmPasswordInputTextController;
  late bool confirmPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordInputTextControllerValidator;
  // Stores action output result for [Custom Action - encryptData] action in SaveButton widget.
  String? encrytedPassword;
  // Stores action output result for [Custom Action - encryptData] action in SaveButton widget.
  String? newPasswordEncrypted;

  @override
  void initState(BuildContext context) {
    nicknameInputTextControllerValidator =
        _nicknameInputTextControllerValidator;
    emailInputTextControllerValidator = _emailInputTextControllerValidator;
    currentPasswordInputVisibility = false;
    currentPasswordInputTextControllerValidator =
        _currentPasswordInputTextControllerValidator;
    newPasswordInputVisibility = false;
    confirmPasswordInputVisibility = false;
  }

  @override
  void dispose() {
    nicknameInputFocusNode?.dispose();
    nicknameInputTextController?.dispose();

    emailInputFocusNode?.dispose();
    emailInputTextController?.dispose();

    currentPasswordInputFocusNode?.dispose();
    currentPasswordInputTextController?.dispose();

    newPasswordInputFocusNode?.dispose();
    newPasswordInputTextController?.dispose();

    confirmPasswordInputFocusNode?.dispose();
    confirmPasswordInputTextController?.dispose();
  }
}
