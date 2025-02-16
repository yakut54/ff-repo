import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'admin_tab_bar_model.dart';
export 'admin_tab_bar_model.dart';

class AdminTabBarWidget extends StatefulWidget {
  const AdminTabBarWidget({
    super.key,
    this.onChanged,
    this.onAdvancedButtonPressed,
    this.advancedButtonText,
  });

  final Future Function(AdminMenuStruct? adminMenuItem)? onChanged;
  final Future Function()? onAdvancedButtonPressed;
  final String? advancedButtonText;

  @override
  State<AdminTabBarWidget> createState() => _AdminTabBarWidgetState();
}

class _AdminTabBarWidgetState extends State<AdminTabBarWidget> {
  late AdminTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTabBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToMenuItems(AdminMenuStruct(
        adminMenuEnum: AdminMenu.contents,
        title: 'Контент',
      ));
      _model.addToMenuItems(AdminMenuStruct(
        adminMenuEnum: AdminMenu.notifications,
        title: 'Пуш-уведомления',
      ));
      _model.addToMenuItems(AdminMenuStruct(
        adminMenuEnum: AdminMenu.subscriptions,
        title: 'Подписки',
      ));
      _model.addToMenuItems(AdminMenuStruct(
        adminMenuEnum: AdminMenu.analitycs,
        title: 'Статистика',
      ));
      _model.currentItem = _model.menuItems.firstOrNull;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isWeb,
      child: Container(
        width: 308.0,
        decoration: BoxDecoration(
          color: Color(0xFFF3F1F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
              child: Builder(
                builder: (context) {
                  final items = _model.menuItems.toList();

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(items.length, (itemsIndex) {
                      final itemsItem = items[itemsIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.currentItem = itemsItem;
                          safeSetState(() {});
                          await widget.onChanged?.call(
                            _model.currentItem,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 6.0, 0.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (itemsItem.adminMenuEnum ==
                                        AdminMenu.contents) {
                                      return Icon(
                                        FFIcons.kadminMenuContent,
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        size: 24.0,
                                      );
                                    } else if (itemsItem.adminMenuEnum ==
                                        AdminMenu.notifications) {
                                      return Icon(
                                        FFIcons.kadminMenuNotifications,
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        size: 24.0,
                                      );
                                    } else if (itemsItem.adminMenuEnum ==
                                        AdminMenu.subscriptions) {
                                      return Icon(
                                        FFIcons.kadminMenuSubscroptions,
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        size: 24.0,
                                      );
                                    } else if (itemsItem.adminMenuEnum ==
                                        AdminMenu.analitycs) {
                                      return Icon(
                                        Icons.settings_outlined,
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        size: 24.0,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.notes_outlined,
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  itemsItem.title,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        color: itemsItem.adminMenuEnum ==
                                                _model
                                                    .currentItem?.adminMenuEnum
                                            ? Color(0xFF2D2830)
                                            : Color(0xFFAAA7AC),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      );
                    })
                        .divide(SizedBox(height: 0.0))
                        .around(SizedBox(height: 0.0)),
                  );
                },
              ),
            ),
            if (widget.advancedButtonText != null &&
                widget.advancedButtonText != '')
              FFButtonWidget(
                onPressed: () async {
                  await widget.onAdvancedButtonPressed?.call();
                },
                text: widget.advancedButtonText!,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Akrobat',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
