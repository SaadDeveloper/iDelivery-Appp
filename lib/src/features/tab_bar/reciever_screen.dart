import 'package:flutter/material.dart';
import 'package:idelivery_app/src/utils/constants.dart';
import 'package:idelivery_app/src/utils/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({super.key});

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  TextEditingController _textController = TextEditingController();
  bool isFieldActivated = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                elevation: 5,
                enableDrag: true,
                builder: (context) {
                  return SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        //cancel button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(Icons.close),
                            )
                          ],
                        ),
                        Text('Please input your Tracking number recieved'),
                        SizedBox(height: 15),

                        //TextField
                        Container(
                          padding: EdgeInsets.all(5.5),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Tracking Number?',
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        //submit button
                        MaterialButton(onPressed: (){},
                        color: Colors.deepPurple,
                        child: Text('Proceed', style: TextStyle(color: Colors.white),),
                        minWidth: 300,
                        height: 52,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child:
                LocationButton(text: 'Tracking Button?', isIconRequired: false),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ImageTile(imageUrl: imageTile1),
                SizedBox(width: 10),
                ImageTile(imageUrl: imageTile2)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
