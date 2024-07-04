class Address {
  final int id;
  final int version;
  final String retailerId;
  final int createdDate;
  final String createdByUser;
  final int? modifiedDate;
  final String? modifiedByUser;
  final dynamic modifiedDateAfter;
  final dynamic retailerIds;
  final dynamic tokenRetailerId;
  final int contactId;
  final String? firstName;
  final String? lastName;
  final String address1;
  final String? address2;
  final String city;
  final String? state;
  final String zip;
  final String country;
  final dynamic transactionId;
  final String addressString;
  final dynamic addressHtml;
  final bool updateContactAddress;
  final dynamic contactIds;
  final dynamic addressIds;
  final bool transactionAddressInvalid;

  Address({
    required this.id,
    required this.version,
    required this.retailerId,
    required this.createdDate,
    required this.createdByUser,
    this.modifiedDate,
    this.modifiedByUser,
    required this.modifiedDateAfter,
    required this.retailerIds,
    required this.tokenRetailerId,
    required this.contactId,
    this.firstName,
    this.lastName,
    required this.address1,
    this.address2,
    required this.city,
    this.state,
    required this.zip,
    required this.country,
    this.transactionId,
    required this.addressString,
    this.addressHtml,
    required this.updateContactAddress,
    this.contactIds,
    this.addressIds,
    required this.transactionAddressInvalid,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      version: json['version'],
      retailerId: json['retailerId'],
      createdDate: json['createdDate'],
      createdByUser: json['createdByUser'],
      modifiedDate: json['modifiedDate'],
      modifiedByUser: json['modifiedByUser'],
      modifiedDateAfter: json['modifiedDateAfter'],
      retailerIds: json['retailerIds'],
      tokenRetailerId: json['tokenRetailerId'],
      contactId: json['contactId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
      transactionId: json['transactionId'],
      addressString: json['addressString'],
      addressHtml: json['addressHtml'],
      updateContactAddress: json['updateContactAddress'],
      contactIds: json['contactIds'],
      addressIds: json['addressIds'],
      transactionAddressInvalid: json['transactionAddressInvalid'],
    );
  }
}
