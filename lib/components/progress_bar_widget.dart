import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'progress_bar_model.dart';
export 'progress_bar_model.dart';

class ProgressBarWidget extends StatefulWidget {
  const ProgressBarWidget({
    super.key,
    required this.queryExpenses,
    required this.queryCategory,
    required this.queryTimestamp,
  });

  final List<ExpenseStruct>? queryExpenses;
  final List<String>? queryCategory;
  final List<int>? queryTimestamp;

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  late ProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Builder(
        builder: (context) {
          final category = widget.queryCategory!.toList();

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(category.length, (categoryIndex) {
              final categoryItem = category[categoryIndex];
              return Container(
                width: MediaQuery.sizeOf(context).width *
                    ((((functions.calculateTotalAmountFromCategory(
                                    widget.queryExpenses!.toList(),
                                    categoryItem,
                                    FFAppState().queryTimestamps.toList())!) /
                                (functions
                                    .getTotalAmountFromTimestampsCategories(
                                        FFAppState().queryTimestamps.toList(),
                                        widget.queryCategory!.toList(),
                                        widget.queryExpenses!.toList())!)) *
                            95) /
                        100),
                height: 50.0,
                decoration: BoxDecoration(
                  color: colorFromCssString(
                    functions.getCategoryColor(categoryItem)!,
                    defaultColor: Colors.black,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
