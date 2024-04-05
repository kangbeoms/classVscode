import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면을 총괄하는 위젯 Scaffold 로 리턴값을 보낸다
    return Scaffold(
      //전체 화면의 백그라운드 색을 설정
      backgroundColor: Colors.deepOrange,
      // 상단 바 생성(없어도됨)
      appBar: AppBar(
        // 상단 바 내용 채우기
        // 타이틀 설정
          title: const Text('Image Ex01'),
          // 상단 바 배경색 설정
          backgroundColor: Colors.green,
          // 상단 바 타이틀 컬러 설정
          foregroundColor: Colors.white,
          // 타이틀 위치를 왼쪽으로 
          centerTitle: false,
          //상단바 기능 종료
      ),
      // 바디 채우기
      // 기본 센터로 시작
      body: const Center(
        // 단일 자식으로 컬럼을 설정
        child: Column(
          // 화면 중앙으로 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          // 여러가지 칸을 사용하기 위해 자식들( 배열 ) 설정
          children: [
            // 이미지에 원을 씌우기 위해 사용
                CircleAvatar(
                  // 원에 백그라운드를 채운다 what? Asset에 저장하둔 이미지
                  backgroundImage:AssetImage (
                    // 이미지 경로
                    'images/ani1.jpg'
                  ),
                  // 씌우는 원의 반지름값
                  radius: 50,
                ),
                // 가로로 정렬하기 위해 Row 사용
                Row(
                  // 가운데 정렬을 위한 한 줄
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 1개 이상을 사용하기 위한 배열 
                  children: [
                   // 간격을 맞추기 위한 패딩
                Padding(
                  // 패딩을 전체적으로 알아서 지정하게 둠
                  padding: EdgeInsets.all(8.0),
                  // 원을 씌우기 위한 원아바타
                  child: CircleAvatar(
                    // 원에 백그라운드를 채운다 what? Asset에 저장하둔 이미지
                    backgroundImage:AssetImage (
                      // 이미지 경로
                      'images/ani2.webp',
                    ),
                     // 씌우는 원의 반지름값
                    radius: 50,
                  ),
                ),
                 // 간격을 맞추기 위한 패딩
                Padding(
                  // 패딩을 전체적으로 알아서 지정하게 둠
                  padding: EdgeInsets.all(8.0),  
                  // 원을 씌우기 위한 원아바타
                  child: CircleAvatar(    
                    // 원에 백그라운드를 채운다 what? Asset에 저장하둔 이미지
                    backgroundImage:AssetImage (
                       // 이미지 경로
                      'images/ani3.jpeg',
                    ),
                    // 씌우는 원의 반지름값
                    radius: 50,
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}