
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 이순신 카드 만들 기
// 상단바 = 영웅 카드
// 바디 부분 
// 이순신 프로필 사진
// 구분선 그리기
// 이름
// 전적
// 승리한 전장
// 원 씌운 배사진
// 글씨들은 모두 왼쪽 정렬상태
// 사진은 모두 가운데 정렬
// 상단 위에 글씨는 흰색 3개 빨강 하나 나머지 검정
// 글씨와 아이콘을 같이 패딩하면 좋을거같다
// 글씨를 왼쪽으로 옮겨야 한다. 원래 디폴트가 왼쪽 아닌가? 
// 이미지 두개만 중앙이고 글씨는 모두 왼쪽 정렬이다
//




class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    
      backgroundColor: Colors.orangeAccent,
      
        appBar: AppBar(
            title: Text(
              
              '영웅 Card',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
      
              ),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            
          ),
          body:  
          Row(children: [
            Column(
               //mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
             children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(150, 20, 100, 100),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'images/men.jpeg'
                    ),
                    radius: 70,
                  ),
                ),
                Divider(
                    height: 10,
                    color: Colors.black,
                        thickness: 0.5,
                ),
              
              ],
            ),

          ],

            // child: Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: CircleAvatar(
            //         backgroundImage: AssetImage (
            //             'images/men.jpeg',
            //         ),
            //         radius: 70,
            //       ),
            //     ),
                  
            //       Divider(
            //                       height: 1,
            //                       color: Colors.black,
            //                       thickness: 0.3,
            //                     ),
                
            //       Row(
            //         children: [
            //           Text(
            //         '성웅',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold
            //         ),
            //         ),
            //         ],
            //         ),
            //         Row(children: [
            //               Text(
            //         '이순신 장군',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold
            //         ),
            //         ),
            //         ],
            //         ),
            //         Row(children: [
            //             Text(
            //               '승패',
            //               style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold
            //               ),
            //               )

            //         ],
            //         ),
            //           Row(children: [
            //             Text(
            //               '69승 21패 ',
            //               style: TextStyle(
            //                 color: Colors.red,
            //           fontWeight: FontWeight.bold
            //               ),
            //               )

            //         ],
            //         ),
            //       Row(
            //         children: [
            //           Column(children: [
            //             Icon(
            //             Icons.check_box
            //             ),
            //               Icon(
            //             Icons.check_box
            //             ),
            //               Icon(
            //             Icons.check_box
            //             ),
            //           Icon(
            //             Icons.check_box
            //             ),
            //       Icon(
            //             Icons.check_box
            //             )
            //           ],
            //           ),
            //       ],
                  
            //   ),
                
            //   ],
            //   )
               
            ),
            
            
    );
  }
}