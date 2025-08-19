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
  // Model for settings_option_notification.
  late SettingsOptionModel settingsOptionNotificationModel;
  // Model for settings_option_contact.
  late SettingsOptionModel settingsOptionContactModel;
  // Model for settings_option_language.
  late SettingsOptionModel settingsOptionLanguageModel;
  // Model for settings_option_reset.
  late SettingsOptionModel settingsOptionResetModel;
  // Model for settings_option_logout.
  late SettingsOptionModel settingsOptionLogoutModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in settings_option_logout widget.
  bool? confirmLogout;

  @override
  void initState(BuildContext context) {
    userNameIconModel = createModel(context, () => UserNameIconModel());
    settingsOptionNotificationModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionContactModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionLanguageModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionResetModel =
        createModel(context, () => SettingsOptionModel());
    settingsOptionLogoutModel =
        createModel(context, () => SettingsOptionModel());
  }

  @override
  void dispose() {
    userNameIconModel.dispose();
    settingsOptionNotificationModel.dispose();
    settingsOptionContactModel.dispose();
    settingsOptionLanguageModel.dispose();
    settingsOptionResetModel.dispose();
    settingsOptionLogoutModel.dispose();
  }
}
