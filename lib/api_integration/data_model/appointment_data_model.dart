class NewAppointmentType {
  final int id;
  final int version;
  final String retailerId;
  final int createdDate;
  final String createdByUser;
  final int? modifiedDate;
  final String? modifiedByUser;
  final int? modifiedDateAfter;
  final List<String>? retailerIds;
  final String? tokenRetailerId;
  final String description;
  final String? onlineDescription;
  final String color;
  final int duration;
  final bool bookOnline;
  final String status;
  final bool requirePaymentInfoForBooking;
  final int? bookingItemId;
  final int? cancelItemId;
  final bool allowBookingOnWaitlist;
  final int? timeZoneId;

  final bool cipIsSetup;
  final bool stripeIsSetup;
  final bool fullsteamIsSetup;
  final String? currency;

  NewAppointmentType({
    required this.id,
    required this.version,
    required this.retailerId,
    required this.createdDate,
    required this.createdByUser,
    this.modifiedDate,
    this.modifiedByUser,
    this.modifiedDateAfter,
    this.retailerIds,
    this.tokenRetailerId,
    required this.description,
    this.onlineDescription,
    required this.color,
    required this.duration,
    required this.bookOnline,
    required this.status,
    required this.requirePaymentInfoForBooking,
    this.bookingItemId,
    this.cancelItemId,
    required this.allowBookingOnWaitlist,
    this.timeZoneId,
    required this.cipIsSetup,
    required this.stripeIsSetup,
    required this.fullsteamIsSetup,
    this.currency,
  });

  factory NewAppointmentType.fromJson(Map<String, dynamic> json) {
    return NewAppointmentType(
      id: json['id'],
      version: json['version'],
      retailerId: json['retailerId'],
      createdDate: json['createdDate'],
      createdByUser: json['createdByUser'],
      modifiedDate: json['modifiedDate'],
      modifiedByUser: json['modifiedByUser'],
      modifiedDateAfter: json['modifiedDateAfter'],
      retailerIds: json['retailerIds'] != null
          ? List<String>.from(json['retailerIds'])
          : null,
      tokenRetailerId: json['tokenRetailerId'],
      description: json['description'],
      onlineDescription: json['onlineDescription'],
      color: json['color'],
      duration: json['duration'],
      bookOnline: json['bookOnline'],
      status: json['status'],
      requirePaymentInfoForBooking: json['requirePaymentInfoForBooking'],
      bookingItemId: json['bookingItemId'],
      cancelItemId: json['cancelItemId'],
      allowBookingOnWaitlist: json['allowBookingOnWaitlist'],
      timeZoneId: json['timeZoneId'],
      cipIsSetup: json['cipIsSetup'],
      stripeIsSetup: json['stripeIsSetup'],
      fullsteamIsSetup: json['fullsteamIsSetup'],
      currency: json['currency'],
    );
  }
}
