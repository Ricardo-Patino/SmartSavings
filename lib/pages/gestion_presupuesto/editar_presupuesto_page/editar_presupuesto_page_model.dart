import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_presupuesto_page_widget.dart' show EditarPresupuestoPageWidget;
import 'package:flutter/material.dart';

class EditarPresupuestoPageModel
    extends FlutterFlowModel<EditarPresupuestoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CategoriaDropDown widget.
  String? categoriaDropDownValue;
  FormFieldController<String>? categoriaDropDownValueController;
  // State field(s) for MesDropDown widget.
  String? mesDropDownValue;
  FormFieldController<String>? mesDropDownValueController;
  // State field(s) for AnnioDropDown widget.
  String? annioDropDownValue;
  FormFieldController<String>? annioDropDownValueController;
  // State field(s) for MonedaDropDown widget.
  String? monedaDropDownValue;
  FormFieldController<String>? monedaDropDownValueController;
  // State field(s) for LimiteInput widget.
  FocusNode? limiteInputFocusNode;
  TextEditingController? limiteInputTextController;
  String? Function(BuildContext, String?)? limiteInputTextControllerValidator;
  String? _limiteInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1pzjb2gx' /* Limite is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    limiteInputTextControllerValidator = _limiteInputTextControllerValidator;
  }

  @override
  void dispose() {
    limiteInputFocusNode?.dispose();
    limiteInputTextController?.dispose();
  }
}
