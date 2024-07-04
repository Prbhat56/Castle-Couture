class AppointmentResponse {
  final int id;
  final int version;
  final String retailerId;
  final int createdDate;
  final String createdByUser;
  final int? modifiedDate;
  final String? modifiedByUser;
  final int? modifiedDateAfter;
  final String? retailerIds;
  final String? tokenRetailerId;
  final int typeId;
  final int contactId;
  final int employeeId;
  final int fittingRoomId;
  final int startDateTime;
  final int endDateTime;
  final bool allDay;
  final int? duration;
  final String color;
  final String notes;
  final bool? confirmed;
  final bool? checkedIn;
  final String status;
  final int? cancellationTransactionId;
  final int? bookingTransactionId;
  final String contactEventDate;
  final String homePhoneNumber;
  final String mobilePhoneNumber;
  final String workPhoneNumber;
  final int? preferredContactMethodId;
  final String bestPhoneNumber;
  final int bestPhoneNumberType;
  final String? bestPhoneNumberTypeDescription;
  final int categoryId;
  final String? categoryDescription;
  final int? howHeardId;
  final String? howHeardDescription;
  final String? paymentProfileToken;
  final String? paymentProfileTokenProvider;
  final String? paymentProfileMaskedAcctNumber;
  final String? paymentProfileExpiration;
  final String? paymentProfileCardType;
  final String? paymentProfileBillingName;
  final String employeeName;
  final String typeDescription;
  final String? formattedStartDateTime;
  final String? formattedEndDateTime;
  final int? excludeEmployeeId;
  final int? contactInterviewId;
  final bool? hasInterview;
  final String? email;
  final String? formattedDuration;
  final String? fittingRoomDescription;
  final String? startDateTimeForView;
  final String? eventDateStr;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String zip;
  final String country;
  final bool emailOptIn;
  final bool smsOptIn;
  final bool specialEvent;
  final String? fittingRoomType;
  final String? transaction;
  final String? recentPayment;
  final String? appointmentType;
  final String? contact;
  final String? contactName;
  final String? employee;
  final int? createdDateAfter;
  final int? createdDateBefore;
  final List<String>? itemInterestList;
  final bool? resendConfirmations;
  final bool? reassignTasks;
  final String? streetSize;
  final int? budget;
  final int? budgetRangeId;
  final String? budgetRangeDescription;
  final List<dynamic>? customFields;
  final List<String>? createdByUsers;
  final bool? vip;

  AppointmentResponse({
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
    required this.typeId,
    required this.contactId,
    required this.employeeId,
    required this.fittingRoomId,
    required this.startDateTime,
    required this.endDateTime,
    required this.allDay,
    this.duration,
    required this.color,
    required this.notes,
    this.confirmed,
    this.checkedIn,
    required this.status,
    this.cancellationTransactionId,
    this.bookingTransactionId,
    required this.contactEventDate,
    required this.homePhoneNumber,
    required this.mobilePhoneNumber,
    required this.workPhoneNumber,
    this.preferredContactMethodId,
    required this.bestPhoneNumber,
    required this.bestPhoneNumberType,
    this.bestPhoneNumberTypeDescription,
    required this.categoryId,
    this.categoryDescription,
    this.howHeardId,
    this.howHeardDescription,
    this.paymentProfileToken,
    this.paymentProfileTokenProvider,
    this.paymentProfileMaskedAcctNumber,
    this.paymentProfileExpiration,
    this.paymentProfileCardType,
    this.paymentProfileBillingName,
    required this.employeeName,
    required this.typeDescription,
    this.formattedStartDateTime,
    this.formattedEndDateTime,
    this.excludeEmployeeId,
    this.contactInterviewId,
    this.hasInterview,
    this.email,
    this.formattedDuration,
    this.fittingRoomDescription,
    this.startDateTimeForView,
    this.eventDateStr,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.emailOptIn,
    required this.smsOptIn,
    required this.specialEvent,
    this.fittingRoomType,
    this.transaction,
    this.recentPayment,
    this.appointmentType,
    this.contact,
    this.contactName,
    this.employee,
    this.createdDateAfter,
    this.createdDateBefore,
    this.itemInterestList,
    this.resendConfirmations,
    this.reassignTasks,
    this.streetSize,
    this.budget,
    this.budgetRangeId,
    this.budgetRangeDescription,
    this.customFields,
    this.createdByUsers,
    this.vip,
  });

 factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
  return AppointmentResponse(
    id: json['id'],
    version: json['version'],
    retailerId: json['retailerId'],
    createdDate: json['createdDate'],
    createdByUser: json['createdByUser'] ?? '',
    modifiedDate: json['modifiedDate'],
    modifiedByUser: json['modifiedByUser'],
    modifiedDateAfter: json['modifiedDateAfter'],
    retailerIds: json['retailerIds'],
    tokenRetailerId: json['tokenRetailerId'],
    typeId: json['typeId'],
    contactId: json['contactId'],
    employeeId: json['employeeId'],
    fittingRoomId: json['fittingRoomId'],
    startDateTime: json['startDateTime'],
    endDateTime: json['endDateTime'],
    allDay: json['allDay'],
    duration: json['duration'],
    color: json['color'],
    notes: json['notes'],
    confirmed: json['confirmed'],
    checkedIn: json['checkedIn'],
    status: json['status'],
    cancellationTransactionId: json['cancellationTransactionId'],
    bookingTransactionId: json['bookingTransactionId'],
    contactEventDate: json['contactEventDate'],
    homePhoneNumber: json['homePhoneNumber'] ?? '',
    mobilePhoneNumber: json['mobilePhoneNumber'] ?? '',
    workPhoneNumber: json['workPhoneNumber'] ?? '',
    preferredContactMethodId: json['preferredContactMethodId'],
    bestPhoneNumber: json['bestPhoneNumber'] ?? '',
    bestPhoneNumberType: json['bestPhoneNumberType'],
    bestPhoneNumberTypeDescription: json['bestPhoneNumberTypeDescription'],
    categoryId: json['categoryId'],
    categoryDescription: json['categoryDescription'],
    howHeardId: json['howHeardId'],
    howHeardDescription: json['howHeardDescription'],
    paymentProfileToken: json['paymentProfileToken'],
    paymentProfileTokenProvider: json['paymentProfileTokenProvider'],
    paymentProfileMaskedAcctNumber: json['paymentProfileMaskedAcctNumber'],
    paymentProfileExpiration: json['paymentProfileExpiration'],
    paymentProfileCardType: json['paymentProfileCardType'],
    paymentProfileBillingName: json['paymentProfileBillingName'],
    employeeName: json['employeeName'],
    typeDescription: json['typeDescription'],
    formattedStartDateTime: json['formattedStartDateTime'],
    formattedEndDateTime: json['formattedEndDateTime'],
    excludeEmployeeId: json['excludeEmployeeId'],
    contactInterviewId: json['contactInterviewId'],
    hasInterview: json['hasInterview'],
    email: json['email'],
    formattedDuration: json['formattedDuration'],
    fittingRoomDescription: json['fittingRoomDescription'],
    startDateTimeForView: json['startDateTimeForView'],
    eventDateStr: json['eventDateStr'],
    address1: json['address1'],
    address2: json['address2'] ?? '',
    city: json['city'],
    state: json['state'],
    zip: json['zip'],
    country: json['country'],
    emailOptIn: json['emailOptIn'],
    smsOptIn: json['smsOptIn'],
    specialEvent: json['specialEvent'],
    fittingRoomType: json['fittingRoomType'],
    transaction: json['transaction'],
    recentPayment: json['recentPayment'],
    appointmentType: json['appointmentType'],
    contact: json['contact'],
    contactName: json['contactName'],
    employee: json['employee'],
    createdDateAfter: json['createdDateAfter'],
    createdDateBefore: json['createdDateBefore'],
    itemInterestList: json['itemInterestList'],
    resendConfirmations: json['resendConfirmations'],
    reassignTasks: json['reassignTasks'],
    streetSize: json['streetSize'],
    budget: json['budget'],
    budgetRangeId: json['budgetRangeId'],
    budgetRangeDescription: json['budgetRangeDescription'],
    customFields: json['customFields'],
    createdByUsers: json['createdByUsers'],
    vip: json['vip'],
  );
}

}
