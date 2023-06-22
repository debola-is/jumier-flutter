import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/product/filter/widgets/filter_appbar.dart';
import 'package:jumier/features/user/widgets/account_action.dart';

class SelectOptionScreen extends StatefulWidget {
  static const routeName = 'select-option-screen';
  final List<String> options;
  final String title;
  final int? selectedOption;
  const SelectOptionScreen({
    Key? key,
    required this.options,
    required this.title,
    required this.selectedOption,
  }) : super(key: key);

  @override
  State<SelectOptionScreen> createState() => _SelectOptionScreenState();
}

class _SelectOptionScreenState extends State<SelectOptionScreen> {
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    if (widget.selectedOption != null) {
      _selectedOption = widget.options[widget.selectedOption!];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: FilterAppBar(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              for (int i = 0; i < widget.options.length; i++)
                AccountAction(
                  onTap: () {},
                  leadingWidget: Radio(
                      toggleable: true,
                      value: widget.options[i],
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                        Navigator.pop(context, i);
                      }),
                  title: widget.options[i].toTitleCase(),
                  trailingWidget: const SizedBox(),
                ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundGrey,
    );
  }
}
