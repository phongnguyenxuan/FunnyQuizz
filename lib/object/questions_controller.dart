import 'package:get/get.dart';
import 'package:something/object/questions.dart';
import 'package:something/object/questions_database.dart';

class QuestionsController extends GetxController {
  var listQuestions = <Questions>[].obs;
  @override
  void onInit() {
    //delete old records
    deleteDB();
    //insert records
    insertQuestions();
    //get records
    getQuestions();
    super.onInit();
  }

  void shuffle() {
    listQuestions.shuffle();
  }

  static deleteDB() async {
    await QuestionDatabase.delete();
  }

  Future<void> insertQuestions() async {
    await QuestionDatabase.insertDB();
  }

  void getQuestions() async {
    List<Map<String, dynamic>> questions = await QuestionDatabase.query();
    listQuestions
        .assignAll(questions.map((data) => Questions.fromJson(data)).toList());
    //dao vi tri cau hoi
    listQuestions.shuffle();
  }
}
