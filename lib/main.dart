import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc_observer.dart';
import 'core/routes/routes.dart';
import 'features/country/presentation/bloc/country/country_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /////////////////
  await di.init();
  //////////////////////////////////////////////////////////////////
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = di.sl<AppRouter>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<CountryBloc>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Country App',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
