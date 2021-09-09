import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuItemDrawer extends StatelessWidget {
  final String menuItemIcon;
  final String menuItemTitleText;
  final String menuItemSubtitleText;
  final Widget navigationWidget;
  final BuildContext context;

  MenuItemDrawer(
      this.menuItemIcon,
      this.menuItemTitleText,
      this.menuItemSubtitleText,
      this.navigationWidget,
      // ignore: type_init_formals
      BuildContext this.context);

  @override
  Widget build(BuildContext contex) {
    return ListTile(
        leading: Image.asset(
          menuItemIcon,
          height: 40.0,
          fit: BoxFit.fitHeight,
        ),
        title: Text(menuItemTitleText,
            style: Theme.of(context).textTheme.subtitle1),
        subtitle: Text(menuItemSubtitleText,
            style: Theme.of(contex).textTheme.subtitle2),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (context,animation,animationTime,child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                return FadeTransition(opacity: animation, child: child);
              },
              pageBuilder: (contex, animation, animationTime){
                return navigationWidget;
              }
            )
          );
        });
  }
}
