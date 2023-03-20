import 'package:flutter/cupertino.dart';
import 'package:something/object/player.dart';
import 'package:something/object/questions.dart';
import 'package:sqflite/sqflite.dart';

class QuestionDatabase {
  static Database? _database;
  static Future<void> initDB() async {
    if (_database != null) {
      return;
    }
    try {
      // ignore: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings
      String _path = await getDatabasesPath() + "questions.db";
      _database = await openDatabase(
        _path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE questable("
              "id INTEGER PRIMARY KEY, "
              "question TEXT, "
              "answer1 TEXT, "
              "answer2 TEXT, "
              "answer3 TEXT, "
              "answer4 TEXT, "
              "result TEXT, "
              "correct TEXT);");
          await db.execute("CREATE TABLE playertable("
              "id INTEGER PRIMARY KEY, "
              "name TEXT, "
              "score INTEGER);");
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> insertDB() async {
    // ignore: unnecessary_new
    Questions question1 = new Questions(
        question: "Đố bạn chuột nào đi bằng 2 chân?",
        answer1: "Chuột nhắt",
        answer2: " Chuột đồng",
        answer3: "Chuột bạch",
        answer4: "Chuột Mickey",
        result: "Chuột Mickey",
        correct: "Chuột Mickey đi bằng 2 chân nha !");
    _database!.insert("questable", question1.toJson());
    // ignore: unnecessary_new
    Questions question2 = new Questions(
        question: "Sở thú bị cháy ,đố bạn con gì chạy ra đầu tiên?",
        answer1: "Con voi",
        answer2: "Con sư tử",
        answer3: "Con khỉ",
        answer4: "Con người",
        result: "Con người",
        correct: "Các con vật khác đều ở trong lồng...");
    _database!.insert("questable", question2.toJson());
    // ignore: unnecessary_new
    Questions question3 = new Questions(
        question:
            "Mỗi năm có 7 tháng 31 ngày. Đố bạn có bao nhiêu tháng có 28 ngày?",
        answer1: "9 tháng",
        answer2: "10 tháng",
        answer3: "11 tháng",
        answer4: "12 tháng",
        result: "12 tháng",
        correct: "Tháng nào cũng có ngày 28 mà");
    _database!.insert("questable", question3.toJson());
    // ignore: unnecessary_new
    Questions question4 = new Questions(
        question:
            "Nhà Nam có 4 anh chị em, 3 người lớn tên là Xuân, Hạ, Thu. Đố bạn người em út tên gì?",
        answer1: "Đông",
        answer2: "Tây",
        answer3: "Bắc",
        answer4: "Nam",
        result: "Nam",
        correct: '"Nam ! lấy tao khẩu AK"');
    _database!.insert("questable", question4.toJson());
    // ignore: unnecessary_new
    Questions question5 = new Questions(
        question:
            "Đố bạn khi Beckham thực hiện quả đá phạt đền, anh ta sẽ sút vào đâu?",
        answer1: "Vào gôn",
        answer2: "Vào hàng rào",
        answer3: "Vào biên",
        answer4: "Vào bóng",
        result: "Vào bóng",
        correct: "Đá bóng thì dĩ nhiên là vào bóng rồi");
    _database!.insert("questable", question5.toJson());
    // ignore: unnecessary_new
    Questions question6 = new Questions(
        question:
            'Đố bạn có bao nhiêu chữ C trong câu sau đây: “ Cơm, canh, cháo gì tớ cũng thích ăn!”',
        answer1: "1 chữ C",
        answer2: "2 chữ C",
        answer3: "3 chữ C",
        answer4: "4 chữ C",
        result: "1 chữ C",
        correct: 'C cũng là c mà không phải C');
    _database!.insert("questable", question6.toJson());
    // ignore: unnecessary_new
    Questions question7 = new Questions(
        question:
            "Cái gì người mua biết, người bán biết, người xài không bao giờ biết?",
        answer1: "Cái nồi cơm",
        answer2: "Cái quan tài",
        answer3: "Cái áo",
        answer4: "Cái mũ",
        result: "Cái quan tài",
        correct: "Người chết rồi thì sao biết được");
    _database!.insert("questable", question7.toJson());
    // ignore: unnecessary_new
    Questions question8 = new Questions(
        question: "Lửa cháy trong bếp, cách dập lửa tốt nhất là gì",
        answer1: "Tắt bếp ga",
        answer2: "Đổ nước vào dập lửa",
        answer3: "Gọi cứu hỏa",
        answer4: "Uống nước",
        result: "Tắt bếp ga",
        correct: "Tắt bếp đi là xong mà");
    _database!.insert("questable", question8.toJson());
    // ignore: unnecessary_new
    Questions question9 = new Questions(
        question:
            "2 con vịt đi trước 2 con vịt, 2 con vịt đi sau 2 con vịt, 2 con vịt đi giữa 2 con vịt. Có bao nhiêu con vịt?",
        answer1: "2 con",
        answer2: "3 con",
        answer3: "4 con",
        answer4: "5 con",
        result: "4 con",
        correct: "4 con vịt đi thẳng hàng");
    _database!.insert("questable", question9.toJson());
    // ignore: unnecessary_new
    Questions question10 = new Questions(
        question: "Cái gì luôn tăng mà không bao giờ giảm?",
        answer1: "Tiền",
        answer2: "Tuổi",
        answer3: "Điểm thi",
        answer4: "Tri thức",
        result: "Tuổi",
        correct: "Tuổi luôn tăng qua mỗi năm ...");
    _database!.insert("questable", question10.toJson());
    // ignore: unnecessary_new
    Questions question11 = new Questions(
        question:
            "Khi bị rơi từ trên máy bay xuống đất, mong muốn lớn nhất là gì ?",
        answer1: "Máy bay chưa cất cánh",
        answer2: "Được ăn mọi thứ ngon",
        answer3: "Được làm tổng thống",
        answer4: "Thật nhiều tiền",
        result: "Máy bay chưa cất cánh",
        correct: "Mong muốn nhỏ nhoi :(");
    _database!.insert("questable", question11.toJson());
    // ignore: unnecessary_new
    Questions question12 = new Questions(
        question: "Tarzan do bầy sói nuôi lớn, vậy người Dơi do ai nuôi lớn ?",
        answer1: "Người Dơi mồ côi",
        answer2: "Dơi nuôi lớn",
        answer3: "Bố mẹ người Dơi",
        answer4: "Người ngoài hành tinh",
        result: "Bố mẹ người Dơi",
        correct: "Dark...knight");
    _database!.insert("questable", question12.toJson());
    // ignore: unnecessary_new
    Questions question13 = new Questions(
        question:
            "Có một tàu điện đi về hướng nam. Gió hướng tây bắc. Vậy khói từ con tàu sẽ theo hướng nào?",
        answer1: "Đông",
        answer2: "Tây",
        answer3: "Bắc",
        answer4: "Không hướng nào",
        result: "Không hướng nào",
        correct: "Tàu điện làm gì có khói");
    _database!.insert("questable", question13.toJson());
    // ignore: unnecessary_new
    Questions question14 = new Questions(
        question: "Trong tất cả các môn thi đấu, có môn nào phải đi lùi không",
        answer1: "Kéo co",
        answer2: "Đua xe",
        answer3: "Chạy 500m",
        answer4: "Nhảy xa",
        result: "Kéo co",
        correct: "Kéo co tiến lên thì thua mất rồi");
    _database!.insert("questable", question14.toJson());
    // ignore: unnecessary_new
    Questions question15 = new Questions(
        question:
            "Nếu bạn nhìn thấy con chim đang đậu trên nhánh cây, làm sao để lấy nhánh cây mà không làm động con chim?",
        answer1: "Bắt chim bỏ ra ngoài",
        answer2: "Đợi chim bay đi",
        answer3: "Ru chim ngủ rồi lấy",
        answer4: "Cứ đến mà lấy",
        result: "Đợi chim bay đi",
        correct: "Đợi chờ là hạnh phúc");
    _database!.insert("questable", question15.toJson());
    // ignore: unnecessary_new
    Questions question16 = new Questions(
        question: "Từ gì mà 100% người Việt Nam đều phát âm sai?",
        answer1: "Sai",
        answer2: "Ngặt nghèo",
        answer3: "Xăm xắp",
        answer4: "Xẻn lẻn",
        result: "Sai",
        correct: 'Đáp án "sai" !!');
    _database!.insert("questable", question16.toJson());
    // ignore: unnecessary_new
    Questions question17 = new Questions(
        question: "Miệng rộng lớn nhưng không nói một từ, là con gì?",
        answer1: "Con cá voi",
        answer2: "Con khỉ đột",
        answer3: "Con sông",
        answer4: "Con voi",
        result: "Con sông",
        correct: "Ơi con sông quê, con sông quê");
    _database!.insert("questable", question17.toJson());
    // ignore: unnecessary_new
    Questions question18 = new Questions(
        question: "Loại nước giải khát nào chứa Canxi và Sắt?",
        answer1: "CoCa",
        answer2: "Pepsi",
        answer3: "Cafe",
        answer4: "Sinh tố",
        result: "Cafe",
        correct: "Canxi + Fe = CaFe, 10 điểm hóa học");
    _database!.insert("questable", question18.toJson());
    // ignore: unnecessary_new
    Questions question19 = new Questions(
        question: "Cái gì bạn không mượn mà trả?",
        answer1: "Tiền",
        answer2: "Lời cảm ơn",
        answer3: "Tình",
        answer4: "Không có thứ gì",
        result: "Lời cảm ơn",
        correct: "Thank you <3");
    _database!.insert("questable", question19.toJson());
    // ignore: unnecessary_new
    Questions question20 = new Questions(
        question:
            "Vào lúc nửa đêm đồng hồ bất chợt gõ 13 tiếng, chuyện gì xảy ra?",
        answer1: "Có ma",
        answer2: "Chuyện xấu sẽ đến",
        answer3: "Ngày tận thế",
        answer4: "Mang đồng hồ đi sửa",
        result: "Mang đồng hồ đi sửa",
        correct: "Chuyện tâm linh không đùa được đâu !!");
    _database!.insert("questable", question20.toJson());
    // ignore: unnecessary_new
    Questions question21 = new Questions(
        question:
            "Nếu dì của bạn có một chị gái, nhưng bạn lại không gọi người ấy là dì, người ấy là ai",
        answer1: "Mẹ",
        answer2: "Bác",
        answer3: "Thím",
        answer4: "Bà",
        result: "Mẹ",
        correct: "chị gái của dì là mẹ");
    _database!.insert("questable", question21.toJson());
    // ignore: unnecessary_new
    Questions question22 = new Questions(
        question: "Một anh thanh niên đánh 1 bà già hỏi anh ấy mất gì?",
        answer1: "Mất tiền",
        answer2: "Mất trí",
        answer3: "Mất sức",
        answer4: "Mất dạy",
        result: "Mất dạy",
        correct:
            "Tôi năm nay hơn 70 tuổi mà chưa gặp trường hợp nào như thế này cả");
    _database!.insert("questable", question22.toJson());
    // ignore: unnecessary_new
    Questions question23 = new Questions(
        question:
            "Có 2 người cha và 2 người con cùng chia đều số tiền là 27 nghìn. Hỏi mỗi người được bao nhiều?",
        answer1: "6,75",
        answer2: "7",
        answer3: "7,5",
        answer4: "9",
        result: "9",
        correct:
            "2 người cha là ông và bố còn lại là con nên có 3 người, 27 / 3 = 9");
    _database!.insert("questable", question23.toJson());
    // ignore: unnecessary_new
    Questions question24 = new Questions(
        question: "Số nào trừ đi một nửa bằng 0",
        answer1: "8",
        answer2: "0",
        answer3: "9",
        answer4: "4",
        result: "8",
        correct: "Che một nửa số 8 sẽ ra số 0");
    _database!.insert("questable", question24.toJson());
    // ignore: unnecessary_new
    Questions question25 = new Questions(
        question:
            "Một kẻ giết người bị kết án tử hình. Hắn ta phải chọn một trong ba căn phòng: phòng thứ nhất lửa cháy dữ dội, phòng thứ hai đầy những kẻ ám sát đang giương súng, và phòng thứ ba đầy sư tử nhịn đói trong ba năm. Phòng nào an toàn nhất cho hắn?",
        answer1: "Phòng thứ nhất",
        answer2: "Phòng thứ hai",
        answer3: "Phòng thứ ba",
        answer4: "Không phòng nào",
        result: "Phòng thứ ba",
        correct: "3 năm không ăn gì thì chỉ có phép màu mới sống thôi");
    _database!.insert("questable", question25.toJson());
    // ignore: unnecessary_new
    Questions question26 = new Questions(
        question:
            "Bố mẹ có 6 người con trai, mỗi người con trai có một đứa em gái. Vậy gia đình đó có mấy người?",
        answer1: "8",
        answer2: "9",
        answer3: "10",
        answer4: "11",
        result: "9",
        correct: "6 người con trai + 1 em gái + 2 bố mẹ = 9 người");
    _database!.insert("questable", question26.toJson());
    // ignore: unnecessary_new
    Questions question27 = new Questions(
        question:
            "Chồng người da đen, vợ người da trắng vừa sinh một đứa bé, răng của nó màu gì?",
        answer1: "Trắng",
        answer2: "Đen",
        answer3: "Vàng",
        answer4: "Không có màu",
        result: "Không có màu",
        correct: "Mới đẻ thì làm sao có răng");
    _database!.insert("questable", question27.toJson());
    // ignore: unnecessary_new
    Questions question28 = new Questions(
        question: "Bệnh gì bác sĩ bó tay?",
        answer1: "Đau đầu",
        answer2: "Đau lưng",
        answer3: "Tương tư",
        answer4: "Gãy tay",
        result: "Gãy tay",
        correct: "Bị gãy tay nên bác sĩ phải bó tay thôi");
    _database!.insert("questable", question28.toJson());
    // ignore: unnecessary_new
    Questions question29 = new Questions(
        question: "Con trai có gì quý nhất?",
        answer1: "Thận",
        answer2: "Tấm lòng",
        answer3: "<==3",
        answer4: "Ngọc trai",
        result: "Ngọc trai",
        correct: "<==3");
    _database!.insert("questable", question29.toJson());
    // ignore: unnecessary_new
    Questions question30 = new Questions(
        question: "Khi ô tô rẽ phải, bánh xe nào sẽ không xoay ?",
        answer1: "Bánh lái",
        answer2: "Bánh trước",
        answer3: "Bánh sau",
        answer4: "Bánh dự phòng",
        result: "Bánh dự phòng",
        correct: "khó thế cũng nghĩ ra");
    _database!.insert("questable", question30.toJson());
    // ignore: unnecessary_new
    Questions question31 = new Questions(
        question:
            "Cái đầu giống mèo, chân giống mèo, và tai giống con mèo, nhưng không phải con mèo. Vậy là con gì?",
        answer1: "Con mèo con",
        answer2: "Con sư tử",
        answer3: "Con hổ",
        answer4: "Con gà",
        result: "Con mèo con",
        correct: "Không phải con mèo mà là mèo con");
    _database!.insert("questable", question31.toJson());
    // ignore: unnecessary_new
    Questions question32 = new Questions(
        question:
            "Có ba quả táo trên bàn và bạn lấy đi hai quả. Hỏi bạn còn bao nhiêu quả táo?",
        answer1: "2 quả",
        answer2: "3 quả",
        answer3: "4 quả",
        answer4: "1 quả",
        result: "2 quả",
        correct: "Bạn lấy 2 quả thì bạn có 2 quả");
    _database!.insert("questable", question32.toJson());
    // ignore: unnecessary_new
    Questions question33 = new Questions(
        question:
            "Tìm điểm sai trong câu: “dưới ánh nắng sương long lanh triệu cành hồng khoe sắc thắm”",
        answer1: "dưới ánh nắng",
        answer2: "triệu cành hồng",
        answer3: "sương long lanh",
        answer4: "khoe sắc thắm",
        result: "khoe sắc thắm",
        correct: "Khoe sắc Khóe =))");
    _database!.insert("questable", question33.toJson());
    // ignore: unnecessary_new
    Questions question34 = new Questions(
        question: "Mồm bò mà không phải mồm bò. Đố là con gì",
        answer1: "Con ốc sên",
        answer2: "Con bò",
        answer3: "Con lợn",
        answer4: "Con chó",
        result: "Con ốc sên",
        correct: "bò là bò, còn bò là bò");
    _database!.insert("questable", question34.toJson());
    // ignore: unnecessary_new
    Questions question35 = new Questions(
        question: "Vừa bằng hạt đỗ, ăn giỗ cả làng. là con gì?",
        answer1: "Con lợn",
        answer2: "Con ruồi",
        answer3: "Con trâu",
        answer4: "Con chó",
        result: "Con ruồi",
        correct: "Mâm nào cũng thấy ngồi");
    _database!.insert("questable", question35.toJson());
    // ignore: unnecessary_new
    Questions question36 = new Questions(
        question: "Nếu quả táo bị bổ đôi trông giống cái gì nhất",
        answer1: "Nửa còn lại",
        answer2: "Cái bàn là",
        answer3: "Quả táo",
        answer4: "Không giống gì cả",
        result: "Nửa còn lại",
        correct: 'Bị bổ đôi nên nửa còn lại giống nửa kia');
    _database!.insert("questable", question36.toJson());
    // ignore: unnecessary_new
    Questions question37 = new Questions(
        question: "Biển nào nguy hiểm nhất ?",
        answer1: "Biển lửa",
        answer2: "Biển báo",
        answer3: "Biển caribe",
        answer4: "Biển tình",
        result: "Biển lửa",
        correct: "Anh nguyện nhảy vào biển lửa vì em");
    _database!.insert("questable", question37.toJson());
    // ignore: unnecessary_new
    Questions question38 = new Questions(
        question:
            "Con gì có mũi có lưỡi hẳn hoi. có sống không chết người đời cần luôn?",
        answer1: "Con dao",
        answer2: "Con kiến",
        answer3: "Con chim",
        answer4: "Con voi",
        result: "Con dao",
        correct: "Mũi dao, lưỡi dao");
    _database!.insert("questable", question38.toJson());
    // ignore: unnecessary_new
    Questions question39 = new Questions(
        question:
            "Da thịt như than. Áo choàng như tuyết. Giúp người trị bệnh. Mà tên chẳng hiền?",
        answer1: "Gà ác",
        answer2: "Nhân sâm",
        answer3: "Đinh lăng",
        answer4: "Củ khoai",
        result: "Gà ác",
        correct: "cục..cục...cục ácc..cục ácccc...");
    _database!.insert("questable", question39.toJson());
    // ignore: unnecessary_new
    Questions question40 = new Questions(
        question: "Bạn có biết củ khoai lớn nhất thế giới mọc ở đâu không ?",
        answer1: "Dưới đất",
        answer2: "Trong phim",
        answer3: "Phòng thí nghiệm",
        answer4: "Quảng cáo",
        result: "Dưới đất",
        correct: "Khoai được trồng dưới đất");
    _database!.insert("questable", question40.toJson());
    // ignore: unnecessary_new
    Questions question41 = new Questions(
        question: "Con mèo nào cực kỳ sợ chuột?",
        answer1: "mèo Doremon",
        answer2: "mèo cái",
        answer3: "mèo đực",
        answer4: "mèo Tom",
        result: "mèo Doremon",
        correct: "Doremon hay Doraemon ?");
    _database!.insert("questable", question41.toJson());
    // ignore: unnecessary_new
    Questions question42 = new Questions(
        question: "Người đàn ông duy nhất trên thế giới có…sữa là ai?",
        answer1: "Ông thọ",
        answer2: "Ông già noel",
        answer3: "Ông ba bị",
        answer4: "Ông hàng xóm",
        result: "Ông thọ",
        correct: "Chắc chắn phải là ông hàng xóm chứ ...!");
    _database!.insert("questable", question42.toJson());
    // ignore: unnecessary_new
    Questions question43 = new Questions(
        question: "Con mèo có gì mà không bất kỳ con vật nào có?",
        answer1: "tiếng kêu",
        answer2: "cái tai",
        answer3: "bộ lông",
        answer4: "đôi mắt",
        result: "tiếng kêu",
        correct: "mèo méo meo mèo meooooo...");
    _database!.insert("questable", question43.toJson());
    // ignore: unnecessary_new
    Questions question44 = new Questions(
        question: "Làm thế nào để con cua được chín chân?",
        answer1: "Thêm 1 chân",
        answer2: "Luộc",
        answer3: "Bẻ 1 chân",
        answer4: "Không làm gì cả",
        result: "Luộc",
        correct: "Không luộc sao chín");
    _database!.insert("questable", question44.toJson());
    // ignore: unnecessary_new
    Questions question45 = new Questions(
        question: "Hoa gì biết ăn, biết nói, biết hát …?",
        answer1: "Hoa hậu",
        answer2: "Hoa hồng",
        answer3: "Hoa lan",
        answer4: "Hoa cúc",
        result: "Hoa hậu",
        correct: "Là người dĩ nhiên biết ăn biết nói rồi");
    _database!.insert("questable", question45.toJson());
    // ignore: unnecessary_new
    Questions question46 = new Questions(
        question: "Cây gì một lá?",
        answer1: "Cây cờ",
        answer2: "Cây đa",
        answer3: "Cây trúc",
        answer4: "Cây bút",
        result: "Cây cờ",
        correct: "Cây cờ có 1 lá cờ");
    _database!.insert("questable", question46.toJson());
    // ignore: unnecessary_new
    Questions question47 = new Questions(
        question: "Quần nào rộng nhất?",
        answer1: "Quần đảo",
        answer2: "Quần kHá BảNh",
        answer3: "Quần bò",
        answer4: "Quần chúng",
        result: "Quần đảo",
        correct: "bẠn BiẾt MúA qUạT Ko ?");
    _database!.insert("questable", question47.toJson());
    // ignore: unnecessary_new
    Questions question48 = new Questions(
        question: "Môn gì càng thắng càng thua?",
        answer1: "Môn đua xe",
        answer2: "Môn toán",
        answer3: "Môn văn",
        answer4: "Môn lý",
        result: "Môn đua xe",
        correct: "Đường tình anh thua nhưng đường đua anh chấp hết");
    _database!.insert("questable", question48.toJson());
    // ignore: unnecessary_new
    Questions question49 = new Questions(
        question: "Yêu đến lần thứ bảy được gọi là tình gì?",
        answer1: "Thất Tình",
        answer2: "Si Tình",
        answer3: "Tình bạn",
        answer4: "Tình đồng chí",
        result: "Thất Tình",
        correct: "Ai rồi cũng phải thất tình thôi !!");
    _database!.insert("questable", question49.toJson());
    // ignore: unnecessary_new
    Questions question50 = new Questions(
        question: "Cái gì càng đẩy càng căng",
        answer1: "ABC XYZ",
        answer2: "Bơm xe",
        answer3: "Không biết gì hết",
        answer4: "Xây nhà",
        result: "Bơm xe",
        correct: "He-He Boy");
    _database!.insert("questable", question50.toJson());
    // ignore: unnecessary_new
    Questions question51 = new Questions(
        question: "Cái gì khi có đầu lại thấp hơn khi không có đầu ?",
        answer1: "Cái gối",
        answer2: "Cái bát",
        answer3: "Cái thìa",
        answer4: "Cái áo",
        result: "Cái gối",
        correct: "Nằm vào gối khiến gối thấp hơn");
    _database!.insert("questable", question51.toJson());
    // ignore: unnecessary_new
    Questions question52 = new Questions(
        question:
            "5 con gà 5 ngày đẻ 5 quả trứng.\n nếu 100 ngày muốn đẻ 100 quả thì cần bao nhiêu con gà",
        answer1: "5 con",
        answer2: "100 con",
        answer3: "25 con",
        answer4: "15 con",
        result: "5 con",
        correct:
            "1 ngày 5 con gà đẻ được 1 quả \nnên 100 ngày 5 con gà đẻ được 100 quả");
    _database!.insert("questable", question52.toJson());
    // ignore: unnecessary_new
    Questions question53 = new Questions(
        question: "Một người lùn làm sao để cao lên nhanh nhất",
        answer1: "Phẫu thuật",
        answer2: "Đứng cạnh người lùn hơn",
        answer3: "Đội mũ",
        answer4: "Hết cách rồi",
        result: "Đứng cạnh người lùn hơn",
        correct: "Cách tốt nhất tự an ủi bản thân");
    _database!.insert("questable", question53.toJson());
    // ignore: unnecessary_new
    Questions question54 = new Questions(
        question: "Từ điển tiếng việt có bao nhiêu từ",
        answer1: "4 từ",
        answer2: "69 từ",
        answer3: "Không thể đếm",
        answer4: "22 từ",
        result: "4 từ",
        correct: '"Từ" "điển" "tiếng" "việt" có 4 từ');
    _database!.insert("questable", question54.toJson());
    // ignore: unnecessary_new
    Questions question55 = new Questions(
        question: "Sắt để ngoài trời sẽ bị gỉ\nvậy Vàng để ngoài trời sẽ sao ?",
        answer1: "Bị mất",
        answer2: "Bị phai màu",
        answer3: "Bị gỉ",
        answer4: "Bị mòn",
        result: "Bị mất",
        correct: 'Để ngoài thì chỉ còn cái nịt thôi...');
    _database!.insert("questable", question55.toJson());
    // ignore: unnecessary_new
    Questions question56 = new Questions(
        question:
            "Thứ gì chưa ăn có màu xanh, khi ăn có màu đỏ, nhả ra thì có màu đen ?",
        answer1: "Quả dưa hấu",
        answer2: "Quả ổi",
        answer3: "Quả gấc",
        answer4: "Quả mít",
        result: "Quả dưa hấu",
        correct: 'vỏ xanh, ruột đỏ, hạt đen');
    _database!.insert("questable", question56.toJson());
    // ignore: unnecessary_new
    Questions question57 = new Questions(
        question: "8 chia 2 bằng mấy ?",
        answer1: "Bằng 4",
        answer2: "Bằng 2",
        answer3: "Bằng 3",
        answer4: "Bằng 0",
        result: "Bằng 0",
        correct: 'Số 8 cắt ngang được 2 số 0');
    _database!.insert("questable", question57.toJson());
    // ignore: unnecessary_new
    Questions question58 = new Questions(
        question:
            "Có người bị bệnh nhưng chưa bao giờ biết mặt bác sĩ, đó là ai ?",
        answer1: "Người bị mù",
        answer2: "Người bị què",
        answer3: "Người bị điếc",
        answer4: "Không có ai",
        result: "Người bị mù",
        correct: 'Bị mù thì sao thấy bác sĩ');
    _database!.insert("questable", question58.toJson());
    // ignore: unnecessary_new
    Questions question59 = new Questions(
        question: "Nhìn vào gương. Bạn thấy gì ?",
        answer1: "Chính mình",
        answer2: "Ma",
        answer3: "Gương",
        answer4: "Hàng xóm",
        result: "Gương",
        correct: 'Nhìn vào gương thì thấy gương chứ thấy gì?');
    _database!.insert("questable", question59.toJson());
    // ignore: unnecessary_new
    Questions question60 = new Questions(
        question: "Cái gì chứa rất nhiều nước mà không bị ướt ?",
        answer1: "Bản đồ",
        answer2: "Chai nước",
        answer3: "Áo mưa",
        answer4: "Cái thau",
        result: "Bản đồ",
        correct: 'Đáp án là như vậy đó !');
    _database!.insert("questable", question60.toJson());
    // ignore: unnecessary_new
    Questions question61 = new Questions(
        question: "Khi nào con người thích đánh chính mình",
        answer1: "Vỗ tay",
        answer2: "Dở hơi",
        answer3: "Chả ai tự đánh",
        answer4: "Không có đáp án",
        result: "Vỗ tay",
        correct: 'Câu trả lời hoàn toàn chính xác');
    _database!.insert("questable", question61.toJson());
    // ignore: unnecessary_new
    Questions question62 = new Questions(
        question:
            "Con của con trâu là nghé. Con của con bò là bê.\nHỏi con lừa mẹ là con gì ?",
        answer1: "Con hư",
        answer2: "Con lừa con",
        answer3: "Con lừa mẹ",
        answer4: "Con trâu",
        result: "Con hư",
        correct:
            'Con mà đi lừa mẹ thì là con hư chứ là con gì,\nCon với chả cái =))');
    _database!.insert("questable", question62.toJson());
    // ignore: unnecessary_new
    Questions question63 = new Questions(
        question: "Con gà trống ngủ với con gà mái thì bạn phải làm gì ?",
        answer1: "Tách ra",
        answer2: "Chụp ảnh",
        answer3: "Kệ nó",
        answer4: "Quay video",
        result: "Kệ nó",
        correct: 'Bạn còn định làm gì khác à ?');
    _database!.insert("questable", question63.toJson());
    // ignore: unnecessary_new
    Questions question64 = new Questions(
        question:
            "Một con ngựa, cái đầu của nó hướng về phía Đông\nthì cái đuôi có nó hướng về đâu ?",
        answer1: "Xuống đất",
        answer2: "Phía tây",
        answer3: "Phía nam",
        answer4: "Phía bắc",
        result: "Xuống đất",
        correct: 'hí hí hí hí');
    _database!.insert("questable", question64.toJson());
    // ignore: unnecessary_new
    Questions question65 = new Questions(
        question: "Tại sao con khủng long xanh lại màu xanh ?",
        answer1: "Nó màu xanh",
        answer2: "Mẹ nó màu xanh",
        answer3: "Nhuộm xanh",
        answer4: "Ốm yếu",
        result: "Nó màu xanh",
        correct: 'Sao phải đặt khó vấn đề nhỉ >.<');
    _database!.insert("questable", question65.toJson());
    // ignore: unnecessary_new
    Questions question66 = new Questions(
        question:
            "1 con chim, 1 con sóc, 1 con khỉ trèo lên cây dừa.\nHỏi con nào lấy được trái chuối trước ?",
        answer1: "Con chim",
        answer2: "Con khỉ",
        answer3: "Con sóc",
        answer4: "Không con nào",
        result: "Không con nào",
        correct: 'Cây dừa làm gì có chuối...!');
    _database!.insert("questable", question66.toJson());
    // ignore: unnecessary_new
    Questions question67 = new Questions(
        question: "Đố mọi người cái gì càng chơi càng ra nước ?",
        answer1: "Bắn bi",
        answer2: "Chơi cờ",
        answer3: "(|) <==3",
        answer4: "Chuyển câu được không ạ?",
        result: "Chơi cờ",
        correct: 'Nụ cười dần thiếu đi đạo đức :(');
    _database!.insert("questable", question67.toJson());
    // ignore: unnecessary_new
    Questions question68 = new Questions(
        question:
            "Một cậu bé đi khám bác sĩ.Cậu bảo tay cháu ấn vào đâu cũng bị đau.Hỏi cậu bé bị sao",
        answer1: "Đau tay",
        answer2: "Ung thư giai đoạn cuối",
        answer3: "Bị sốt",
        answer4: "Bệnh lười",
        result: "Đau tay",
        correct: 'Tay bị đau ấn vào đâu chả đau');
    _database!.insert("questable", question68.toJson());
    // ignore: unnecessary_new
    Questions question69 = new Questions(
        question:
            "Một lớp có 100 học sinh mỗi bàn ngồi 2 người vậy trong lớp có bao nhiêu cái bàn ?",
        answer1: "49 bàn",
        answer2: "50 bàn",
        answer3: "51 bàn",
        answer4: "60 bàn",
        result: "51 bàn",
        correct: '50 bàn thêm 1 bàn giáo viên');
    _database!.insert("questable", question69.toJson());
    // ignore: unnecessary_new
    Questions question70 = new Questions(
        question: "Trái gì đập không chết không đập thì chết",
        answer1: "Trái bóng",
        answer2: "Trái tim",
        answer3: "Trái cam",
        answer4: "Cả 3",
        result: "Trái tim",
        correct: 'Từ ngày em bỏ anh trái tim như chết lặng...');
    _database!.insert("questable", question70.toJson());
    // ignore: unnecessary_new
    Questions question71 = new Questions(
        question: "Trời âm u có 3 ông mù đi vào vườn hỏi ông nào bị ướt",
        answer1: "Ông đi đầu tiên",
        answer2: "Cả 3 ông",
        answer3: "Không có ông nào",
        answer4: "2 ông đi sau",
        result: "Không có ông nào",
        correct: 'Trời đã mưa đâu mà bị ướt');
    _database!.insert("questable", question71.toJson());
    // ignore: unnecessary_new
    Questions question72 = new Questions(
        question: "Heo và lợn khác nhau chỗ nào",
        answer1: "Heo ăn bắp lợn ăn ngô",
        answer2: "Khác chữ",
        answer3: "Lợn miền bắc heo miền nam",
        answer4: "Tất cả đáp án trên",
        result: "Khác chữ",
        correct: 'Có thế cũng hỏi...');
    _database!.insert("questable", question72.toJson());
    // ignore: unnecessary_new
    Questions question73 = new Questions(
        question: "Con gì đầu dê mình ốc",
        answer1: "Con bò",
        answer2: "Con ốc",
        answer3: "Con dốc",
        answer4: "Con lừa",
        result: "Con dốc",
        correct: 'Đầu "D" mình "ốc" => Dốc, EZ game');
    _database!.insert("questable", question73.toJson());
    // ignore: unnecessary_new
    Questions question74 = new Questions(
        question:
            "Trong hồ có 10 con cá,3 con bị chìm, 3 con bị chết, 4 con bơi đi hỏi trong hồ còn bao nhiêu con ?",
        answer1: "2 con",
        answer2: "10 con",
        answer3: "7 con",
        answer4: "8 con",
        result: "10 con",
        correct:
            'Chìm vẫn nằm trong hồ, chết vẫn trong hồ,4 con bơi đi cũng ở trong hồ');
    _database!.insert("questable", question74.toJson());
    // ignore: unnecessary_new
    Questions question75 = new Questions(
        question: "Có người dẫm lên con kiến nhưng sao con kiến không chết ?",
        answer1: "Con kiến bất tử",
        answer2: "Do kiến nhỏ quá",
        answer3: "Đi giày cao gót",
        answer4: "Kiến không thích chết",
        result: "Đi giày cao gót",
        correct: 'Hên xui trúng gót thì vẫn chết nha');
    _database!.insert("questable", question75.toJson());
    // ignore: unnecessary_new
    Questions question76 = new Questions(
        question: "Bánh gì ăn không cần trả tiền ?",
        answer1: "Bánh bao",
        answer2: "Bánh xe",
        answer3: "Bánh đúc",
        answer4: "Bánh cuốn",
        result: "Bánh bao",
        correct: 'Được bao thì sao phải trả tiền nhỉ');
    _database!.insert("questable", question76.toJson());
    // ignore: unnecessary_new
    Questions question77 = new Questions(
        question: "Cầu gì biết nói biết đi biết ăn biết cười ?",
        answer1: "Cầu thủ",
        answer2: "Cầu trượt",
        answer3: "Cầu lông",
        answer4: "Cầu dao",
        result: "Cầu thủ",
        correct: 'tôi là fan cứng MU người người kính nể ...');
    _database!.insert("questable", question77.toJson());
    // ignore: unnecessary_new
    Questions question78 = new Questions(
        question: "Con gì càng lớn càng nhỏ",
        answer1: "Con cua",
        answer2: "Con <==3",
        answer3: "Con trai",
        answer4: "Con bò",
        result: "Con cua",
        correct: 'Con cua 2 càng càng lớn và càng nhỏ =))');
    _database!.insert("questable", question78.toJson());
    // ignore: unnecessary_new
    Questions question79 = new Questions(
        question: "Ngựa vằn màu đen sọc trắng hay trắng sọc đen",
        answer1: "Trắng sọc đen",
        answer2: "Đen sọc trắng",
        answer3: "Trắng đen lẫn lộn",
        answer4: "Tất cả đều đúng",
        result: "Tất cả đều đúng",
        correct: 'Chuẩn rồi tiếp tục thôi nào');
    _database!.insert("questable", question79.toJson());
    // ignore: unnecessary_new
    Questions question80 = new Questions(
        question: "Tôi có 3 mắt 1 chân dài 0 tai 0 miệng tôi là gì",
        answer1: "Yêu quái",
        answer2: "Con ma",
        answer3: "Con thằn lằn",
        answer4: "Cột đèn giao thông",
        result: "Cột đèn giao thông",
        correct: 'Xanh vàng đỏ');
    _database!.insert("questable", question80.toJson());
    // ignore: unnecessary_new
    Questions question81 = new Questions(
        question: "Muỗi đốt người là muỗi đực hay muỗi cái ?",
        answer1: "Muỗi cái",
        answer2: "Muỗi đực",
        answer3: "Muỗi bê đê",
        answer4: "Cả 2 loại",
        result: "Muỗi cái",
        correct: 'woww!! Rất chính xác');
    _database!.insert("questable", question81.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _database!.query("questable");
  }

  static delete() async {
    return await _database!.rawDelete("DELETE FROM questable");
  }

//player
  static Future<int> insertPlayer(Player? player) async {
    return await _database?.insert("playertable", player!.toJson()) ?? 1;
  }

  static deletePlayer(int id) async {
    return await _database!
        .delete("playertable", where: "id=?", whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getPlayer() async {
    return await _database!.query("playertable");
  }
}
