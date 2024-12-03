import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pokedex_model.dart';
export 'pokedex_model.dart';

class PokedexWidget extends StatefulWidget {
  const PokedexWidget({super.key});

  @override
  State<PokedexWidget> createState() => _PokedexWidgetState();
}

class _PokedexWidgetState extends State<PokedexWidget> {
  late PokedexModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PokedexModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  HomePageWidget();
      
  }
}
