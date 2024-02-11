import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
   const MainScreen({super.key});

  @override
  State<MainScreen> createState()=> _MainScreen();
}
class _MainScreen extends State<MainScreen>{
  //자기소개 값을 입력받는 컨트롤러
  TextEditingController introduceController = TextEditingController();

  //자기소개 수정 모드
  bool isEditMode=false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIntroduceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '발전하는 개발자 정은하입니다.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
         
              crossAxisAlignment: CrossAxisAlignment.start,
         
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  width: double.infinity,
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/user.png',
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                // 이름 섹션
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            '이름',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('정은하'),
                    ],
                  ),
                ),
                   
                // 나이 섹션
                      Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            '나이',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('25'),
                    ],
                  ),
                ),
                //취미 섹션
                      Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            '취미',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('영화 보기'),
                    ],
                  ),
                ),
                      //직업 섹션
                      Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            '직업',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('대학생'),
                    ],
                  ),
                ),
                      //학력 섹션
                      Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            '학력',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('경기대학교 컴퓨터공학과'),
                    ],
                  ),
                ),
                      //MBTI 섹션
                      Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 200,
                          child: Text(
                            'MBTI',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Text('ESTJ'),
                    ],
                  ),
                ),
                //자기소개서 섹션
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                      margin: EdgeInsets.only(left: 16,top: 16),
                       child: Text(
                                  '자기소개서',
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                     ),
                     GestureDetector(child:  
                     Container(
                  margin: EdgeInsets.only(right: 16, top: 16),
                    child: Icon(
                  Icons.mode_edit,
                  color: isEditMode == true ? Colors.blueAccent : Colors.black,
                  size: 24,
                ),
                ),onTap: () async {
                 FocusScope.of(context).unfocus();
                  if(isEditMode == false){
                    setState(() {
                      //update widget
                      isEditMode=true;
                    });
                  } 
                  else{
                   if(introduceController.text.isEmpty){
                    //snackbar 메세지로 사용자에게 안내하기
                    var snackBar=SnackBar(content: Text('자기소개 입력 값이 비어있습니다.'),
                    duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //저장 기능을 수행하지 않고 종료
                      return;
                    }

                    //자기 소개서 저장 로직 구현
                    var sharedPref=await SharedPreferences.getInstance();
                    sharedPref.setString('introduce', introduceController.text);
                    setState(() {
                      isEditMode=false;
                    });
                  }
                },)
               
                   ],
                 ),
                 Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: TextField(
                    maxLines: 5,
                    controller: introduceController ,
                    enabled: isEditMode,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xffd9d9d9))
                    )
                  ),),
                 ),
              ],
        ),
      ),
    );
  }

Future<void> getIntroduceData() async {
  //기존에 저장되어 있는 자기소개서 데이터가 있으면 로드해오기
  var sharedPref= await SharedPreferences.getInstance();
  String introduceMsg=sharedPref.getString('introduce').toString();
  introduceController.text = introduceMsg ?? "";
}
}