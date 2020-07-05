import 'package:api_test/provider_rest_api/rest_api/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProviderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Rest Api "),
      ),
      body: _listFuturePost(context),
    );
  }

  FutureBuilder _listFuturePost(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future: Provider.of<ApiService>(context, listen: false).getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Something wrond"),
              ),
            );
          }
          final tasks = snapshot.data;
          return _listTasks(context: context, tasks: tasks);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  ListView _listTasks({BuildContext context, List<PostModel> tasks}) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(tasks[index].title),
              ),
            ),
          );
        });
  }
}
