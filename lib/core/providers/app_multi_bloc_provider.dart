import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

class AppMultiBlocProvider extends StatelessWidget {
  const AppMultiBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: child,
    );
  }
}
