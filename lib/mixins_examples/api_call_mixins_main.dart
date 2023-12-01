import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/mixins_examples/controller.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class ApiCallUsingMixinStateScreen extends StatelessWidget {
  final ApiController apiController = Get.put(ApiController());

  Future<void> _refreshData() async {
    apiController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "API Call Example Using MixinState"),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: apiController.obx(
            (state) {
              if (state != null && state.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state[index]['first_name']),
                      subtitle: Text(state[index]['email']),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(state[index]['avatar']),
                      ),
                    );
                  },
                );
              } else if (state == null) {
                return const Text('An error occurred');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
