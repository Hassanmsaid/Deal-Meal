import 'package:flutter/foundation.dart';

class FiltersData extends ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
}
