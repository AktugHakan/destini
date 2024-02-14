import 'package:destini/story.dart';
import 'package:destini/story_brain.dart';
import 'package:destini/text_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: StoryPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  var storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              storyBrain.getStory(),
              style: textStyleStory,
            ),
          ),
          flex: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextButton(
              child: Text(
                storyBrain.getChoice1(),
                style: textStyleStory,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Visibility(
            visible: storyBrain.buttonShouldBeVisible(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextButton(
                child: Text(
                  storyBrain.getChoice2(),
                  style: textStyleStory,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(),
                ),
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
