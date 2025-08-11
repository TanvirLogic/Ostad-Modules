/*

Timer? _time;

@override
void initState() {
  super.initState();
  _time = Timer.periodic(Duration(seconds: 1), (timer) {
    if (currentInTake > 0) {
      setState(() {
        currentInTake = (currentInTake - 1).clamp(0, goal);
      });
    }
  });
}

*/