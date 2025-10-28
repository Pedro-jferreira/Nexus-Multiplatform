import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/responsive_utils.dart';
import '../../../../core/theme/theme_mobile.dart';

class PresentationLogin extends StatelessWidget {
  final String? svgString;
  final String? imgPath;
  final String title;
  const PresentationLogin({super.key,  this.svgString, required this.title, this.imgPath});

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
                  Image.asset(imgPath??'assets/logos/Logo_sigla_branco.png', height: 38),
                  Expanded(child: Center(child: SvgPicture.string(svgString!,width: 350,))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

   buildMobile(BuildContext context) {
    return Column(
      spacing: 57,
      children: [
        Image.asset('assets/logos/Logo_sigla_horizontal.png', height: 38),
        Image.asset(imgPath??'assets/images/password.png', height: 187,),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: text,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
