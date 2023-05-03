import 'package:flutter/material.dart';
import 'SpeedDial.dart';

class UnderView extends StatefulWidget {
  const UnderView({Key? key}) : super(key: key);

  @override
  State<UnderView> createState() => _UnderViewState();
}

class _UnderViewState extends State<UnderView> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.125,
      maxChildSize: 1,
      minChildSize: 0.125,
      builder: (BuildContext context, ScrollController scrollController) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 60,
                        height: 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        focusNode: focusNode,
                        controller: _filter,
                        onChanged: (checkText) {},
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          hintText: '검색 ',
                          hintStyle:
                          TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.cancel),
                            color: Colors.black45,
                            onPressed: () {
                              _searchText = "";
                              _filter.clear();
                            },
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black45),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xffd9e2f4),
                        ),
                      ),
                    ),
                    SpeedDials(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
