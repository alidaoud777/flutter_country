import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_app/core/routes/routes.gr.dart';
import '../../bloc/country/country_bloc.dart';

class CountryDetailWidget extends StatelessWidget {
  const CountryDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countryBloc = BlocProvider.of<CountryBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildDetailCard(
            title: 'Capital :',
            value:
                countryBloc.countriesData![countryBloc.countryIndex].capital[0],
          ),
          const Divider(
            height: 50,
          ),
          buildDetailCard(
            title: 'Currency :',
            value: countryBloc
                .countriesData![countryBloc.countryIndex].currencies.entries
                .toList()[0]
                .value
                .name,
          ),
          const Divider(
            height: 50,
          ),
          InkWell(
            onTap: () {
              countryBloc.fromDetails = true;
              /////////////////////
              countryBloc.add(
                GetCountriesBiggerAreaEvent(
                  area:
                      countryBloc.countriesData![countryBloc.countryIndex].area,
                ),
              );
              /////////////////////
              AutoRouter.of(context).pushAndPopUntil(const CountryRoute(),
                  predicate: (route) => false);
            },
            child: buildDetailCard(
              title: 'Area :',
              value: countryBloc.countriesData![countryBloc.countryIndex].area
                  .toString(),
            ),
          ),
          const Divider(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget buildDetailCard({
    required String title,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ///////////////////
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
