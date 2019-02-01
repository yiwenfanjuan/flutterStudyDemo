/**
 * 一个典型的AppBar，带有标题，操作和溢出的下拉菜单
 * 另一个例子是创建一个tablayout 
 * */
import 'package:flutter/material.dart';


//创建一个通用的appBar
class NormalAppBar extends StatefulWidget{

  @override
    _NormalAppBarState createState() => _NormalAppBarState();
}

class _NormalAppBarState extends State<NormalAppBar>{

    Choice _selectedChoice = choices[0];
    void _select(Choice choice){
      setState(() {
              //设置选中的选项
              _selectedChoice = choice;
            });
    }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Basic AppBar"),
            actions: <Widget>[
              IconButton(
                icon: Icon(choices[0].icon),
                onPressed: (){
                  _select(choices[0]);
                },
              ),
              IconButton(
                icon: Icon(choices[1].icon),
                onPressed: (){
                  _select(choices[1]);
                },
              ),
              PopupMenuButton<Choice>(
                onSelected: _select,
                itemBuilder: (BuildContext context){
                  return choices.skip(2).map((Choice choice){
                    return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ChoiceCard(
              choice: _selectedChoice,
            ),
          ),
        ),
      );
    }
}

//创建一个tablayout
class TabbedAppBarSample extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        home: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Tabbed Appbar"),
              bottom: TabBar(
                isScrollable: true,
                tabs: choices.map((Choice choice){
                  return Tab(
                      text: choice.title,
                      icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: choices.map(
                (Choice choice){
                  return Center(
                      child: ChoiceCard(choice: choice,),
                  );
                }
              ).toList(),
            ),
          ),
        )
      );
    }
}


class Choice{
  final String title;
  final IconData icon;
  const Choice(this.title,this.icon);
}

const List<Choice> choices = const <Choice>[
  const Choice("Car", Icons.directions_car),
  const Choice("Bicycle",Icons.directions_bike),
  const Choice("Boat",Icons.directions_boat),
  const Choice("Bus", Icons.directions_bus),
  const Choice("Train",Icons.directions_railway),
  const Choice("Walk", Icons.directions_walk),

];

class ChoiceCard extends StatelessWidget{
  final Choice choice;
  const ChoiceCard({Key key,this.choice}):super(key: key);
  
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Card(
        color: Colors.white,
        elevation: 3.0,//阴影部分的大小
        
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                choice.icon,
                size: 128,
                color: Theme.of(context).textTheme.display1.color,
              ),
              Text(
                choice.title,
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ),
      );
    }
}



  