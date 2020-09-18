import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import './components/horizontal_listview.dart';
import './components/products.dart';
import './pages/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {

    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('resource/images/slider/1.jpg'),
          AssetImage('resource/images/slider/2.jpg'),
          AssetImage('resource/images/slider/3.jpg'),
          AssetImage('resource/images/slider/4.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    
    return Scaffold( 
      appBar: AppBar(
        title: Text('Fashapp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){
              
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text('User'),
              accountEmail: Text('user@mail.com'),
              currentAccountPicture: Container(  
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("resource/images/users/user.jpg"),
                    ),
                ),
              ),
            ),
            InkWell(
                child: ListTile(
                title: Text('Home page'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),            
            ),
            InkWell(
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          image_carousel,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),

          //Horizontal list view begins here

         HorizontalList(),

         //padding widget
         Padding(
           padding: EdgeInsets.all(20.0),
           child: Text('Recent products'),
         ),

         //gride view
         Container(
           height: 320.0,
           child: Products(),
         ),

        ],
      ),
    );
  }
}
