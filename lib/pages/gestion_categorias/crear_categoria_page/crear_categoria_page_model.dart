import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_categoria_page_widget.dart' show CrearCategoriaPageWidget;
import 'package:flutter/material.dart';

class CrearCategoriaPageModel
    extends FlutterFlowModel<CrearCategoriaPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BuscarTextInput widget.
  FocusNode? buscarTextInputFocusNode;
  TextEditingController? buscarTextInputTextController;
  String? Function(BuildContext, String?)?
      buscarTextInputTextControllerValidator;
  // State field(s) for NombreInput widget.
  FocusNode? nombreInputFocusNode;
  TextEditingController? nombreInputTextController;
  String? Function(BuildContext, String?)? nombreInputTextControllerValidator;
  String? _nombreInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w42enfyi' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for PorcentajeInput widget.
  FocusNode? porcentajeInputFocusNode;
  TextEditingController? porcentajeInputTextController;
  String? Function(BuildContext, String?)?
      porcentajeInputTextControllerValidator;
  String? _porcentajeInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '32pd6p3p' /* Used Percentage is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in CrearButton widget.
  CategoriaRecord? categoria;

  @override
  void initState(BuildContext context) {
    nombreInputTextControllerValidator = _nombreInputTextControllerValidator;
    porcentajeInputTextControllerValidator =
        _porcentajeInputTextControllerValidator;
  }

  @override
  void dispose() {
    buscarTextInputFocusNode?.dispose();
    buscarTextInputTextController?.dispose();

    nombreInputFocusNode?.dispose();
    nombreInputTextController?.dispose();

    porcentajeInputFocusNode?.dispose();
    porcentajeInputTextController?.dispose();
  }
}
