import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'estadisticas_widget.dart' show EstadisticasWidget;
import 'package:flutter/material.dart';

class EstadisticasModel extends FlutterFlowModel<EstadisticasWidget> {
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
