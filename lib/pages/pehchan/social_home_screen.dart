import 'package:coep/pages/pehchan/add_socials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../services/itinerary_service.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  List<dynamic> result = [];
  bool loading = true;
  void createItenary() async {
    dynamic map = await ItineraryService().huhu();
    print(map.toString());
    setState(() {
      result = map['socials'];
      loading = false;
    });
  }

  chipList() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: <Widget>[
        _buildChip('Instagram', Color.fromARGB(255, 255, 199, 199)),
        _buildChip('Twitter', Color.fromARGB(255, 197, 252, 236)),
        _buildChip('Snapchat', Color.fromARGB(255, 193, 196, 243)),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    createItenary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                readOnly: true,
                autofocus: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddSocials()),
                  ).then((value) {
                    setState(() {});
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Add new socials',
                  focusColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '  My Socials',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.left,
              ),
              // chipList(),
              loading
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          LoadingAnimationWidget.discreteCircle(
                            size: 50,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Fetching profiles")
                        ],
                      ),
                    )
                  : SizedBox(
                      // height: 200,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: result.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.green),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 240, 240, 240)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        if (result[index]["website"] ==
                                            'instagram')
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              'assets/icons/create/instagram.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (result[index]["website"] ==
                                            'twitter')
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              'assets/icons/create/twitter.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        if (result[index]["website"] ==
                                            'snapchat')
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Image.asset(
                                              'assets/icons/create/snapchat.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          result[index]["username"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        Image.asset(
                                          'assets/icons/create/verified.png',
                                          fit: BoxFit.cover,
                                          width: 30,
                                          height: 30,
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () async {
                                            await ItineraryService()
                                                .delete(result[index]['_id']);
                                            setState(() {
                                              result.removeAt(index);
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}
