import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/views/home_page/my_diary/page/add_diary.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class ChooseEmotionPage extends StatelessWidget {
  String emotions = 'Happy';
  ChooseEmotionPage({Key? key, required this.emotions}) : super(key: key);
  String selectedReason = '';
  final reasonList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'I am Feeling...',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            SizedBox(
              height: 260,
              // color: Colors.orange,
              child: PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  if (index == 0) {
                    emotions = "Happy";
                  } else if (index == 1) {
                    emotions = "Sad";
                  }
                  print(emotions);
                },
                children: [
                  Lottie.asset('assets/icons/json/happy.json'),
                  Lottie.asset('assets/icons/json/sad.json'),
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        selectedReason = "School";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('School'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = "Work";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Work'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = 'Money';
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Money'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = "Friends";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Friends'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        selectedReason = "School";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('School'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = "Work";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Work'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = 'Money';
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Money'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedReason = "Friends";
                        reasonList.add(selectedReason);
                        print(selectedReason);
                      },
                      child: const Chip(
                        label: Text('Friends'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  primary: kPrimaryFrmColor,
                ),
                // TODO: Get to the Add Page Diary.
                onPressed: () {
                  print(reasonList);
                  Get.to(
                    () => AddDiaryPage(
                      reason: reasonList.toString(),
                      emotion: emotions,
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}