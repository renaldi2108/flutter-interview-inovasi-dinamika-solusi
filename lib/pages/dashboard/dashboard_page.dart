part of '../../main.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Obx(() {
        switch(userController.requestState.value) {
          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
            return RefreshIndicator(
              onRefresh: () => userController.fetchUsers(),
              child: ListView.builder(
                itemCount: userController.userList.length,
                itemBuilder: (context, index) {
                  final product = userController.userList[index];
                  return ListTile(title: Text(product.name));
                },
              ),
            );
          case RequestState.failed:
            return Center(child: Text(userController.error.value));
          default:
            return Container();
        }
      }),
    );
  }
}
