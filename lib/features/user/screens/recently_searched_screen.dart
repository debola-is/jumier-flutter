import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_scroll_behaviour.dart';

class RecentlySearchedScreen extends StatefulWidget {
  static const routeName = './user/account/recently-searched';

  const RecentlySearchedScreen({super.key});

  @override
  State<RecentlySearchedScreen> createState() => _RecentlySearchedScreenState();
}

class _RecentlySearchedScreenState extends State<RecentlySearchedScreen> {
  // Dummy values for recents searchs. These list of strings will be saved in the user's database and optionally on the device storage to prevent database requests all the time.
  //TODO: Populate recents list from user model

  List<String> recents = [
    'soundcore r100',
    'zealot bluetooth speaker',
    'poco f3',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Recently Searched',
        context: context,
        showCart: true,
        showSearch: true,
      ),
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: SingleChildScrollView(
            child: Column(children: [
              for (int i = 0; i < recents.length; i++)
                InkWell(
                  onTap: () {
                    // TODO: On clicking of any recent search, it should navigate to the search results for that search.
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 7.5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black54,
                          size: 20,
                        ),
                        const SizedBox(width: 15.0),
                        Text(
                          recents[i],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                )
            ]),
          )),
      persistentFooterButtons: [
        InkWell(
          onTap: () {
            recents = [];
            if (mounted) {
              setState(() {});
            }
          },
          child: InkWell(
            onTap: () {
              //TODO: Implement functionality to clear all of the user's recent searchs.
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                'CLEAR RECENT SEARCHES',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
