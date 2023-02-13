import 'package:flutter/material.dart';
import 'package:jumier/common/utils/utils.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/constants.dart';

class OrderTrackingScreen extends StatelessWidget {
  static const routeName = './account/orders/order/track';
  final int status;
  const OrderTrackingScreen({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Item Status',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Theme(
                data: ThemeData(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.blueAccent,
                        secondary: Colors.blueAccent,
                        background: Colors.blue)),
                child: Stepper(
                  currentStep: 3,
                  steps: [
                    Step(
                      title: trackingStatusBadge(orderStatus: 2, step: 0),
                      state: StepState.complete,
                      subtitle: Text(
                        DateTime.now().toString().split(' ')[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const SizedBox(),
                    ),
                    Step(
                      title: trackingStatusBadge(orderStatus: 2, step: 1),
                      subtitle: Text(
                        DateTime.now().toString().split(' ')[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const SizedBox(),
                    ),
                    Step(
                      title: trackingStatusBadge(orderStatus: 2, step: 2),
                      subtitle: Text(
                        DateTime.now().toString().split(' ')[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const SizedBox(),
                    ),
                    Step(
                      title: trackingStatusBadge(orderStatus: 2, step: 3),
                      subtitle: Text(
                        DateTime.now().toString().split(' ')[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const SizedBox(),
                    ),
                    Step(
                      title: trackingStatusBadge(orderStatus: 2, step: 4),
                      subtitle: Text(
                        DateTime.now().toString().split(' ')[0],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'SEE TRACKING DETAILS',
                style: TextStyle(color: shadeOfOrange),
              ),
            )
          ],
        ),
      ),
    );
  }
}
