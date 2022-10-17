import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superclean/aplication/screens/first_page/first_page_vm.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  FirstPageViewModel firstPageViewModel = FirstPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<FirstPageViewModel>(
        create: (_) => firstPageViewModel..init(),
        child: Center(
          child: firstPageViewModel.selector<FirstPageViewModel, String>(
                  selector: () => firstPageViewModel.peremen,
                  builder: (ctx, _) {
              return TextButton(
                child: Text(firstPageViewModel.peremen),
                onPressed: () => firstPageViewModel.change(),
              );
            },
          ),
        ),
      ),
    );
  }
}
