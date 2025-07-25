import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/progress_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'report_widget.dart' show ReportWidget;
import 'package:flutter/material.dart';

class ReportModel extends FlutterFlowModel<ReportWidget> {
  ///  Local state fields for this page.

  List<ExpenseStruct> queryExpenses = [];
  void addToQueryExpenses(ExpenseStruct item) => queryExpenses.add(item);
  void removeFromQueryExpenses(ExpenseStruct item) =>
      queryExpenses.remove(item);
  void removeAtIndexFromQueryExpenses(int index) =>
      queryExpenses.removeAt(index);
  void insertAtIndexInQueryExpenses(int index, ExpenseStruct item) =>
      queryExpenses.insert(index, item);
  void updateQueryExpensesAtIndex(
          int index, Function(ExpenseStruct) updateFn) =>
      queryExpenses[index] = updateFn(queryExpenses[index]);

  List<String> queryCategory = [];
  void addToQueryCategory(String item) => queryCategory.add(item);
  void removeFromQueryCategory(String item) => queryCategory.remove(item);
  void removeAtIndexFromQueryCategory(int index) =>
      queryCategory.removeAt(index);
  void insertAtIndexInQueryCategory(int index, String item) =>
      queryCategory.insert(index, item);
  void updateQueryCategoryAtIndex(int index, Function(String) updateFn) =>
      queryCategory[index] = updateFn(queryCategory[index]);

  bool hasCategory = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  int? monthPicker;
  // Model for progress_bar component.
  late ProgressBarModel progressBarModel;

  @override
  void initState(BuildContext context) {
    progressBarModel = createModel(context, () => ProgressBarModel());
  }

  @override
  void dispose() {
    progressBarModel.dispose();
  }
}
