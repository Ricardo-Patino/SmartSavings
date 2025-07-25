import '/flutter_flow/flutter_flow_util.dart';
import 'resumen_historico_widget.dart' show ResumenHistoricoWidget;
import 'package:flutter/material.dart';

class ResumenHistoricoModel extends FlutterFlowModel<ResumenHistoricoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for BuscarEstTextInput widget.
  FocusNode? buscarEstTextInputFocusNode;
  TextEditingController? buscarEstTextInputTextController;
  String? Function(BuildContext, String?)?
      buscarEstTextInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarEstTextInputFocusNode?.dispose();
    buscarEstTextInputTextController?.dispose();
  }
}
