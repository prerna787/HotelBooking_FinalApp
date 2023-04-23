import 'package:booking_app/data/local_storage.dart';
import 'package:booking_app/presentation/components/routes/routes_generator.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheNetwork.cacheInitialization();
  await CacheNetwork.deleteCacheItem(key: 'token');
  String? token = await CacheNetwork.getCacheData(key: 'token')  ;
  String? username = await CacheNetwork.getCacheData(key: 'username')  ;
  debugPrint("token is : $token");
  debugPrint("token is : $username");
  runApp(MyApp(
    //Todo pass boolean that tell about token presence

    isTokenPresent:(token != null),

  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isTokenPresent}) : super(key: key);
  // TODO create Boolean to check Token is present
  final bool isTokenPresent;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      // home: isTokenPresent != null ? const MyHomePage(title: 'Booking app') : Dashboard());
      initialRoute:
      isTokenPresent  ?  '/dashboardScreen' : '/',// todo check based on token

       onGenerateRoute: RouteGenerator().generateRoute,);



  }
}
