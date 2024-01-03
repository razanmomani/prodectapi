import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'controller_api.dart';
import 'model_api.dart';
class HomeScreen extends StatelessWidget {
  final ControllerApi controller = Get.put(ControllerApi());
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Data Page'),
      ),
      body: FutureBuilder<MyData>(
        future: controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.grey,
                duration: Duration(milliseconds: 400),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(snapshot.data!.data![index].avatar!),
                  ),
                  title: Text(snapshot.data!.data![index].firstName!),
                  subtitle: Text(snapshot.data!.data![index].email!),
                  trailing: Text(snapshot.data!.data![index].lastName!),
                );
              },
            );
          } else {
            return Container(); // Handle other states
          }
        },
      ),
    );
  }
}
