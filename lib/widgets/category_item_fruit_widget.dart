import '../ui/flutter_flow_theme.dart';
import '../ui/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/category_item_fruit_model.dart';
export '../models/category_item_fruit_model.dart';

class CategoryItemFruitWidget extends StatefulWidget {
  const CategoryItemFruitWidget({Key? key}) : super(key: key);

  @override
  _CategoryItemFruitWidgetState createState() =>
      _CategoryItemFruitWidgetState();
}

class _CategoryItemFruitWidgetState extends State<CategoryItemFruitWidget> {
  late CategoryItemFruitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryItemFruitModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Opacity(
          opacity: FFAppState().categorySelected == 'Dried fruit' ? 1.0 : 0.7,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().update(() {
                FFAppState().categorySelected = 'Dried fruit';
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                'https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8zNV9waG90b2dyYXBoeV9vZl9wYXJ0aXRpb25fd29vZGVuX3BsYXRlX3dpdGhfY182Nzc4OTNkOC1kMDA3LTQwOWYtYTdlZC1mZGY3YTEzZjE1Y2ZfMS5wbmc.png',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          'Dried fruit',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: FFAppState().categorySelected == 'Dried fruit'
                    ? Color(0xFF322920)
                    : Color(0xFF71665E),
                fontSize: 12.0,
              ),
        ),
      ].divide(SizedBox(height: 3.0)),
    );
  }
}
