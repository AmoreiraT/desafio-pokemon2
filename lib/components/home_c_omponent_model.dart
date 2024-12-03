import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_c_omponent_widget.dart' show HomeCOmponentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeCOmponentModel extends FlutterFlowModel<HomeCOmponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getAllPokes)] action in HomeCOmponent widget.
  ApiCallResponse? apiResult1f9;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future callPokes(BuildContext context) async {
    ApiCallResponse? apiResult3j7;

    apiResult3j7 = await GetAllPokesCall.call();

    if ((apiResult3j7?.succeeded ?? true)) {
      await actions.getAllPokemon();
      return;
    } else {
      return;
    }
  }
}
