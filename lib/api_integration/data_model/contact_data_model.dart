class Contact {
  final int id;
  final int version;
  final String retailerId;
  final int createdDate;
  final String createdByUser;
  final int? modifiedDate;
  final String? modifiedByUser;
  final String? retailerIds;
  final String? tokenRetailerId;
  final int typeId;
  final String firstName;
  final String lastName;
  final String? emailAddress;
  final String? homePhoneNumber;
  final String? workPhoneNumber;
  final String? mobilePhoneNumber;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? zip;
  final int? categoryId;
  final int? howHeardId;
  final int? preferredContactMethodId;
  final int? employeeId;
  final bool smsOptIn;
  final String status;
  final String? qbSyncStatus;
  final String? qbListId;
  final String? qbEditSequence;
  final String? paymentProfileToken;
  final String? paymentProfileTokenProvider;
  final String? paymentProfileMaskedAcctNumber;
  final String? paymentProfileExpiration;
  final String? paymentProfileCardType;
  final String? paymentProfileBillingName;
  final String? paymentProfileAddedBy;
  final String pin;
  final String? country;
  final int? mergedDate;
  final String? mergedByUser;
  final String? note;
  final String? event;
  final String? eventLocation;
  final String? budgetRange;
  final String? eventType;
  final String? measurements;
  final String? howHeard;
  final String? interview;
  final String? mergeOverview;
  final int? eventId;
  final int? appointmentRequestId;
  final int? waitListId;
  final int? eventDate;
  final String? contactIdString;
  final String? employeeName;
  final String? categoryDescription;
  final String? bestPhoneNumber;
  final int? bestPhoneNumberType;
  final int? numberOfMembers;
  final String? budget;
  final int? formalityId;
  final String? formality;
  final String? prefContactMethod;
  final int? eventTypeId;
  final String? eventTypeDescription;
  final int? timeOfDayId;
  final String? timeOfDay;
  final String? howHeardDescription;
  final String? eventDateString;
  final int? locationId;
  final String? locationDescription;
  final bool potentialDuplicate;
  final String? storeNickName;
  final int? eventHeadContactId;
  final String? purchaseHistoryHTML;
  final String? quoteHistoryHTML;
  final int? budgetRangeId;
  final String? budgetRangeDescription;
  final int? eventMemberTypeId;
  final String? eventMemberRoleDescription;
  final int? itemInterestId;
  final bool? vipFlag;
  final String? updateType;
  final int? updateRequestId;
  final List<dynamic>? itemInterestList;
  final List<dynamic>? appointments;
  final List<dynamic>? emailIds;
  final List<dynamic>? smsIds;
  final List<dynamic>? taskIds;
  final Map<String, dynamic>? customFields;
  final bool vip;

  Contact({
    required this.id,
    required this.version,
    required this.retailerId,
    required this.createdDate,
    required this.createdByUser,
    this.modifiedDate,
    this.modifiedByUser,
    this.retailerIds,
    this.tokenRetailerId,
    required this.typeId,
    required this.firstName,
    required this.lastName,
    this.emailAddress,
    this.homePhoneNumber,
    this.workPhoneNumber,
    this.mobilePhoneNumber,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zip,
    this.categoryId,
    this.howHeardId,
    this.preferredContactMethodId,
    required this.employeeId,
    required this.smsOptIn,
    required this.status,
    this.qbSyncStatus,
    this.qbListId,
    this.qbEditSequence,
    this.paymentProfileToken,
    this.paymentProfileTokenProvider,
    this.paymentProfileMaskedAcctNumber,
    this.paymentProfileExpiration,
    this.paymentProfileCardType,
    this.paymentProfileBillingName,
    this.paymentProfileAddedBy,
    required this.pin,
    this.country,
    this.mergedDate,
    this.mergedByUser,
    this.note,
    this.event,
    this.eventLocation,
    this.budgetRange,
    this.eventType,
    this.measurements,
    this.howHeard,
    this.interview,
    this.mergeOverview,
    this.eventId,
    this.appointmentRequestId,
    this.waitListId,
    this.eventDate,
    this.contactIdString,
    this.employeeName,
    this.categoryDescription,
    this.bestPhoneNumber,
    this.bestPhoneNumberType,
    this.numberOfMembers,
    this.budget,
    this.formalityId,
    this.formality,
    this.prefContactMethod,
    this.eventTypeId,
    this.eventTypeDescription,
    this.timeOfDayId,
    this.timeOfDay,
    this.howHeardDescription,
    this.eventDateString,
    this.locationId,
    this.locationDescription,
    required this.potentialDuplicate,
    this.storeNickName,
    this.eventHeadContactId,
    this.purchaseHistoryHTML,
    this.quoteHistoryHTML,
    this.budgetRangeId,
    this.budgetRangeDescription,
    this.eventMemberTypeId,
    this.eventMemberRoleDescription,
    this.itemInterestId,
    this.vipFlag,
    this.updateType,
    this.updateRequestId,
    this.itemInterestList,
    this.appointments,
    this.emailIds,
    this.smsIds,
    this.taskIds,
    this.customFields,
    required this.vip,
  });
  factory Contact.fromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'],
    version: json['version'],
    retailerId: json['retailerId'],
    createdDate: json['createdDate'],
    createdByUser: json['createdByUser'] ?? '',
    modifiedDate: json['modifiedDate'],
    modifiedByUser: json['modifiedByUser'],
    retailerIds: json['retailerIds'],
    tokenRetailerId: json['tokenRetailerId'],
    typeId: json['typeId'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    emailAddress: json['emailAddress'],
    homePhoneNumber: json['homePhoneNumber'],
    workPhoneNumber: json['workPhoneNumber'],
    mobilePhoneNumber: json['mobilePhoneNumber'],
    address1: json['address1'],
    address2: json['address2'],
    city: json['city'],
    state: json['state'],
    zip: json['zip'],
    categoryId: json['categoryId'],
    howHeardId: json['howHeardId'],
    preferredContactMethodId: json['preferredContactMethodId'],
  employeeId: json['employeeId'] as int?,

    smsOptIn: json['smsOptIn'] ?? false,
    status: json['status'],
    qbSyncStatus: json['qbSyncStatus'],
    qbListId: json['qbListId'],
    qbEditSequence: json['qbEditSequence'],
    paymentProfileToken: json['paymentProfileToken'],
    paymentProfileTokenProvider: json['paymentProfileTokenProvider'],
    paymentProfileMaskedAcctNumber: json['paymentProfileMaskedAcctNumber'],
    paymentProfileExpiration: json['paymentProfileExpiration'],
    paymentProfileCardType: json['paymentProfileCardType'],
    paymentProfileBillingName: json['paymentProfileBillingName'],
    paymentProfileAddedBy: json['paymentProfileAddedBy'],
    pin: json['pin'] ?? '',
    country: json['country'],
    mergedDate: json['mergedDate'],
    mergedByUser: json['mergedByUser'],
    note: json['note'],
    event: json['event'],
    eventLocation: json['eventLocation'],
    budgetRange: json['budgetRange'],
    eventType: json['eventType'],
    measurements: json['measurements'],
    howHeard: json['howHeard'],
    interview: json['interview'],
    mergeOverview: json['mergeOverview'],
    eventId: json['eventId'],
    appointmentRequestId: json['appointmentRequestId'],
    waitListId: json['waitListId'],
    eventDate: json['eventDate'],
    contactIdString: json['contactIdString'],
    employeeName: json['employeeName'],
    categoryDescription: json['categoryDescription'],
    bestPhoneNumber: json['bestPhoneNumber'],
    bestPhoneNumberType: json['bestPhoneNumberType'],
    numberOfMembers: json['numberOfMembers'],
    budget: json['budget'],
    formalityId: json['formalityId'],
    formality: json['formality'],
    prefContactMethod: json['prefContactMethod'],
    eventTypeId: json['eventTypeId'],
    eventTypeDescription: json['eventTypeDescription'],
    timeOfDayId: json['timeOfDayId'],
    timeOfDay: json['timeOfDay'],
    howHeardDescription: json['howHeardDescription'],
    eventDateString: json['eventDateString'],
    locationId: json['locationId'],
    locationDescription: json['locationDescription'],
    potentialDuplicate: json['potentialDuplicate'] ?? false,
    storeNickName: json['storeNickName'],
    eventHeadContactId: json['eventHeadContactId'],
    purchaseHistoryHTML: json['purchaseHistoryHTML'],
    quoteHistoryHTML: json['quoteHistoryHTML'],
    budgetRangeId: json['budgetRangeId'],
    budgetRangeDescription: json['budgetRangeDescription'],
    eventMemberTypeId: json['eventMemberTypeId'],
    eventMemberRoleDescription: json['eventMemberRoleDescription'],
    itemInterestId: json['itemInterestId'],
    vipFlag: json['vipFlag'],
    updateType: json['updateType'],
    updateRequestId: json['updateRequestId'],
    itemInterestList: json['itemInterestList'],
    appointments: json['appointments'],
    emailIds: json['emailIds'],
    smsIds: json['smsIds'],
    taskIds: json['taskIds'],
    customFields: json['custom_fields'],
    vip: json['vip'] ?? false,
  );
}
}