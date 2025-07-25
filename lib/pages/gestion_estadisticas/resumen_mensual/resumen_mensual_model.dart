import '/flutter_flow/flutter_flow_util.dart';
import 'resumen_mensual_widget.dart' show ResumenMensualWidget;
import 'package:flutter/material.dart';

class ResumenMensualModel extends FlutterFlowModel<ResumenMensualWidget> {
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
