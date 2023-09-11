import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_app/core/theme/app_colors.dart';

class SnapButton extends StatelessWidget {
  const SnapButton({
    super.key,
    required this.onTap,
    this.svg,
    this.icon,
  });

  final void Function()? onTap;
  final String? svg;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Ink(
          height: 64,
          width: 64,
          child: CircleAvatar(
            backgroundColor: ThemeColors.light.background.withOpacity(.60),
            child: svg != null
                ? SvgPicture.asset(
                    svg ?? '',
                  )
                : Icon(
                    icon,
                    size: 25,
                    color: ThemeColors.light.black,
                  ),
          ),
        ),
      );
}
