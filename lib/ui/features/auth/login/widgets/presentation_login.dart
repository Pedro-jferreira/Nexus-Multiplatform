import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/responsive_ultils.dart';

class PresentationLogin extends StatelessWidget {
  final String svgString;
  final String title;
  const PresentationLogin({super.key, required this.svgString, required this.title});

  @override
  Widget build(BuildContext context) {
    final device = Responsive.getDeviceType(context);
    return device== DeviceScreenType.mobile ?buildMobile(context):
    Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          Expanded(
            child: Padding(
              padding:  const EdgeInsets.all(21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/logos/Logo_sigla_branco.png', height: 38),
                  Expanded(child: Center(child: SvgPicture.string(svgString,width: 350,))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMobile(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50.0,),
    child: Column(
      spacing: 57,
      children: [
        Image.asset('assets/logos/Logo_sigla_branco.png', height: 38),
        SvgPicture.string(svgString),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
  }
}
