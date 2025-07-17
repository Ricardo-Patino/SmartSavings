import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_expense_widget.dart' show EditExpenseWidget;
import 'package:flutter/material.dart';

class EditExpenseModel extends FlutterFlowModel<EditExpenseWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  ExpenseStruct? expense;
  void updateExpenseStruct(Function(ExpenseStruct) updateFn) {
    updateFn(expense ??= ExpenseStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for typeDropdown widget.
  String? typeDropdownValue;
  FormFieldController<String>? typeDropdownValueController;
  // State field(s) for categoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for tfAmount widget.
  FocusNode? tfAmountFocusNode;
  TextEditingController? tfAmountTextController;
  String? Function(BuildContext, String?)? tfAmountTextControllerValidator;
  String? _tfAmountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z0ydpuso' /* Amount is required */,
      );
    }

    if (!RegExp('^[-+]?\\d+(\\.\\d{1,2})?\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0636u1e0' /* Invalid value for Amount. Ex: ... */,
      );
    }
    return null;
  }

  // State field(s) for tfDescription widget.
  FocusNode? tfDescriptionFocusNode;
  TextEditingController? tfDescriptionTextController;
  String? Function(BuildContext, String?)? tfDescriptionTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? confirmDelete;

  @override
  void initState(BuildContext context) {
    tfAmountTextControllerValidator = _tfAmountTextControllerValidator;
  }

  @override
  void dispose() {
    tfAmountFocusNode?.dispose();
    tfAmountTextController?.dispose();

    tfDescriptionFocusNode?.dispose();
    tfDescriptionTextController?.dispose();
  }
}
