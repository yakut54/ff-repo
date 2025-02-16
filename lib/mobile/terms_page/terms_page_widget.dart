import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'terms_page_model.dart';
export 'terms_page_model.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({super.key});

  @override
  State<TermsPageWidget> createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
  late TermsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 54.0,
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    Flexible(
                      child: AutoSizeText(
                        'Условия использования приложения',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Akrobat',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 20.0, 23.0),
                    child: Text(
                      'Принятие условий: При использовании нашего приложения, вы соглашаетесь с нашими условиями использования. Если вы не согласны с этими условиями, пожалуйста, прекратите использование приложения. Ограничения использования: Вы обязуетесь использовать наше приложение только в соответствии с действующими законами и нормами поведения. Вам запрещено использовать приложение для незаконных или вредоносных целей, включая, но не ограничиваясь, попытками взлома системы или получения несанкционированного доступа к данным других пользователей. Интеллектуальная собственность: Вся интеллектуальная собственность, связанная с нашим приложением, включая, но не ограничиваясь, лого, дизайн, тексты и коды, является собственностью нашей компании или ее лицензионных правообладателей. Вам запрещено копировать, модифицировать или распространять любые материалы, связанные с нашим приложением, без нашего предварительного разрешения. \n',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Akrobat',
                            color: Color(0xFF2D2830),
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
