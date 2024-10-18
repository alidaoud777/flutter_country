import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widgets/country_detail_Page/country_details_widget.dart';

@RoutePage()
class CountryDetailPage extends StatelessWidget {
  const CountryDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Country Details'),
    );
  }

  Widget buildBody() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CountryDetailWidget(),
      ),
    );
  }
}
