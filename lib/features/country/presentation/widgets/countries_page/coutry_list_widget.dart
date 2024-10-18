import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_app/core/routes/routes.gr.dart';
import 'package:flutter_country_app/features/country/domain/entities/country_entity.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/country/country_bloc.dart';

class CountryListWidget extends StatelessWidget {
  final List<CountryEntity> countries;

  const CountryListWidget({
    super.key,
    required this.countries,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: SvgPicture.network(
              countries[index].flag.toString(),
              placeholderBuilder: (BuildContext context) => const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(countries[index].name.toString()),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            BlocProvider.of<CountryBloc>(context).countryIndex = index;
            ////////////////////////////////////////////////////////////
            AutoRouter.of(context).push(const CountryDetailRoute());
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: countries.length,
    );
  }
}
