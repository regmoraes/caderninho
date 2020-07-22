enum OrderType { CASH, INSTALMENT, CONSIGN }

extension OrderTypeExtension on OrderType {
  String get name {
    switch (this) {
      case OrderType.CASH:
        return 'À vista';
      case OrderType.INSTALMENT:
        return 'Parcelada';
      case OrderType.CONSIGN:
        return 'Consignada';
      default:
        return null;
    }
  }
}
