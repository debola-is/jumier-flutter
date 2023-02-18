import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/features/user/screens/add_new_address.dart';
import 'package:jumier/features/user/widgets/single_address.dart';

class AddressBookScreen extends StatelessWidget {
  static const routeName = './user/account/address-book';
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'My Addresses',
        context: context,
        showSearch: true,
        showCart: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: const [SingleAddress()],
      )),
      bottomNavigationBar: CustomButton(
        text: 'add new address',
        onTap: () {
          Navigator.pushNamed(context, AddNewAddressScreen.routeName);
        },
        width: double.infinity,
        borderRadius: 0,
      ),
    );
  }
}
