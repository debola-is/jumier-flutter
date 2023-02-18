import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';
import 'package:jumier/constants.dart';

class CloseAccountScreen extends StatefulWidget {
  static const routeName = './user/account/close-account';
  const CloseAccountScreen({super.key});

  @override
  State<CloseAccountScreen> createState() => _CloseAccountScreenState();
}

class _CloseAccountScreenState extends State<CloseAccountScreen> {
  bool _confirmDelete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Close account',
        context: context,
      ),
      backgroundColor: backgroundGrey,
      body: ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.blueGrey.shade50,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Please read carefully',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'You are about to ask us to permanently close your jumier account and delete your data. Once your account is closed, all products and services that you access through your account will no longer be available. \n\nPlease take into consideration that your account will still be active while our customer relations teams are processing your request.\n\nThis may take up to 30 days from the date of submission of your request.\n\nIf you comply with this request, you will not be able to access the products and services associated with your closed account.  ',
                        style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please select the main reason that is leading you to close your jumier account (non-mandatory)',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: shadeOfOrange, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          child: Text('Select the reason'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: _confirmDelete,
                        onChanged: (value) {
                          if (mounted) {
                            setState(() {
                              _confirmDelete = !_confirmDelete;
                            });
                          }
                        },
                      ),
                      horizontalTitleGap: 0,
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text(
                        'Yes, I wish to definetly close my Jumier account and delete all my personal data',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25.0,
                      ),
                      child: CustomButton(
                        text: 'close my account',
                        onTap: () {
                          print('object');
                        },
                        enabled: _confirmDelete,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
