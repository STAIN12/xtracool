import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';

class OptionListTile extends StatelessWidget {
  const OptionListTile(
      {Key? key,
      required this.textLabel,
      required this.iconLabel,
      required this.onTapAction,
      this.trailingWidget})
      : super(key: key);

  final String? textLabel;
  final IconData iconLabel;
  final VoidCallback onTapAction;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        onTap: onTapAction,
        leading: Icon(
          iconLabel,
          size: kIconSize15,
          color: kPrimaryColor,
        ),
        title: Text(
          textLabel!,
          style: kTextStyleSize8,
        ),
        trailing: trailingWidget,
      ),
    );
  }
}
