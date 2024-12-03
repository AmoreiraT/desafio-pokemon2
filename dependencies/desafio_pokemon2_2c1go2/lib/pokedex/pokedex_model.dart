import '/components/home_c_omponent_widget.dart';
import '/components/list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pokedex_widget.dart' show PokedexWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PokedexModel extends FlutterFlowModel<PokedexWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for list component.
  ListModel? _listModel;
  ListModel get listModel => _listModel ??= ListModel();

  // Model for HomeCOmponent component.
  late HomeCOmponentModel homeCOmponentModel;

  @override
  void initState(BuildContext context) {
    homeCOmponentModel = createModel(context, () => HomeCOmponentModel());
  }

  @override
  void dispose() {
    listModel.dispose();
    homeCOmponentModel.dispose();
  }
}
