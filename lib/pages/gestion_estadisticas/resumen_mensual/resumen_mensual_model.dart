import '/flutter_flow/flutter_flow_util.dart';
import 'resumen_mensual_widget.dart' show ResumenMensualWidget;
import 'package:flutter/material.dart';

class ResumenMensualModel extends FlutterFlowModel<ResumenMensualWidget> {
  ///  Local state fields for this page.
  /// Fecha de Inicio de Mes
  DateTime? inicioMes;

  /// Fecha de Fin de Mes
  DateTime? finMes;

  int? selectedMonth;

  String? selectedYear;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
