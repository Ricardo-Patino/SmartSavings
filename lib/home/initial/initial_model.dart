import '/components/user_name_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'initial_widget.dart' show InitialWidget;
import 'package:flutter/material.dart';

class InitialModel extends FlutterFlowModel<InitialWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for user_name_icon component.
  late UserNameIconModel userNameIconModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  int? monthPicker;

  @override
  void initState(BuildContext context) {
    userNameIconModel = createModel(context, () => UserNameIconModel());
  }

  @override
  void dispose() {
    userNameIconModel.dispose();
  }
}
