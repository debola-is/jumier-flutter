import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jumier/constants.dart';

const Map<String, List<String>> _collections = {
  'phone deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/freelinks/plain-bg/phone-deals_260x144.png'
  ],
  'fashion deals': [
    'https://ng.jumia.is/cms/0-1-christmas-sale/2021/homepage-freelinks/detty-december_260x14.png'
  ],
  'computing deals': [
    'https://ng.jumia.is/cms/0-1-weekly-cps/0-2022/w32/Back-to-school/University/1-laptops_260x144.png'
  ],
  'gaming deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/freelinks/plain-bg/gaming_260x144.png'
  ],
  'kids & baby deals': [
    'https://ng.jumia.is/cms/0-6-anniversary/2022/hp-freelinks/kids-corner_260x144.png'
  ],
  'accessory deals': [
    'https://ng.jumia.is/cms/0-1-weekly-cps/2021/w51-52/hp-freelinks/accessories-warehouse_260x144v2.png'
  ],
  'supermarket deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/freelinks/plain-bg/supermarket_260x144.png'
  ],
  'beauty deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/userneeds/un/health-beauty-deals_260x144.png'
  ],
  'half price store': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/cyber-monday/drones_260x144v2.png'
  ],
  'home deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/userneeds/un/home-appliances_260x144v2.png'
  ],
  'electronic deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/userneeds/un/electronics_260x144v2.png'
  ],
  'fitness deals': [
    'https://ng.jumia.is/cms/0-0-black-friday/2021/freelinks/plain-bg/staying-fit_260x144.png'
  ],
};

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.pink.withOpacity(0.07),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: const Text(
            'Shop From Our Collections!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(5),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              childAspectRatio: 1.1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            children: _collections.keys
                .toList()
                .map(
                  (e) => Builder(
                    builder: (context) => Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(imageUrl: _collections[e]![0]),
                          Text(
                            e.toTitleCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
