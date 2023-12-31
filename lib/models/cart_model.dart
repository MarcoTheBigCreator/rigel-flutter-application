import '../widgets/cart_details_widget.dart';
import '../widgets/cart_list_widget.dart';
import '../ui/flutter_flow_icon_button.dart';
import '../ui/flutter_flow_theme.dart';
import '../ui/flutter_flow_util.dart';
import '../ui/flutter_flow_widgets.dart';
import '../widgets/cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cartList component.
  late CartListModel cartListModel;
  // Model for cartDetails component.
  late CartDetailsModel cartDetailsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cartListModel = createModel(context, () => CartListModel());
    cartDetailsModel = createModel(context, () => CartDetailsModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cartListModel.dispose();
    cartDetailsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
