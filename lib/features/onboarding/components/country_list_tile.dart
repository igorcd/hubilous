import 'package:aubilous/core/models/country_model.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  final CountryModel country;
  final void Function() onTap;
  const CountryListTile({required this.country, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s15,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppSizes.s04),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: AppSizes.s09,
                height: AppSizes.s09,
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Image.asset(
                  country.flag,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              const SizedBox(width: AppSizes.s03),
              Expanded(
                child: Text(
                  country.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.s05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
