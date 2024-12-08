class FeatureFlag {
  final String id;
  final dynamic feature;

  const FeatureFlag({
    required this.id,
    required this.feature,
  });

  static FeatureFlag fromArray(Map<String, dynamic> json, String id) {
    final featureFlags = (json['feature-flags'] as List);
    final flag = featureFlags.firstWhere(
      (flag) => flag['id'] == id,
    );
    return FeatureFlag(id: flag['id'], feature: flag['feature']);
  }

  @override
  String toString() {
    return 'FeatureFlag iD: $id, Feature: $feature';
  }
}
