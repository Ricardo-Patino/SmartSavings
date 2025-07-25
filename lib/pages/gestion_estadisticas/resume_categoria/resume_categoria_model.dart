import '/flutter_flow/flutter_flow_util.dart';
import 'resume_categoria_widget.dart' show ResumeCategoriaWidget;
import 'package:flutter/material.dart';

class ResumeCategoriaModel extends FlutterFlowModel<ResumeCategoriaWidget> {
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
