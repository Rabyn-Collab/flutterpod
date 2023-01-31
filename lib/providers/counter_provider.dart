import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final countStateProvider = StateProvider<int>((ref) => 0);

final counterProvider = ChangeNotifierProvider((ref) => CounterProvider());

class CounterProvider extends ChangeNotifier{

  int number = 0;

  void add(){
    number++;
    notifyListeners();
  }

  void minus(){
    number--;
    notifyListeners();
  }

}



