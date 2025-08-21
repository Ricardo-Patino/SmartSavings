import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'resumen_mensual_model.dart';
export 'resumen_mensual_model.dart';

class ResumenMensualWidget extends StatefulWidget {
  const ResumenMensualWidget({super.key});

  static String routeName = 'ResumenMensual';
  static String routePath = '/ResumenMensual';

  @override
  State<ResumenMensualWidget> createState() => _ResumenMensualWidgetState();
}

class _ResumenMensualWidgetState extends State<ResumenMensualWidget> {
  late ResumenMensualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResumenMensualModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransaccionRecord>>(
      stream: queryTransaccionRecord(
        queryBuilder: (transaccionRecord) => transaccionRecord
            .where(
              'ownerID',
              isEqualTo: currentUserUid,
            )
            .where(
              'createdAt',
              isGreaterThanOrEqualTo: functions.getStartOfMonth(),
            )
            .where(
              'createdAt',
              isLessThan: functions.getStartOfNextMonth(),
            )
            .orderBy('createdAt'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TransaccionRecord> resumenMensualTransaccionRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xBB000000),
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'fg40umyx' /* Monthly Summary */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Color(0xBBFFFFFF),
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        width: 370.0,
                        height: 315.8,
                        child: FlutterFlowBarChart(
                          barData: [
                            FFBarChartData(
                              yData: resumenMensualTransaccionRecordList
                                  .map((d) => d.monto)
                                  .toList(),
                              color: FlutterFlowTheme.of(context).success,
                            )
                          ],
                          xLabels: resumenMensualTransaccionRecordList
                              .map((d) => d.periodDate)
                              .toList(),
                          barWidth: 16.0,
                          barBorderRadius: BorderRadius.circular(8.0),
                          groupSpace: 8.0,
                          alignment: BarChartAlignment.spaceAround,
                          chartStylingInfo: ChartStylingInfo(
                            backgroundColor: Color(0xFFFBFBFB),
                            showGrid: true,
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              '9oqghfaz' /* Date */,
                            ),
                            titleTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            showLabels: true,
                            labelTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                            labelInterval: 10.0,
                            reservedSize: 28.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              'fdj3m0pw' /* Amount */,
                            ),
                            titleTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            showLabels: true,
                            labelTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            labelInterval: 5000.0,
                            labelFormatter: LabelFormatter(
                              numberFormat: (val) => formatNumber(
                                val,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                              ),
                            ),
                            reservedSize: 60.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'j1g286dt' /* This chart shows information a... */,
                        ),
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
