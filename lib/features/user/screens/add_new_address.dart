import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/models/address.dart';

class AddNewAddressScreen extends StatefulWidget {
  static const routeName = './user/account/address-book/add-new-address';
  final Address? address;
  const AddNewAddressScreen({
    super.key,
    this.address,
  });

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _deliveryAddressController =
      TextEditingController();
  final TextEditingController _additionalInfoController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _phoneNumber2Controller = TextEditingController();

  bool isDefaultAddress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.address != null) {
      _firstNameController.text = widget.address!.firstName;
      _lastNameController.text = widget.address!.lastName;
      _deliveryAddressController.text = widget.address!.deliveryAddress;
      _phoneNumberController.text = widget.address!.phoneNumber;
      _phoneNumber2Controller.text = widget.address!.phoneNumber2!;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _deliveryAddressController.dispose();
    _additionalInfoController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: widget.address == null ? 'add new address' : 'edit address',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            color: Colors.blueGrey.shade50,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: const Text(
              'ADD NEW ADDRESS',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'First Name',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                TextField(
                  controller: _firstNameController,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintText: 'Enter your first name',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      suffix: const Text('*'),
                      suffixStyle: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Last Name',
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                TextField(
                  controller: _lastNameController,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintText: 'Enter your last name',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      suffix: const Text('*'),
                      suffixStyle: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _deliveryAddressController,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'Delivery Address',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    suffix: const Text('*'),
                    suffixStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _additionalInfoController,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintText: 'Additional Info',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                DropdownButtonFormField(
                  hint: Text(
                    'Region',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Region')),
                    )
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 50,
                ),
                DropdownButtonFormField(
                  hint: Text(
                    'City',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('City')),
                    )
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('+234')),
                          ),
                        ],
                        onChanged: null,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Mobile Phone Number',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          TextField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              suffix: Text('*'),
                              suffixStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: DropdownButtonFormField(
                        items: const [
                          DropdownMenuItem(
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('+234')),
                          ),
                        ],
                        onChanged: null,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _phoneNumber2Controller,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Additional Mobile Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              suffix: const Text('*'),
                              suffixStyle: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isDefaultAddress,
                      onChanged: (value) {
                        if (mounted) {
                          isDefaultAddress = !isDefaultAddress;
                          setState(() {});
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Default shipping address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: CustomButton(
        text: 'SAVE',
        onTap: () {},
        borderRadius: 0,
      ),
    );
  }
}
