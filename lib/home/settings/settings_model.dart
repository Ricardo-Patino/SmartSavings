import '/components/settings_option_widget.dart';
import '/components/user_name_icon_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for user_name_icon component.
  late UserNameIconModel userNameIconModel;
  // Model for settings_option_language.
  late SettingsOptionModel settingsOptionLanguageModel;
  // Model for settings_option_reset.
  late SettingsOptionModel settingsOptionResetModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_reset widget.
  bool? confirmReset;
  // Model for settings_option_logout.
  late SettingsOptionModel settingsOptionLogoutModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_logout widget.
  bool? confirmLogout;
  // Model for settings_option_delete.
  late SettingsOptionModel settingsOptionDeleteModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_delete widget.
  bool? confirmDelete;
  // Model for settings_option_donate.
  late SettingsOptionModel settingsOptionDonateModel;

  @override
  void initState(BuildContext context) {
    userNameIconModel = createModel(context, () => UserNameIconModel());
    settingsOptionLanguageModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionResetModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionLogoutModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionDeleteModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionDonateModel =
        createModel(context, () => SettingsOptionModel());
  }

  @override
  void dispose() {
    userNameIconModel.dispose();
    settingsOptionLanguageModel.dispose();
    settingsOptionResetModel.dispose();
    settingsOptionLogoutModel.dispose();
    settingsOptionDeleteModel.dispose();
    settingsOptionDonateModel.dispose();
  }
}
