import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/QuestionsAdd.dart';
import 'package:mobile/QuestionsEdit.dart';
import 'package:mobile/services/service_questions.dart';
import 'package:mobile/variables/variables.dart';
import 'package:http/http.dart' as http;

class QuestionsList extends StatefulWidget {
  const QuestionsList({Key? key}) : super(key: key);

  @override
  _QuestionsListState createState() => _QuestionsListState();
}

ColorCodes colorCodes = new ColorCodes();

class _QuestionsListState extends State<QuestionsList> {
  List questions = [];
  bool isLoading = false;

  getQuestions() async {
    var myUrl = "http://10.0.2.2:5000/question/questions";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['questions'];
      setState(() {
        questions = items;
      });
    } else {
      setState(() {
        questions = [];
      });
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'QUESTIONS LIST',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new QuestionsAdd()));
              },
              icon: Image.asset('icons/add.png'),
            )
          ],
        ),
        body: getBody());
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return getCard(questions[index]);
        });
  }

  Widget getCard(index) {
    var questionBody = index['questionBody'];
    // var categoryName = index['categoryName'];
    // var questionAnswers = index['questionAnswers'];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            editQuestions(index);
          },
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      questionBody.toString(),
                      style: TextStyle(
                          color: colorCodes.insideText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   categoryName.toString(),
                    //   style: TextStyle(
                    //       color: colorCodes.insideText,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // Text(
                    //   questionAnswers.toString(),
                    //   style: TextStyle(
                    //       color: colorCodes.insideText,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
                Align(
                  
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    
                    
                    onPressed: () {
                      deleteQuestions(index);
                    },
                    icon: Image.asset('icons/delete.png'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  editQuestions(index) {
    var id = index['_id'].toString();
    var questionBody = index['questionBody'].toString();
    var categoryName = index['categoryName'].toString();
    var questionAnswers = index['questionAnswers'].toString();
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new QuestionsEdit(
                id: id,
                questionBody: questionBody,
                categoryName: categoryName,
                questionAnswers: questionAnswers)));
  }

  deleteQuestions(index) {
    var id = index['_id'].toString();
    Questions().questiondelete(id);
  }
}
