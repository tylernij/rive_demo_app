import 'package:rive/rive.dart';

/// Get all view model instance values from a starting point.
Map<String, DataType> flattenViewModelProperties(
  ViewModelInstance viewModelInstance, {
  String prefix = '',
}) {
  final properties = viewModelInstance.properties;
  final flattenedProperties = <String, DataType>{};
  for (final property in properties) {
    if (property.type != DataType.viewModel) {
      final name = prefix + property.name;
      flattenedProperties[name] = property.type;
    } else {
      final name = property.name;
      final nestedVMI = viewModelInstance.viewModel(name)!;
      final nestedProperties = flattenViewModelProperties(
        nestedVMI,
        prefix: '$name/',
      );
      flattenedProperties.addAll(nestedProperties);
    }
  }
  return flattenedProperties;
}
