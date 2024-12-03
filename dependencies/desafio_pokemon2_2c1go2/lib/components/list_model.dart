import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:convert';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import 'list_widget.dart' show ListWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListModel extends FlutterFlowModel<ListWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getAllPokes)] action in list widget.
  ApiCallResponse? apiResult8xg;
  // Stores action output result for [Backend Call - API (getAllPokes)] action in list widget.
  ApiCallResponse? apiResult3qz;
  // Model for list component.
  ListModel? _listModel;
  ListModel get listModel => _listModel ??= ListModel();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listModel.dispose();
  }
}
