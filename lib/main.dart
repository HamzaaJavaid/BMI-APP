import 'dart:async';
//import 'result.dart';
import 'package:flutter/cupertino.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'dart:math';


double height = 184;
double width = 30;

 int person_weight_value = 60;
 int person_height_value  = 130;
 int person_age_value  = 26;


void main(){
  runApp(MaterialApp(
    //debugShowCheckedModeBanner: false,
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
     home :  MainPage(),
  ));
}

 int select  = 0; // for gender
// int  select_weight = 0  ; //for weight
 //int select_age  = 0 ; // for age

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {


  Color male_inactive_color = Colors.green.withOpacity(0.3);
  Color female_inactive_color = Colors.blue.withOpacity(0.3);
  Color calculate_color = Colors.red;




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('BMI CALCULATOR'),),
    ),
    body :Container(
        child:  Column(
            children: [

              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                         setState(() {
                           //if male is not selected
                           if(male_inactive_color==Colors.green.withOpacity(0.3)){
                             male_inactive_color = Colors.greenAccent;
                             female_inactive_color = Colors.blue.withOpacity(0.3);
                             select = 1;
                             Audio.load('assets/progress.wav')..play()..dispose();

                           }
                           //if  male card is selected
                           else{
                             select = 0 ;
                             male_inactive_color = Colors.green.withOpacity(0.3);
                             Audio.load('assets/progress.wav')..play()..dispose();
                           }
                         });


                        },
                        child: gender_container(
                            male_inactive_color,
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 30,),
                                Icon(
                                  Icons.male,
                                  size: 60,
                                ),
                                SizedBox(height: 40,),
                                Text('M A L E',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'H',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ],
                            ),
                          )


                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            // if female is not selected
                            if(female_inactive_color==Colors.blue.withOpacity(0.3)){
                              female_inactive_color= Colors.cyan;
                              male_inactive_color = Colors.green.withOpacity(0.3);
                              select = 1;
                              Audio.load('assets/progress.wav')..play()..dispose();
                            }
                            //if female is selected
                            else{
                              female_inactive_color = Colors.blue.withOpacity(0.3);
                            select = 0;
                              Audio.load('assets/progress.wav')..play()..dispose();
                            }

                          });

                        },
                        child: gender_container(
                            female_inactive_color,
                            Center(
                              child: Column(
                          children: [
                            SizedBox(height: 30,),
                              Icon(
                                Icons.female,
                                size: 60,
                              ),
                            SizedBox(height: 43,),
                              Text('F E M A L E',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'H'
                                ),
                              ),
                          ],
                        ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: middlecontainer(),
                    ),

                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: bottomleftcontainer(),
                    ),
                    Expanded(
                      child: bottomrightcontainer(),
                    ),
                  ],
                ),
              ),
              GestureDetector(

                onTap: (){

                  setState(() {

                    //for gender
                    if(select==0){
                      Audio.load('assets/alert.wav')..play()..dispose();
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          scrollable: true,
                          // backgroundColor: Colors.redAccent,
                          title: Text('WARNING',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 29,
                            ),),
                          content: Text('Must Select A gender',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      });

                    }

                    //for weight ( if it is equal to zero )
                    else if(person_weight_value==0){
                      Audio.load('assets/alert.wav')..play()..dispose();
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          scrollable: true,
                          // backgroundColor: Colors.redAccent,
                          title: Text('WARNING',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 29,
                            ),),
                          content: Text('Weight Must Be Greater Than Zero',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      });

                    }

                    // for height (if it is equal to zero )
                    else if(person_age_value==0){
                      Audio.load('assets/alert.wav')..play()..dispose();
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          scrollable: true,
                          // backgroundColor: Colors.redAccent,
                          title: Text('WARNING',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 29,
                            ),),
                          content: Text('Age Can Never Be Zero',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        );
                      });

                    }
                    else {
                      Audio.load('assets/progress.wav')..play()..dispose();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Result()));
                    }



                    //for weight



                    //for age


                  });

                },
                child: Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(

                      color: calculate_color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                        // color: Colors.white70,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0,3)
                      )]
                  ),
                  child: Center(
                    child: Text(
                      'CALCULATE',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        fontFamily: 'D'
                    ),),),
                ),
              ),

              ],
        )
          )
    );

  }




}




class bottomleftcontainer extends StatefulWidget {
  const bottomleftcontainer({Key? key}) : super(key: key);

  @override
  State<bottomleftcontainer> createState() => bottomleftcontainerState();
}
class bottomleftcontainerState extends State<bottomleftcontainer> {



  //Color colour = Colors.yellow.withOpacity(0.3) ;
  Color colour = Color(0xFF4C4F5E).withOpacity(0.8);
  int weight = 60;


  @override


  Widget build(BuildContext context) {
    return Container(

      height: height,
        width: width,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
           Row(
             children: [
               Expanded(
                 child: RawMaterialButton(
                   onPressed: (){setState(() {
                     if(weight>0){
                     person_weight_value =   (weight-- - 1);
                     Audio.load('assets/button.wav')..play()..dispose();

                     }
                     else{
                       Audio.load('assets/alert.wav')..play()..dispose();
                       showDialog(context: context, builder: (context){
                           return AlertDialog(
                             title: Text('Warning !'),
                             content: Text('Wight can\'t be ZER0'),
                             backgroundColor: Colors.red,
                           );
                       });
                     }
                   });},
                   //  fillColor: Colors.transparent,
                   constraints: BoxConstraints.tightFor(
                     width: 60,
                     height: 60,
                   ),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                   child: Center(child: Icon(Icons.arrow_drop_down_outlined,size: 40,
                     color: Colors.red,),),




                 ),
               ),
               Text('$weight',
                 style: TextStyle(
                     fontSize: 60,
                     fontWeight: FontWeight.bold
                 ),
               ),
               Expanded(child: RawMaterialButton(
                 onPressed: (){
                   setState(() {
                  person_weight_value =    (weight++ +1);
                  Audio.load('assets/button.wav')..play()..dispose();
                   });
                 },
                 //fillColor: Colors.transparent,
                 constraints: BoxConstraints.tightFor(
                   width: 60,
                   height: 60,
                 ),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                 child: Center(child: Icon(Icons.arrow_drop_up_outlined,size: 40,
                   color: Colors.lightGreen,),),




               )),
             ],
           ),
            SizedBox(height: 30,),
            Text('Weight',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'H'
              ),
            ),

            
          ],
        ),
      ),
      

      );
  }
}













class bottomrightcontainer extends StatefulWidget {
  const bottomrightcontainer({Key? key}) : super(key: key);

  @override
  State<bottomrightcontainer> createState() => bottomrightcontainerState();
}
class bottomrightcontainerState extends State<bottomrightcontainer> {

  Color colour = Color(0xFF4C4F5E).withOpacity(0.8);
  //Color colour = Colors.orangeAccent.withOpacity(0.5);
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: colour,

          borderRadius: BorderRadius.circular(30)),
         child: Center(
           child: Column(
             children: [
               SizedBox(height: 50,),
               Row(
                 children: [
                   Expanded(
                     child: RawMaterialButton(
                       onPressed: (){setState(() {
                         if(age>0){
                         person_age_value  =   (age-- + 1)-2;
                         //select_age = 1;
                         Audio.load('assets/button.wav')..play()..dispose();

                         }
                         else{


                          Audio.load('assets/alert.wav')..play()..dispose();
                           showDialog(context: context, builder: (context){
                             return AlertDialog(
                               title: Text('Warning !'),
                               content: Text('AGE can\'t be ZER0'),
                               backgroundColor: Colors.red,


                             );
                           });
                         }
                       });},
                       //  fillColor: Colors.transparent,
                       constraints: BoxConstraints.tightFor(
                         width: 60,
                         height: 60,
                       ),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                       child: Center(child: Icon(Icons.arrow_drop_down_outlined,size: 40,
                         color: Colors.red,),),




                     ),
                   ),
                   Text('$age',
                     style: TextStyle(
                         fontSize: 60,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                   Expanded(child: RawMaterialButton(
                     onPressed: (){
                       setState(() {
                         person_age_value = (age++ - 1 )+2;
                         Audio.load('assets/button.wav')..play()..dispose();
                       });
                     },
                     //fillColor: Colors.transparent,
                     constraints: BoxConstraints.tightFor(
                       width: 60,
                       height: 60,
                     ),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                     child: Center(child: Icon(Icons.arrow_drop_up_outlined,size: 40,
                       color: Colors.lightGreen,),),




                   )),
                 ],
               ),
               SizedBox(height: 30,),
               Text('AGE',
                 style: TextStyle(
                     fontSize: 25,
                     fontFamily: 'H'
                 ),
               ),


             ],
           ),
         ),

    );
  }
}





class middlecontainer extends StatefulWidget {
  const middlecontainer({Key? key}) : super(key: key);

  @override
  State<middlecontainer> createState() => middlecontainerState();
}
class middlecontainerState extends State<middlecontainer> {



  int person_height = 130;


  Color colour = Colors.blueGrey.withOpacity(0.3) ;
  void colorss(){
  }

  Color color_1 = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(30)),
        child : Column(
          children: [
            SizedBox(height: 10,),//10
            Text(
              'HEIGHT',
              style: TextStyle(
                  fontFamily: 'H',
                  fontSize: 20
              ),
            ),
            SizedBox(height: 20,),//20
            Row(
              children: [
                SizedBox(width: 150,),
                Text(
                  '$person_height',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                  ),
                ),
                SizedBox(width: 10,),
                Text('cm',
                  style: TextStyle(
                    fontSize: 20,
                  ),)
              ],

            ),
            SizedBox(height: 10,),//10
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.white70,
                thumbColor: Colors.red,
                overlayColor: Colors.red.withOpacity(0.2),
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 10 ,
                ),

              ),
              child: Slider(
                  value: person_height.toDouble(),

                  min: 40,
                  max: 220,
                  onChanged: (double n_value){

                    setState(() {
                      person_height = n_value.toInt();
                      person_height_value = person_height;
                      //Audio.load('assets/button.wav')..play()..dispose();






                    });
                  }),
            ),
            
            


          ],
        )



    );








  }
}


class gender_container extends StatelessWidget {

  gender_container(@required this.colour , this.child );
  Color colour = Color(0xFF1D1E33).withOpacity(0.6) ;
  Widget child ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(8),
      child: child,
      decoration: BoxDecoration(
          color: colour,

          borderRadius: BorderRadius.circular(30)),
    );

  }
}






class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('BMI CALCULATOR'),),
        ),
        body: display(),
      ),
    );
  }
}
class display extends StatelessWidget {

  //calculation
  double bmi_result = person_weight_value/pow(person_height_value/100, 2);
  //int bmi_result_int = (person_weight_value/pow(person_height_value/100, 2)).toInt();
  String BMI_result_1 = (person_weight_value/pow(person_height_value/100, 2)).toStringAsFixed(2);


  //for message display
  String recomendation = 'BMI IS AVERAGE';
  String status = 'NORMAL';
  Color color_status = Colors.green;


  String status_bmi(){
    if(bmi_result<18.5){
      status = 'Under - Weight';
      color_status = Colors.white;
    }
    else if(bmi_result>18.5 && bmi_result<25){
      status = 'NORMAL';
      color_status = Colors.greenAccent;
    }
    else{
      status = 'OVER - WEIGHT';
      color_status = Colors.red;
    }
    return status;
  }
  String recomendation_bmi(){
    if(bmi_result<18.5){
      recomendation = 'You are Unhealthy \n Try to eat Healthy Diet';
    }
    else if(bmi_result>18.5 && bmi_result<25){
      recomendation = 'CONGRATULATIONS !!!...You are Healthy Person';
    }
    else{
      recomendation = 'You Need to start Exercise and Daily Walk\nDrink QEHWA Frequently';
    }
    return recomendation;
  }







  //double result = BMI_result;





  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('Your Results',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
            Expanded(

                child: Container(
                  margin: EdgeInsets.all(50),

                  width: 390,
                  height: 20,

                  decoration: BoxDecoration(
                      color: Color(0xFF4C4F5E).withOpacity(0.8),

                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                      status_bmi(),style: TextStyle(
                        fontSize: 17,
                        color: color_status,
                      ),
                      ),
                      SizedBox(height: 100,),
                      Text(
                        '$BMI_result_1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                        ),
                      ),
                      SizedBox(height: 100,),
                      Text(
                        recomendation_bmi(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,

                        ),
                      )


                    ],
                  ),

                )),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: Offset(0,3),
                  )],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child :RawMaterialButton(
                  onPressed: (){
                    Audio.load('assets/button.wav')..play()..dispose();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
                 person_age_value = 26;
                 person_weight_value=60;
                 person_height_value=130;
                 select = 0;

                  },
                  //splashColor: Colors.cyanAccent,
                  highlightColor: Colors.cyanAccent,
                  fillColor: Colors.red,
                  constraints: BoxConstraints.tightFor(
                    width: 230,
                    height: 60,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('RE - CALCULATE',
                    style: TextStyle(fontSize: 20),),
                )),
            SizedBox(height: 20,),


          ],
        ),
      ),

    );
  }
}
