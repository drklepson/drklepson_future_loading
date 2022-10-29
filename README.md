
# DrKlepson Flutter Loading Extension

Bu extension ile birlikte Future fonksiyonlarını çalıştırdığınız andan işlem tamamlanana kadar süren bir loading diyalog oluşturabilirsiniz.

-------------------
With this extension, you can create a loading dialog that lasts from the moment you run the Future functions until the process is complete.


## Testler

Testleri çalıştırmak için aşağıdaki komutu çalıştırın

```bash
import 'package:flutter/material.dart';
import 'package:drklepson_future_loading/drklepson_future_loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  Future<void> fetchString() async {
    return await Future.delayed(
      const Duration(seconds: 3),
      () => setState(() => count += 1),
    );
  }

  String? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Context Loading")),
      body: Center(
        child: ElevatedButton(
            onPressed: () => context.futureWithLoading(fetchString()),
            child: Text("Button $count")),
      ),
    );
  }
}

```

  
## Destek

Destek için drmaliaydogdu@gmail.com adresine e-posta gönderin.

  