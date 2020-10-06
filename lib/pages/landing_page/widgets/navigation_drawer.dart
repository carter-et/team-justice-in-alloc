import 'package:allocation_app/model/navigation_model.dart';
import 'package:allocation_app/pages/landing_page/widgets/side_nav_tile.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  NavigationDrawerState createState() {
    return new NavigationDrawerState();
  }
}
class NavigationDrawerState extends State<NavigationDrawer> with SingleTickerProviderStateMixin{
  double maxWidth = 200.0;
  double minWidth = 70.0;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    ///Initiate the animation controller which will control the sidebar
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300), value: 70.0);
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, widget) => getWidget(context, widget),);
  }

  Widget getWidget(context, widget){

    return Material(
      elevation: 8.0,
      child: Container(
          width: widthAnimation.value,
          color: Colors.blueAccent,
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              SideNavTile(title: 'test@test.com', icon: Icons.person, aniController: _animationController,),
              Divider(color:Colors.white, height: 40.0, thickness: 2.0,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.blueAccent, height: 20.0);
                  },
                  itemBuilder: (context, index) {
                  return SideNavTile(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      isSelected: selectedIndex == index,
                      title: navItems[index].title,
                      icon: navItems[index].icon,
                      aniController: _animationController,
                  );
                },
                  itemCount: navItems.length,
                ),
              ),
              InkWell(
                onTap: (){
                  setState((){
                    isCollapsed = !isCollapsed;
                    isCollapsed ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
              SizedBox(height: 50.0,),
            ],
          )),
    );
  }
}