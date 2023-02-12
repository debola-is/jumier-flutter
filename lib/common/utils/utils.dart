import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

Widget freeDeliveryBadge() {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(2),
    ),
    child: const Text(
      'Free Delivery*',
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget orderStatusBadge(int stage) {
  // The stages of an order are 0 - pending, 1 - confirmed, 2 - shipped, 3 - delivered
  String textString = '';
  Color badgeColor = Colors.blue;
  switch (stage) {
    case 0:
      textString = "pending confirmation";
      badgeColor = Colors.grey;
      break;
    case 1:
      textString = "confirmed";
      break;
    case 2:
      textString = "shipped";
      break;
    case 3:
      textString = "delivered";
      badgeColor = Colors.green.shade300;
      break;
    case 4:
      textString = "cancelled-payment unsuccessful";
      badgeColor = Colors.grey;
      break;
    case 5:
      textString = "cancelled-refund initiated";
      badgeColor = Colors.grey;
      break;
    case 6:
      textString = "refunded";
      badgeColor = Colors.grey;
      break;
    default:
      textString = "error";
      badgeColor = Colors.grey;
  }
  return Container(
    padding: const EdgeInsets.all(3.5),
    decoration: BoxDecoration(
      color: badgeColor,
      borderRadius: BorderRadius.circular(2),
    ),
    child: Text(
      textString.toUpperCase(),
      style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5),
    ),
  );
}

Widget officialStoreBadge() {
  return Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      color: Colors.blue.shade800,
      borderRadius: BorderRadius.circular(2),
    ),
    child: const Text(
      'Official Store',
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget unitsLeft(int quantity) {
  assert(quantity >= 0);
  Color color = Colors.green;
  if (quantity <= 5) {
    color = Colors.red.shade900;
  } else if (quantity <= 15) {
    color = Colors.amber.shade600;
  }
  String text = 'units';
  if (quantity <= 1) {
    text = 'unit';
  }
  return Row(
    children: [
      if (quantity <= 5)
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.error_outline,
            color: color,
            size: 14,
          ),
        ),
      Text(
        '$quantity $text remaining',
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.65,
        ),
      ),
    ],
  );
}

Widget shippingCost(double cost) {
  return Text('+ shipping from  ₦$cost to LEKKI-AJAH (SANGOTEDO)');
}

MaterialButton customButton({
  required String title,
  double? width,
  double? height,
  double? textSize,
}) {
  return MaterialButton(
    onPressed: () {},
    color: shadeOfOrange,
    height: height ?? 25,
    minWidth: width ?? 120,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      title,
      style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontWeight: FontWeight.bold,
          fontSize: textSize ?? 12),
    ),
  );
}

Future<List<File>> selectImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

void showSnackBar(
  BuildContext context,
  String text,
  String type,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(15),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: type == "error"
          ? const Color.fromARGB(255, 249, 225, 227)
          : type == "success"
              ? const Color.fromARGB(255, 236, 249, 236)
              : const Color.fromARGB(255, 250, 248, 229),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: type == "error"
                    ? Colors.red.shade900
                    : type == "success"
                        ? Colors.green.shade900
                        : Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Icon(
            type == "error"
                ? Icons.error_outline_outlined
                : type == "success"
                    ? Icons.check_outlined
                    : Icons.info_outline,
            color: type == "error"
                ? const Color.fromARGB(255, 168, 0, 0)
                : type == "success"
                    ? const Color.fromARGB(255, 18, 95, 23)
                    : Colors.black,
            size: 18,
          ),
        ],
      ),
      action: SnackBarAction(
          label: 'Dismiss', textColor: Colors.black45, onPressed: () {}),
    ),
  );
}
