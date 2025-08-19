import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'transaccion_page_widget.dart' show TransaccionPageWidget;
import 'package:flutter/material.dart';

class TransaccionPageModel extends FlutterFlowModel<TransaccionPageWidget> {
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
