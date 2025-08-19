import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_meta_page_widget.dart' show CrearMetaPageWidget;
import 'package:flutter/material.dart';

class CrearMetaPageModel extends FlutterFlowModel<CrearMetaPageWidget> {
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
        'z80ca83a' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for MontoInput widget.
  FocusNode? montoInputFocusNode;
  TextEditingController? montoInputTextController;
  String? Function(BuildContext, String?)? montoInputTextControllerValidator;
  String? _montoInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vympq6zj' /* Used Percentage is required */,
      );
    }

    return null;
  }

  // State field(s) for StateDropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in CrearButton widget.
  MetasRecord? meta;

  @override
  void initState(BuildContext context) {
    nombreInputTextControllerValidator = _nombreInputTextControllerValidator;
    montoInputTextControllerValidator = _montoInputTextControllerValidator;
  }

  @override
  void dispose() {
    buscarTextInputFocusNode?.dispose();
    buscarTextInputTextController?.dispose();

    nombreInputFocusNode?.dispose();
    nombreInputTextController?.dispose();

    montoInputFocusNode?.dispose();
    montoInputTextController?.dispose();
  }
}
