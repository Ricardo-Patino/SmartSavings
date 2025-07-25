import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_categoria_page_widget.dart' show EditarCategoriaPageWidget;
import 'package:flutter/material.dart';

class EditarCategoriaPageModel
    extends FlutterFlowModel<EditarCategoriaPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for BuscarTextInput widget.
  FocusNode? buscarTextInputFocusNode;
  TextEditingController? buscarTextInputTextController;
  String? Function(BuildContext, String?)?
      buscarTextInputTextControllerValidator;
  // State field(s) for NombreInput widget.
  FocusNode? nombreInputFocusNode;
  TextEditingController? nombreInputTextController;
  String? Function(BuildContext, String?)? nombreInputTextControllerValidator;
  // State field(s) for PorcentajeInput widget.
  FocusNode? porcentajeInputFocusNode;
  TextEditingController? porcentajeInputTextController;
  String? Function(BuildContext, String?)?
      porcentajeInputTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TipoInput widget.
  FocusNode? tipoInputFocusNode;
  TextEditingController? tipoInputTextController;
  String? Function(BuildContext, String?)? tipoInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    buscarTextInputFocusNode?.dispose();
    buscarTextInputTextController?.dispose();

    nombreInputFocusNode?.dispose();
    nombreInputTextController?.dispose();

    porcentajeInputFocusNode?.dispose();
    porcentajeInputTextController?.dispose();

    tipoInputFocusNode?.dispose();
    tipoInputTextController?.dispose();
  }
}
