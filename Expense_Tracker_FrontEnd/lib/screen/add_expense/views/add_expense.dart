import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flex_color_picker/flex_color_picker.dart' show ColorPicker;
class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expensecontroller=TextEditingController();
  TextEditingController Categorycontroller=TextEditingController();
  TextEditingController datecontroller=TextEditingController();
  DateTime selectdate=DateTime.now();
  List<String> mycategoryicons=[
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];



  @override
  void initState() {
    datecontroller.text=DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
         appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.background,
         ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            const  Text(
               "Add Expense",
               style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold
               ),
             ),
            const  SizedBox(height: 16),
             SizedBox(
               width: MediaQuery.of(context).size.width * 0.7,
               child: TextFormField(
                 controller:expensecontroller ,
                 textAlignVertical: TextAlignVertical.center,
                 decoration: InputDecoration(
                   filled: true,
                   fillColor: Colors.white,
                   prefix: Icon(FontAwesomeIcons.dollarSign,size: 18,color: Colors.blueAccent,),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30),
                     borderSide: BorderSide.none
                   ),
                 ),
               ),
             ),
             SizedBox(height: 32),
             TextFormField(
              /* controller: Categorycontroller,*/
               textAlignVertical: TextAlignVertical.center,
               readOnly: true,
               decoration: InputDecoration(
                 isDense:true,
                 filled: true,
                 fillColor: Colors.white,
                 prefixIcon:const  Icon(FontAwesomeIcons.list,
                     size: 18,
                     color: Colors.blueAccent),
                 suffixIcon:  IconButton(
                   onPressed:(){
                     showDialog(
                         context: context,
                         builder: (ctx) {
                           bool isExpanded=false;
                           String iconsselected='';
                           late Color categorycolor=Colors.white;
                       return StatefulBuilder(
                         builder: (context,setState) {
                           return AlertDialog(
                             title: Text(
                                 "Create A Category"),
                             content: SizedBox(
                               height: MediaQuery.of(context).size.width,
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   const SizedBox(height: 16),
                                   TextFormField(
                                     textAlignVertical: TextAlignVertical.center,
                                     /* readOnly: true,*/
                                     decoration: InputDecoration(
                                       isDense: true,
                                       filled: true,
                                       fillColor: Colors.white,
                                       hintText: 'Name',
                                       border: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(
                                               12),
                                           borderSide: BorderSide.none
                                       ),
                                     ),
                                   ),
                                   const SizedBox(height: 16),
                                   TextFormField(
                                     onTap: () {
                                       setState(() {
                                         isExpanded = !isExpanded;
                                       });
                                     },
                                     textAlignVertical: TextAlignVertical.center,
                                     readOnly: true,
                                     decoration: InputDecoration(
                                       isDense: true,
                                       filled: true,
                                       suffixIcon: Icon(
                                         CupertinoIcons.chevron_down,
                                         size: 12,
                                       ),
                                       fillColor: Colors.white,
                                       hintText: 'Icon',
                                       border: OutlineInputBorder(
                                           borderRadius: isExpanded
                                           ? const BorderRadius.vertical(
                                               top: Radius.circular(12)
                                           ): BorderRadius.circular(12),
                                           borderSide: BorderSide.none
                                       ),
                                     ),
                                   ),
                                   isExpanded ?
                                   Container(
                                     width: MediaQuery.of(context).size.width,
                                     height: 200,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.vertical(
                                             bottom: Radius.circular(12)
                                         )
                                     ),
                                     child:
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: GridView.builder(
                                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                           crossAxisCount: 5,
                                           mainAxisSpacing: 5,
                                           crossAxisSpacing: 5
                                         ),
                                         itemCount: mycategoryicons.length,
                                           itemBuilder: (context,int i)
                                           {
                                             return GestureDetector(
                                               onTap: (){
                                                 setState(()
                                                 {
                                                   iconsselected=mycategoryicons[i];
                                                 }
                                                 );
                                               },
                                               child: Container(
                                                 width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 3,
                                                    color: iconsselected ==mycategoryicons[i]?
                                                        Colors.green:
                                                        Colors.grey
                                                  ),
                                                  borderRadius: BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/${mycategoryicons[i]}.png'
                                                    )
                                                  )
                                                ),
                                               ),
                                             );
                                       }
                                       ),
                                     ),
                                   ) : Container(),
                                   const SizedBox(height: 16),
                                   TextFormField(
                                     onTap: (){
                                       showDialog(context: context,
                                           builder:(ctx2)
                                       {
                                        return  AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ColorPicker(
                                                borderColor:categorycolor,
                                                 onColorChanged:(value){
                                                  setState((){
                                                    categorycolor=value;
                                                  },
                                                  );
                                                 },
                                               ),
                                              SizedBox(width: 500,
                                              height: 50,
                                                  child: TextButton(
                                                    onPressed: (){
                                                      Navigator.pop(ctx2);
                                                    },
                                                    style: TextButton.styleFrom(
                                                        backgroundColor: Colors.greenAccent,
                                                        shape:RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12),
                                                        )
                                                    ),
                                                    child: const Text(
                                                      "Save",
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                              )
                                            ],
                                          ),
                                        );
                                       });
                                     },
                                     textAlignVertical: TextAlignVertical.center,
                                     readOnly: true,
                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: categorycolor,
                                       hintText: 'Colour',
                                       border: OutlineInputBorder(
                                           borderRadius: BorderRadius.circular(
                                               12),
                                           borderSide: BorderSide.none
                                       ),
                                     ),
                                   ),
                                   const SizedBox(height: 32),
                                   SizedBox(
                                     width: double.infinity,
                                     height: kToolbarHeight,
                                     child: TextButton(onPressed: (){

                                       Navigator.pop(context);
                                     },
                                       style: TextButton.styleFrom(
                                           backgroundColor: Colors.greenAccent,
                                           shape:RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(12),
                                           )
                                       ),
                                       child: const Text(
                                         "Save",
                                         style: TextStyle(
                                           fontSize: 22,
                                           color: Colors.black,
                                         ),
                                       ),
                                     ),
                                   )

                                 ],
                               ),
                             ),
                           );
                         },
                       );
                     }
                     );
                   },
                   icon:Icon(
                       FontAwesomeIcons.plus,
                       size: 18,
                       color: Colors.blueAccent),
                  ),
                 hintText: 'Category',
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide.none
                 ),
               ),
             ),
             SizedBox(height: 16),
             TextFormField(
               controller: datecontroller,
               textAlignVertical: TextAlignVertical.center,
               readOnly: true,
               onTap: ()async{
                DateTime?newDate =await showDatePicker(
                     context: context,
                     initialDate: selectdate,
                     firstDate: DateTime.now(),
                     lastDate: DateTime.now().add(Duration (days: 365))
                );
                if(newDate!=null)
                  {
                    setState(() {
                      datecontroller.text =DateFormat('dd/MM/yyyy').format(newDate);
                      selectdate=newDate;
                    });
                  }
               },
               decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white,
                 prefix: Icon(FontAwesomeIcons.calendar,size: 18,color: Colors.blueAccent),
                 hintText: 'Date',
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(12),
                     borderSide: BorderSide.none
                 ),
               ),
             ),
             SizedBox(height: 32),
             SizedBox(
               width: double.infinity,
               height: kToolbarHeight,
               child: TextButton(onPressed: (){},
                 style: TextButton.styleFrom(
                     backgroundColor: Colors.greenAccent,
                     shape:RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     )
                 ),
                   child: const Text(
                       "Save",
                     style: TextStyle(
                       fontSize: 22,
                       color: Colors.black,
                     ),
                   ),
               ),
             )
           ],
         ),
       )
      ),
    );
  }
}
