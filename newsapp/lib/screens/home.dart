import 'package:flutter/material.dart';
import 'package:newsapp/const.dart';
import 'package:newsapp/custom_http.dart';
import 'package:newsapp/model/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String pageNo = '1';
  String sortBy = 'popularity';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News Today',
          style: myStyle(20, Colors.black),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                color: Colors.red,
              ),
              FutureBuilder<List<Articles>>(
                future: CustomHttp()
                    .fetchAllnewsData(pageNo: pageNo, sortBy: sortBy),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Something goes error");
                  } else if (snapshot.data == null) {
                    return Text('NO Data Found');
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            '${snapshot.data![index].urlToImage}',
                            height: 50,
                            width: 50,
                          ),
                          title: Text('${snapshot.data![index].title}'),
                          subtitle:
                              Text('${snapshot.data![index].description}'),
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
