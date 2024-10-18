import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/loadingwidget.dart';
import '../bloc/country/country_bloc.dart';
import '../widgets/countries_page/coutry_list_widget.dart';
import '../widgets/countries_page/message_display_widget.dart';

@RoutePage()
class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  void initState() {
    if (BlocProvider.of<CountryBloc>(context).fromDetails == false) {
      BlocProvider.of<CountryBloc>(context).add(
        const GetCountriesByLangEvent(lang: 'ara'),
      );
    } else {
      BlocProvider.of<CountryBloc>(context).fromDetails = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Countries'),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is LoadingCountreisState) {
            return const LoadingWidget();
          } else if (state is LoadedCountreisState) {
            return RefreshIndicator(
              onRefresh: () => onRefresh(context),
              child: CountryListWidget(
                countries: state.countries,
              ),
            );
          } else if (state is ErrorCountreisState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    BlocProvider.of<CountryBloc>(context).add(
      const RefreshCountriesEvent(lang: 'ara'),
    );
  }
}
