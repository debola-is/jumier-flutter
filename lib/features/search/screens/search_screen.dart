import 'package:flutter/material.dart';
import 'package:jumier/global_variables.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final List<String> searchHistory = [];
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: shadeOfBlack,
            automaticallyImplyLeading: false,
            titleSpacing: 25,
            title: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                constraints: BoxConstraints.expand(height: 40),
                hintText: 'Search for Products, Brands...',
                prefixIcon: Icon(
                  Icons.search_outlined,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: backgroundGrey,
        body: searchHistory.isEmpty
            ? const Center(
                child: Text(
                  'Your search history will appear here',
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      searchHistory[index],
                    ),
                    trailing: const Icon(
                      Icons.history,
                      color: Colors.black26,
                      size: 14,
                    ),
                    tileColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    height: 0,
                  );
                },
                itemCount: searchHistory.length,
              ));
  }
}
