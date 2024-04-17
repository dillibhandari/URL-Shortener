import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shorter/feature/url_generator/presentation/bloc/url_shorter_bloc.dart';
import 'package:url_shorter/global/dependency_injection.dart' as di;

class StartAppWidget extends StatelessWidget {
  final Widget child;
  const StartAppWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UrlShorterBloc>(create: (_) => di.sl<UrlShorterBloc>()),
      ],
      child: child,
    );
  }
}
