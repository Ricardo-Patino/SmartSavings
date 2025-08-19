import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_page_widget.dart' show MainPageWidget;
import 'package:flutter/material.dart';

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in IconButton widget.
  bool? confirmLogout;
  // State field(s) for BuscarTextInput widget.
  FocusNode? buscarTextInputFocusNode;
  TextEditingController? buscarTextInputTextController;
  String? Function(BuildContext, String?)?
      buscarTextInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarTextInputFocusNode?.dispose();
    buscarTextInputTextController?.dispose();
  }
}
