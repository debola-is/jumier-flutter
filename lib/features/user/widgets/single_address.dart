import 'package:flutter/material.dart';

import 'package:jumier/global_variables.dart';
import 'package:jumier/features/user/screens/add_new_address.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.all(25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'test person'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'No 999, fake street'.toTitleCase(),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                'fake city, fake state'.toTitleCase(),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '+2349999999999',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddNewAddressScreen.routeName);
            },
            icon: Icon(
              Icons.edit_outlined,
              color: shadeOfOrange,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
