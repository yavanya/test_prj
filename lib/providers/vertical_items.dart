import 'base_items_provider.dart';

class VerticalItemsProvider extends BaseItemsProvider {
  @override
  String generateItemAt(int index) => 'Horizontal item $index';
}
