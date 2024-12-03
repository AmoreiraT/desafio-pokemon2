import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';
import "package:desafio_pokemon2_2c1go2/backend/schema/structs/index.dart"
    as desafio_pokemon2_2c1go2_data_schema;
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_c_omponent_model.dart';
export 'home_c_omponent_model.dart';

class HomeCOmponentWidget extends StatefulWidget {
  const HomeCOmponentWidget({super.key});

  @override
  State<HomeCOmponentWidget> createState() => _HomeCOmponentWidgetState();
}

class _HomeCOmponentWidgetState extends State<HomeCOmponentWidget> {
  late HomeCOmponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCOmponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult1f9 = await GetAllPokesCall.call();

      if (desafio_pokemon2_2c1go2_data_schema.ResultsStruct.maybeFromMap(
              (_model.apiResult1f9?.jsonBody ?? ''))!
          .toMap()) {
        await _model.callPokes(context);
        return;
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
    return Container();
  }
}
