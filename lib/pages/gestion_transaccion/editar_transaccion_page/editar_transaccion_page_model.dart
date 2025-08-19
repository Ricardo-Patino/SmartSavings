import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_transaccion_page_widget.dart' show EditarTransaccionPageWidget;
import 'package:flutter/material.dart';

class EditarTransaccionPageModel
    extends FlutterFlowModel<EditarTransaccionPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for BuscarTextInput widget.
  FocusNode? buscarTextInputFocusNode;
  TextEditingController? buscarTextInputTextController;
  String? Function(BuildContext, String?)?
      buscarTextInputTextControllerValidator;
  // State field(s) for MontoInput widget.
  FocusNode? montoInputFocusNode;
  TextEditingController? montoInputTextController;
  String? Function(BuildContext, String?)? montoInputTextControllerValidator;
  String? _montoInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'skb28ehs' /* Amount is required */,
      );
    }

    return null;
  }

  // State field(s) for DescripcionInput widget.
  FocusNode? descripcionInputFocusNode;
  TextEditingController? descripcionInputTextController;
  String? Function(BuildContext, String?)?
      descripcionInputTextControllerValidator;
  String? _descripcionInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eiz9mx69' /* Description required */,
      );
    }

    return null;
  }

  // State field(s) for CategoriaDropDown widget.
  String? categoriaDropDownValue;
  FormFieldController<String>? categoriaDropDownValueController;
  // State field(s) for TipoDropDown widget.
  String? tipoDropDownValue;
  FormFieldController<String>? tipoDropDownValueController;
  // State field(s) for MonedaDropDown widget.
  String? monedaDropDownValue;
  FormFieldController<String>? monedaDropDownValueController;
  // State field(s) for MetodoPagoDropDown widget.
  String? metodoPagoDropDownValue;
  FormFieldController<String>? metodoPagoDropDownValueController;
  // State field(s) for EstadoDropDown widget.
  String? estadoDropDownValue;
  FormFieldController<String>? estadoDropDownValueController;

  @override
  void initState(BuildContext context) {
    montoInputTextControllerValidator = _montoInputTextControllerValidator;
    descripcionInputTextControllerValidator =
        _descripcionInputTextControllerValidator;
  }

  @override
  void dispose() {
    buscarTextInputFocusNode?.dispose();
    buscarTextInputTextController?.dispose();

    montoInputFocusNode?.dispose();
    montoInputTextController?.dispose();

    descripcionInputFocusNode?.dispose();
    descripcionInputTextController?.dispose();
  }
}
