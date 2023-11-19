import 'package:aubilous/components/ab_search_input.dart';
import 'package:aubilous/core/models/country_model.dart';
import 'package:aubilous/features/onboarding/components/country_list_tile.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  final void Function() onSelect;
  const CountryPage({required this.onSelect, super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String filter = "";

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    List<CountryModel> countries = [
      CountryModel(flag: "lib/assets/flags/de.png", name: "Germany"),
      CountryModel(flag: "lib/assets/flags/br.png", name: "Brazil"),
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "What is your origin country?",
                  style: textTheme.displaySmall,
                ),
                const SizedBox(height: AppSizes.s06),
                AbSearchInput(
                  onChanged: (value) => setState(() => filter = value),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s07,
            vertical: AppSizes.s02,
          ),
          sliver: SliverList.separated(
            itemBuilder: (c, i) => CountryListTile(
              country: countries[i],
              onTap: widget.onSelect,
            ),
            separatorBuilder: (c, i) => const Divider(
              height: 1,
              thickness: 1,
              color: Colors.white54,
            ),
            itemCount: countries.length,
          ),
        ),
      ],
    );
  }
}
