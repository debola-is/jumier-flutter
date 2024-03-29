import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/utils/restricted_access_page.dart';
import 'package:jumier/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountAction extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? iconData;
  final String? trailingSelected;
  final String title;
  final bool? enabled;
  final String? trailingText;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? trailingWidget;
  final TextStyle? titleTextStyle;
  final bool restictedToSignedInUser;
  const AccountAction({
    Key? key,
    required this.onTap,
    required this.title,
    this.enabled = true,
    this.iconData,
    this.trailingText,
    this.trailingWidget,
    this.trailingSelected,
    this.titleTextStyle,
    this.leadingWidget,
    this.titleWidget,
    this.restictedToSignedInUser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: Colors.white,
      onTap: restictedToSignedInUser && user.token.isEmpty
          ? () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => RestrictedAccessPage(title: title),
                ),
              );
            }
          : onTap,
      enabled: enabled!,
      contentPadding: EdgeInsets.symmetric(
        horizontal: leadingWidget == null ? 15 : 0,
      ),
      horizontalTitleGap: 0,
      leading: leadingWidget ??
          (iconData == null
              ? null
              : Icon(
                  iconData,
                  color:
                      enabled! ? Colors.black.withOpacity(0.7) : Colors.black26,
                  size: 22,
                )),
      title: titleWidget ??
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: titleTextStyle ??
                    const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
              ),
              if (trailingSelected != null)
                Text(
                  trailingSelected!,
                  style: TextStyle(
                    fontSize: 13,
                    color: enabled! ? Colors.black54 : Colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
      trailing: trailingWidget ??
          (trailingText == null
              ? Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: enabled! ? Colors.black54 : Colors.black26,
                )
              : Text(
                  trailingText!,
                  style: TextStyle(
                    fontSize: 13,
                    color: enabled! ? Colors.black54 : Colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                )),
    );
  }
}
