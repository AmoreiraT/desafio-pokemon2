import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:convert';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_model.dart';
export 'list_model.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late ListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult8xg = await GetAllPokesCall.call();

      if (desafio_pokemon2_2c1go2_data_schema.PokedexStruct.maybeFromMap(
              (_model.apiResult8xg?.jsonBody ?? ''))!
          .results
          .contains(desafio_pokemon2_2c1go2_data_schema.ResultsStruct())) {
        unawaited(
          () async {
            _model.apiResult3qz = await GetAllPokesCall.call();
          }(),
        );
      } else {
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.listModel,
      updateCallback: () => safeSetState(() {}),
      child: ListWidget(),
    );
  }
}
