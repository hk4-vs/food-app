import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.background,
          Theme.of(context).colorScheme.onBackground.withOpacity(0.85),
          // const Color(0xffFBFAFF).withOpacity(0.85),
        ])),
        child: ListView(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                onTap: () {},
                autofocus: true,
                focusNode: _focusNode,
                decoration: InputDecoration(
                    suffixIcon: const Icon(CupertinoIcons.search),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onSurface,
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25))),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }
}
