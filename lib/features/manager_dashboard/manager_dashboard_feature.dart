import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/core/models/consultant_model.dart';
import 'package:aubilous/features/manager_dashboard/components/consultant_grid_tile.dart';
import 'package:aubilous/features/manager_dashboard/components/manager_dashboard_drawer.dart';
import 'package:aubilous/features/manager_dashboard/components/manager_dashboard_header.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ManagerDashboardFeature extends StatelessWidget {
  const ManagerDashboardFeature({super.key});

  @override
  Widget build(BuildContext context) {
    List<ConsultantModel> consultants = [
      ConsultantModel(
          name: "Martim Melo",
          picture: "lib/assets/images/avatars/1.png",
          city: "São Paulo",
          country: "br",
          manager: "Gabriel Lima",
          client: "TLS Contact",
          stepsDone: 2,
          totalSteps: 10,
          email: "martim.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Isabelle Gomes",
          picture: "lib/assets/images/avatars/2.png",
          city: "Curitiba",
          country: "br",
          manager: "LauGabriel Lima",
          client: "SIEMENS",
          stepsDone: 4,
          totalSteps: 10,
          email: "isabelle.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Claudia Kunze",
          picture: "lib/assets/images/avatars/3.png",
          city: "Amsinckstrasse",
          country: "de",
          manager: "Gabriel Lima",
          client: "Vodafone",
          stepsDone: 10,
          totalSteps: 10,
          email: "claudia.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Rodrigo Souza",
          picture: "lib/assets/images/avatars/4.png",
          city: "Guarapuava",
          country: "br",
          manager: "Gabriel Lima",
          client: "Vodafone",
          stepsDone: 4,
          totalSteps: 10,
          email: "rodrigo.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Rafael Lima",
          picture: "lib/assets/images/avatars/5.png",
          city: "Guarapuava",
          country: "br",
          manager: "DGabriel Lima",
          client: "TAP",
          stepsDone: 10,
          totalSteps: 10,
          email: "rafael.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Emilly Araujo",
          picture: "lib/assets/images/avatars/6.png",
          city: "Guarapuava",
          country: "br",
          manager: "Gabriel Lima",
          client: "TLS Contact",
          stepsDone: 5,
          totalSteps: 10,
          email: "emilly.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Karin Diederich",
          picture: "lib/assets/images/avatars/7.png",
          city: "Stresemannstr",
          country: "de",
          manager: "DGabriel Lima",
          client: "NOS",
          stepsDone: 3,
          totalSteps: 10,
          email: "karin.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Kauan Souza",
          picture: "lib/assets/images/avatars/8.png",
          city: "Guarapuava",
          country: "br",
          manager: "Gabriel Lima",
          client: "Blip",
          stepsDone: 8,
          totalSteps: 10,
          email: "kauan.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Jeffery Montano",
          picture: "lib/assets/images/avatars/9.png",
          city: "Goslar",
          country: "de",
          manager: "Gabriel Lima",
          client: "TLS Contact",
          stepsDone: 9,
          totalSteps: 10,
          email: "jeffery.melo@aubay.pt",
          phone: "999 123 456"),
      ConsultantModel(
          name: "Angelika Loewe",
          picture: "lib/assets/images/avatars/10.png",
          city: "Goslar",
          country: "de",
          manager: "Gabriel Lima",
          client: "TLS Contact",
          stepsDone: 1,
          totalSteps: 10,
          email: "angelika.melo@aubay.pt",
          phone: "999 123 456"),
    ];

    return Scaffold(
      drawer: const ManagerDashboardDrawer(),
      body: AbGradientContainer(
        theme: GradientTheme.blue,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: ManagerDashboardHeader(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: AppSizes.s07,
                right: AppSizes.s07,
                bottom: AppSizes.s07 + MediaQuery.of(context).padding.bottom,
              ),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childCount: consultants.length,
                itemBuilder: (c, i) => AspectRatio(
                  aspectRatio: i == 0 ? .8 : .7,
                  child: ConsultantGridTile(
                    consultant: consultants[i],
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRouter.consultantDetailFeature,
                      arguments: consultants[i],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
