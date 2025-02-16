import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/categories/category_card/category_card_widget.dart';
import '/mobile/ui/no_internet/no_internet_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'categories_page_model.dart';
export 'categories_page_model.dart';

class CategoriesPageWidget extends StatefulWidget {
  const CategoriesPageWidget({super.key});

  @override
  State<CategoriesPageWidget> createState() => _CategoriesPageWidgetState();
}

class _CategoriesPageWidgetState extends State<CategoriesPageWidget> {
  late CategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.canLoadInit = await action_blocks.canLoad(context);
      if (_model.canLoadInit!) {
        _model.pageState = PageState.loading;
        safeSetState(() {});
        _model.docs = await queryCategoriesRecordOnce(
          queryBuilder: (categoriesRecord) => categoriesRecord
              .where(
                'is_visible',
                isEqualTo: true,
              )
              .where(
                'is_deleted',
                isEqualTo: false,
              )
              .orderBy('created_time'),
        );
        if (FFAppState().sub) {
          _model.categoriesDocs =
              _model.docs!.toList().cast<CategoriesRecord>();
        } else {
          _model.categoriesDocs = _model.docs!
              .where((e) => !e.isPaid)
              .toList()
              .toList()
              .cast<CategoriesRecord>();
        }

        _model.pageState = PageState.loaded;
        safeSetState(() {});
        unawaited(
          () async {
            await action_blocks.updateOnlineStatus(context);
          }(),
        );
      } else {
        _model.pageState = PageState.failure;
        safeSetState(() {});
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF8F7),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.pageState == PageState.loaded) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20.0,
                    0,
                    20.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 400.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              final categories = _model.categoriesDocs.toList();

                              return Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(categories.length,
                                    (categoriesIndex) {
                                  final categoriesItem =
                                      categories[categoriesIndex];
                                  return CategoryCardWidget(
                                    key: Key(
                                        'Keytq1_${categoriesIndex}_of_${categories.length}'),
                                    type: () {
                                      if (functions.isCategoryCardLong(
                                          categoriesIndex)) {
                                        return CategoryCardType.long;
                                      } else if (!functions.isCategoryCardLong(
                                          categoriesIndex)) {
                                        return CategoryCardType.short;
                                      } else {
                                        return CategoryCardType.long;
                                      }
                                    }(),
                                    doc: categoriesItem,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      unawaited(
                                        () async {
                                          await actions
                                              .appMetricaReportWithJson(
                                            'Переход по категории',
                                            <String, dynamic>{
                                              'Пользователь': <String, dynamic>{
                                                'UID': currentUserReference?.id,
                                                'Роль':
                                                    functions.getNameFromRole(
                                                        currentUserDocument!
                                                            .role!),
                                              },
                                              'Категория': <String, dynamic>{
                                                'ID':
                                                    categoriesItem.reference.id,
                                                'Название': categoriesItem.name,
                                                'Платная':
                                                    categoriesItem.isPaid,
                                              },
                                              'Платформа':
                                                  functions.getCurrentPlatform(
                                                      isAndroid, isiOS),
                                            },
                                          );
                                        }(),
                                      );
                                      if (categoriesItem.isPaid) {
                                        await Future.wait([
                                          Future(() async {
                                            _model.paidCategories =
                                                await queryCategoriesRecordOnce(
                                              queryBuilder:
                                                  (categoriesRecord) =>
                                                      categoriesRecord
                                                          .where(
                                                            'is_paid',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'is_visible',
                                                            isEqualTo: true,
                                                          )
                                                          .where(
                                                            'is_deleted',
                                                            isEqualTo: false,
                                                          ),
                                            );
                                            _shouldSetState = true;
                                          }),
                                          Future(() async {
                                            _model.subscriptionTiers =
                                                await querySubscriptionTiersRecordOnce(
                                              queryBuilder:
                                                  (subscriptionTiersRecord) =>
                                                      subscriptionTiersRecord
                                                          .orderBy(
                                                              'created_time',
                                                              descending: true),
                                            );
                                            _shouldSetState = true;
                                          }),
                                        ]);

                                        context.pushNamed(
                                          'SubscriptionsPage',
                                          queryParameters: {
                                            'paidCategories': serializeParam(
                                              _model.paidCategories,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                            'subscriptionTiers': serializeParam(
                                              _model.subscriptionTiers,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'paidCategories':
                                                _model.paidCategories,
                                            'subscriptionTiers':
                                                _model.subscriptionTiers,
                                          },
                                        );
                                      } else {
                                        if (categoriesItem.link != '') {
                                          await launchURL(categoriesItem.link);
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (_model.pageState == PageState.failure) {
                return wrapWithModel(
                  model: _model.noInternetModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NoInternetWidget(
                    onRefreshPressed: () async {
                      var _shouldSetState = false;
                      _model.canLoadOnRefresh =
                          await action_blocks.canLoad(context);
                      _shouldSetState = true;
                      if (_model.canLoadOnRefresh!) {
                        _model.pageState = PageState.loading;
                        safeSetState(() {});
                        _model.docsOnRefresh = await queryCategoriesRecordOnce(
                          queryBuilder: (categoriesRecord) => categoriesRecord
                              .where(Filter.or(
                                Filter(
                                  'is_visible',
                                  isEqualTo: true,
                                ),
                                Filter(
                                  'is_deleted',
                                  isEqualTo: false,
                                ),
                              ))
                              .orderBy('created_time'),
                        );
                        _shouldSetState = true;
                        if (functions
                            .isFriendlyCountry(FFAppState().countryCode)) {
                          _model.categoriesDocs = _model.docsOnRefresh!
                              .toList()
                              .cast<CategoriesRecord>();
                        } else {
                          _model.categoriesDocs = _model.docsOnRefresh!
                              .where((e) => !e.isPaid)
                              .toList()
                              .cast<CategoriesRecord>();
                        }

                        _model.pageState = PageState.loaded;
                        safeSetState(() {});
                        unawaited(
                          () async {
                            await action_blocks.updateOnlineStatus(context);
                          }(),
                        );
                      } else {
                        _model.pageState = PageState.failure;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Загрузка...',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
