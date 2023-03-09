import 'package:education_quiz_app/quiz/result_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Matemática Soma #156",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        leadingWidth: 100,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              fixedSize: const Size(60, 20),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.money,
                  color: Colors.black,
                ),
                Text(
                  "200",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
              ),
              child: const Icon(Icons.close, color: Colors.black),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width,
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 300,
                height: 12,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(
                      Color(0xff31CD63),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "1/5",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.w300,
                  color: Color(0xff757575),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 330,
            child: Text.rich(
              TextSpan(
                text: "Você ",
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                    text: "deve",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: const Color(0xffA40021),
                        ),
                  ),
                  TextSpan(
                    text: " 5 reais para o seu colega Fábio.",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
            child: Text.rich(
              TextSpan(
                text: "Seu dinheiro: ",
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                    text: "2 reais.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: const Color(0xff1F8C55),
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 330,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffEDE8E3),
                    child: Text(
                      "A",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  SizedBox(
                    width: 260,
                    child: Text.rich(
                      TextSpan(
                        text: "Fico ",
                        style: Theme.of(context).textTheme.bodyText2,
                        children: [
                          TextSpan(
                            text: "devendo",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: const Color(0xffA40021),
                                    ),
                          ),
                          TextSpan(
                            text: " 3 reais para o meu colega Fábio.",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ResultPage(),
                ),
              );
            },
            child: Text(
              "CONTINUE",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xffF4F3F6),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
