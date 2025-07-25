import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'metas_ahorro_widget.dart' show MetasAhorroWidget;
import 'package:flutter/material.dart';

class MetasAhorroModel extends FlutterFlowModel<MetasAhorroWidget> {
  ///  State fields for stateful widgets in this page.

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
