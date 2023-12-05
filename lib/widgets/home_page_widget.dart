import '../ui/flutter_flow_animations.dart';
import '../ui/flutter_flow_icon_button.dart';
import '../ui/flutter_flow_theme.dart';
import '../ui/flutter_flow_util.dart';
import '../ui/flutter_flow_widgets.dart';
import 'category_item_fruit_widget.dart';
import 'category_item_nuts_widget.dart';
import 'home_products_slider_widget.dart';
import 'selected_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/home_page_model.dart';
export '../models/home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'selectedProductOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          leading: Icon(
            Icons.menu_rounded,
            color: Color(0xFF121213),
            size: 24.0,
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                ),
                child: FlutterFlowIconButton(
                  borderRadius: 40.0,
                  borderWidth: 0.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xFF121213),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'cart',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 200),
                        ),
                      },
                    );
                  },
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Hi, Hellen',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF71665E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Text(
                  'What\'s today\'s taste? 😋',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF322920),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.categoryItemFruitModel,
                      updateCallback: () => setState(() {}),
                      child: CategoryItemFruitWidget(),
                    ),
                    wrapWithModel(
                      model: _model.categoryItemNutsModel,
                      updateCallback: () => setState(() {}),
                      child: CategoryItemNutsWidget(),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
                wrapWithModel(
                  model: _model.selectedProductModel,
                  updateCallback: () => setState(() {}),
                  child: SelectedProductWidget(),
                ).animateOnPageLoad(
                    animationsMap['selectedProductOnPageLoadAnimation']!),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.homeProductsSliderModel,
                        updateCallback: () => setState(() {}),
                        child: HomeProductsSliderWidget(),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 100.0,
                        borderWidth: 1.0,
                        buttonSize: 70.0,
                        fillColor: Color(0xFFFF9958),
                        icon: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('addNewProduct');
                        },
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
