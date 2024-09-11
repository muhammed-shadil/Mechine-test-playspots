import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechine_test_playspots/controller/apicontroller/bloc/data_fetch_bloc.dart';
import 'package:mechine_test_playspots/model/user_model.dart';
import 'package:mechine_test_playspots/view/strory_view.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataFetchBloc()..add(Datafetch()),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  late List<Userdata> userdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text(
          "Whats up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: BlocBuilder<DataFetchBloc, DataFetchState>(
              builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FailedFetch) {
              return const Text("Error occuring when fetching data");
            } else if (state is ErrorFetch) {
              return Text(state.message);
            } else if (state is SuccessFetch) {
              userdata = state.userdata;
              return ListView.separated(
                itemCount: userdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StroryView(
                                    story: userdata[index].image!,
                                    name: userdata[index].profile!.name,
                                    profile: userdata[index].profile!.image,
                                  )));
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: const Color.fromARGB(255, 233, 228, 228),
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(userdata[index].profile!.name),
                      subtitle: Text(userdata[index].profile!.id.toString()),
                      leading: Container(
                        clipBehavior: Clip.antiAlias,
                        width: 50,
                        decoration: BoxDecoration(
                            border: userdata[index].readStatus == true
                                ? const Border()
                                : Border.all(color: Colors.green, width: 3),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    userdata[index].profile!.image))),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
