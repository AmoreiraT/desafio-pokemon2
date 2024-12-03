import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart';
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

      if (_model.apiResult1f9?.jsonBody != null) {
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
    return const CustomPokemonWidget();
  }
}
