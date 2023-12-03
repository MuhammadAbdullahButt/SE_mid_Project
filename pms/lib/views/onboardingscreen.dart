import "package:flutter/material.dart";
import "package:pms/views/LoginSc.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class onboardingScreen extends StatefulWidget {
  const onboardingScreen({super.key});
  @override
  State<onboardingScreen> createState() => _onboardingScreenState();
}

class _onboardingScreenState extends State<onboardingScreen> {

  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      height: 350,
                      width: 350,
                      child: Image.asset('assets/Welcome.jpg'),
                    ),
                    const Text("Project Management Tool",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: 'playFairItalic'),),
                  ],
                ),
              ),
              Container(
                color: const Color(0xfff8f9fa),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      child: Image.asset('assets/manageprojects.jpg'),
                    ),
                    const Text('Keep your team organized and on track',style: TextStyle(fontFamily: 'playFair',fontSize: 20),)
                  ],
                )
              ),
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 350,
                      width: 350,
                      child: Image.asset('assets/teamwork.jpg'),
                    ),
                    const Text('Collaborate effectively with your team',style:TextStyle(fontFamily: 'playFair',fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
          //SmoothPageIndicator
          Container(
            alignment: const Alignment(0,0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3)),
          // Done Button
          Container(
              alignment: const Alignment(0.75,0.75),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return const LoginSc();
                  }));
                },
                  child: const Text('Done',style: TextStyle(fontSize: 18,fontFamily: 'playFair'),)))
        ],
      ),
    );
  }
}
