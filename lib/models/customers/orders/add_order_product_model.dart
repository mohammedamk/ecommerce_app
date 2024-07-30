class OrderProduct {
  final int productId;
  final int adminId;
  final int quantity;

  OrderProduct({
    required this.productId,
    required this.adminId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'adminId': adminId,
      'quantity': quantity,
    };
  }
}
