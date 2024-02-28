import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';

class CustomBadge extends StatelessWidget {
  final Widget child;
  final Widget badgeContent;
  const CustomBadge({
    super.key,
    required this.child,
    required this.badgeContent,
  });

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeColor: CupertinoColors.systemRed,
      position: badges.BadgePosition.topEnd(top: -5, end: -5),
      badgeContent: badgeContent,
      child: child,
    );
  }
}
