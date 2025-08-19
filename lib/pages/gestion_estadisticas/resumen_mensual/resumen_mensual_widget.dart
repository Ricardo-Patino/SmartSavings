import '/auth/custom_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
            .orderBy('periodDate'),
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
              leading: FFButtonWidget(
                onPressed: () {
                  print('ButtonBack pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'mx7bpzwl' /* Button */,
                ),
                icon: Icon(
                  Icons.keyboard_backspace_rounded,
                  size: 25.0,
                ),
                options: FFButtonOptions(
                  width: 50.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFE0E3E7),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: Colors.black,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'gjoby9av' /* Monthly Summary */,
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
                      color: Color(0xBB000000),
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 370.0,
                          height: 230.0,
                          child: FlutterFlowBarChart(
                            barData: [
                              FFBarChartData(
                                yData: resumenMensualTransaccionRecordList
                                    .map((d) => d.monto)
                                    .toList(),
                                color: FlutterFlowTheme.of(context).primary,
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
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              showBorder: false,
                            ),
                            axisBounds: AxisBounds(),
                            xAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'v4kb7vu2' /* Date */,
                              ),
                              titleTextStyle: TextStyle(
                                fontSize: 14.0,
                              ),
                              reservedSize: 28.0,
                            ),
                            yAxisLabelInfo: AxisLabelInfo(
                              title: FFLocalizations.of(context).getText(
                                'jcjg6tnl' /* Amount */,
                              ),
                              titleTextStyle: TextStyle(
                                fontSize: 14.0,
                              ),
                              reservedSize: 42.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 30.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .around(SizedBox(height: 15.0)),
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
