import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';

enum ErrorType {
  error,
  success,
  warning,
}

enum Layout {
  grid,
  list,
}

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

Widget orderStatusBadge({required int stage, Color? color}) {
  // The stages of an order are 0 - pending, 1 - confirmed, 2 - shipped, 3 - delivered
  String textString = '';
  Color badgeColor = color ?? Colors.blue;
  switch (stage) {
    case 0:
      textString = "pending confirmation";
      badgeColor = color ?? Colors.grey;
      break;
    case 1:
      textString = "confirmed";
      break;
    case 2:
      textString = "shipped";
      break;
    case 3:
      textString = "delivered";
      badgeColor = color ?? Colors.green.shade300;
      break;
    case 4:
      textString = "cancelled-payment unsuccessful";
      badgeColor = color ?? Colors.grey;
      break;
    case 5:
      textString = "cancelled-refund initiated";
      badgeColor = color ?? Colors.grey;
      break;
    case 6:
      textString = "refunded";
      badgeColor = color ?? Colors.grey;
      break;
    default:
      textString = "error";
      badgeColor = color ?? Colors.grey;
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

Widget trackingStatusBadge({required int orderStatus, required int step}) {
  String textString = '';
  Color badgeColor;
  Color updateBadgeColor(int index) {
    if (orderStatus > index) {
      return Colors.blue.shade400;
    } else if (orderStatus == index) {
      return Colors.blue.shade900;
    } else {
      return Colors.grey;
    }
  }

  switch (step) {
    case 0:
      textString = "order placed";
      badgeColor = updateBadgeColor(0);
      break;
    case 1:
      textString = "pending confirmation";
      badgeColor = updateBadgeColor(1);
      break;
    case 2:
      textString = "shipped";
      badgeColor = updateBadgeColor(2);
      break;
    case 3:
      textString = "out for delivery";
      badgeColor = updateBadgeColor(3);
      break;
    case 4:
      textString = "delivered";
      badgeColor = updateBadgeColor(4);
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

Future<List<File>> selectImages({bool? allowMultiple}) async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: allowMultiple ?? true,
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
  ErrorType type,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(15),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: type == ErrorType.error
          ? const Color.fromARGB(255, 249, 225, 227)
          : type == ErrorType.success
              ? const Color.fromARGB(255, 236, 249, 236)
              : const Color.fromARGB(255, 250, 248, 229),
      behavior: SnackBarBehavior.fixed,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: type == ErrorType.error
                    ? Colors.red.shade900
                    : type == ErrorType.success
                        ? Colors.green.shade900
                        : Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Icon(
            type == ErrorType.error
                ? Icons.error_outline_outlined
                : type == ErrorType.success
                    ? Icons.check_outlined
                    : Icons.info_outline,
            color: type == ErrorType.error
                ? const Color.fromARGB(255, 168, 0, 0)
                : type == ErrorType.success
                    ? const Color.fromARGB(255, 18, 95, 23)
                    : Colors.black,
            size: 18,
          ),
        ],
      ),
    ),
  );
}

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();

      break;
    case 400:
      showSnackBar(
        context,
        '${jsonDecode(response.body)['error']}',
        ErrorType.error,
      );
      break;
    case 500:
      showSnackBar(
        context,
        '${jsonDecode(response.body)['error']}',
        ErrorType.error,
      );
      break;
    default:
      showSnackBar(
        context,
        'Error occured: ${response.body}',
        ErrorType.warning,
      );
      break;
  }
}
