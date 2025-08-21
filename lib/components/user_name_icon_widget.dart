import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_name_icon_model.dart';
export 'user_name_icon_model.dart';

class UserNameIconWidget extends StatefulWidget {
  const UserNameIconWidget({
    super.key,
    double? size,
    double? fontSize,
  })  : this.size = size ?? 32.0,
        this.fontSize = fontSize ?? 14.0;

  final double size;
  final double fontSize;

  @override
  State<UserNameIconWidget> createState() => _UserNameIconWidgetState();
}

class _UserNameIconWidgetState extends State<UserNameIconWidget> {
  late UserNameIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserNameIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Color(0xD928D84C),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Icon(
        Icons.savings_outlined,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
    );
  }
}
