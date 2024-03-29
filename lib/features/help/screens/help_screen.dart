import 'package:flutter/material.dart';
import 'package:jumier/common/widgets/appbars.dart';
import 'package:jumier/common/widgets/custom_button.dart';
import 'package:jumier/global_variables.dart';
import 'package:jumier/features/user/widgets/account_action.dart';
import 'package:jumier/features/user/widgets/info_tab.dart';
import 'package:jumier/services/file_io.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final FileIoServices _fileIoServices = FileIoServices();
  int? _cacheSize;
  bool pushNotif = false;

  Future<void> _getCacheSize() async {
    _cacheSize = (await _fileIoServices.getCacheSize()) ~/ (1024 * 1024);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _clearCache() async {
    await _fileIoServices.deleteCacheDir();
    _getCacheSize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getCacheSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: 'Help',
        context: context,
        showSearch: true,
        showCart: true,
      ),
      backgroundColor: backgroundGrey,
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: CustomButton(
                  text: 'START LIVE CHAT',
                  onTap: () {},
                ),
              ),
              const Positioned(
                top: 37.5,
                left: 45,
                child: Icon(
                  Icons.chat_rounded,
                  size: 26,
                ),
              ),
            ],
          ),
          const InfoTab(
            description: 'ABOUT JUMIER',
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                AccountAction(
                  onTap: () {},
                  title: 'Jumier Services',
                ),
                AccountAction(
                  onTap: () {},
                  title: 'FAQ',
                ),
              ],
            ),
          ),
          const InfoTab(
            description: 'SETTINGS',
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                AccountAction(
                  onTap: () {},
                  title: 'Push Notifications',
                  trailingWidget: Switch(
                    value: pushNotif,
                    onChanged: (state) {
                      setState(() {
                        pushNotif = state;
                      });
                    },
                  ),
                ),
                AccountAction(
                  onTap: () {},
                  title: 'Country',
                  trailingText: 'NIGERIA',
                ),
                AccountAction(
                  onTap: () {},
                  title: 'Language',
                  trailingText: 'ENGLISH',
                  enabled: false,
                ),
              ],
            ),
          ),
          const InfoTab(description: 'APP INFO'),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                AccountAction(
                  onTap: () {},
                  title: 'App Version 1.0.0',
                  enabled: false,
                ),
                AccountAction(
                  onTap: _clearCache,
                  title: _cacheSize == null
                      ? 'Cache Used: 0 B'
                      : 'Cache Used: $_cacheSize MB',
                  enabled: _cacheSize == null || _cacheSize == 0 ? false : true,
                  trailingText: 'CLEAR',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
