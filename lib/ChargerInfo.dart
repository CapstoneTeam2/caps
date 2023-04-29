import 'dart:io';

import 'package:flutter/material.dart';

class ChargerInfo extends StatefulWidget {
  const ChargerInfo({Key? key}) : super(key: key);

  @override
  State<ChargerInfo> createState() => _ChargerInfo();
}

class _ChargerInfo extends State<ChargerInfo> {
  double _rating = 0.0;
  String _reviewText = '';
  File? _imageFile;

  void _selectImage() async {
    // TODO: 이미지 선택 로직 구현
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0edee),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text('내 충전소', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // 수정 아이콘 클릭 시 수행할 동작
            },
            icon: Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 5,),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,15,0,5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('충전소 정보',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('충전소 이름',style: TextStyle(
                          fontSize: 16,),
                      ),
                      SizedBox(width: 53,),
                      Text('우리의 충전기',textAlign: TextAlign.start)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('주소',style: TextStyle(
                          fontSize: 16),
                      ),
                      SizedBox(width: 100,),
                      Text('신대방동 344-248',textAlign: TextAlign.start)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('충전포트',style: TextStyle(
                          fontSize: 16),
                      ),
                      SizedBox(width: 70,),
                      Text('AC 충전포트',textAlign: TextAlign.start)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('출력',style: TextStyle(
                          fontSize: 16),
                      ),
                      SizedBox(width: 100,),
                      Text('7kW',textAlign: TextAlign.start)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          //=================
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,15, 0, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('사업자 정보',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('대표자명',style: TextStyle(
                        fontSize: 16,),
                      ),
                      SizedBox(width: 70,),
                      Text('이나연',textAlign: TextAlign.start)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('상호명',style: TextStyle(
                          fontSize: 16),
                      ),
                      SizedBox(width: 83,),
                      Text('우리의 충전기',textAlign: TextAlign.start)
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('사업자등록번호',style: TextStyle(
                          fontSize: 16),
                      ),
                      SizedBox(width: 25,),
                      Text('838-14-02345',textAlign: TextAlign.start)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,15, 0, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('리뷰',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                    ],
                  ),
                  SizedBox(height: 8,),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: _selectImage,
                          child: Container(
                            height: 200,
                            color: Colors.grey,
                            child: _imageFile == null
                                ? Icon(Icons.add_a_photo,size: 60.0, color: Colors.white)
                                : Image.file(_imageFile!, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Center(
                          child: Text(
                            _rating == 0.0 ? '평점을 선택해주세요.' : '평점: $_rating',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text('리뷰 작성'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class RatingBar extends StatelessWidget {
  final double? initialRating;
  final double starSize;
  final void Function(double) onRatingSelected;

  RatingBar({
    this.initialRating,
    this.starSize = 40.0,
    required this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          onTap: () => onRatingSelected(index + 1.0),
          child: Icon(
            index + 1.0 <= (initialRating ?? 0.0) ? Icons.star : Icons
                .star_border,
            size: starSize,
          ),
        );
      }),
    );
  }
}
