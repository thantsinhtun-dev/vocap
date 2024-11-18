enum Flavor {
  dev,
  prod,
}

class AppFlavour {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Vocap Dev';
      case Flavor.prod:
        return 'Vocap';
      default:
        return 'title';
    }
  }

}