class User {
  final String id;
  final int version;
  final String retailerId;
  final int createdDate;
  final String createdByUser;
  final String? modifiedDate;
  final String? modifiedByUser;
  final String? modifiedDateAfter;
  final List<String>? retailerIds;
  final String? tokenRetailerId;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String homePhoneNumber;
  final String? workPhoneNumber;
  final String? mobilePhoneNumber;
  final String? address1;
  final String? address2;
  final String city;
  final String state;
  final String zip;
  final String status;
  final String username;
  final String? password;
  final int roleId;
  final String? color;
  final bool appointmentsAllowed;
  final double? commissionPercent;
  final String? profileImageUrl;
  final double? monthlySalesGoals;
  final List<String>? employeeAppointmentTypes;
  final List<int>? employeeAppointmentTypeIds;
  final List<String>? scheduleEntries;
  final List<String>? timeOffEntries;
  final String? newPassword;
  final String? roleDescription;
  final String? role;
  final String? storeLocationDescription;
  final String? storeName;
  final bool passwordUpdated;
  final String? ssoAuthKey;
  final bool ssoSetup;
  final String? employeeFullName;
  final String? key;

  User({
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
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.homePhoneNumber,
    this.workPhoneNumber,
    this.mobilePhoneNumber,
    this.address1,
    this.address2,
    required this.city,
    required this.state,
    required this.zip,
    required this.status,
    required this.username,
    this.password,
    required this.roleId,
    this.color,
    required this.appointmentsAllowed,
    this.commissionPercent,
    this.profileImageUrl,
    this.monthlySalesGoals,
    this.employeeAppointmentTypes,
    this.employeeAppointmentTypeIds,
    this.scheduleEntries,
    this.timeOffEntries,
    this.newPassword,
    this.roleDescription,
    this.role,
    this.storeLocationDescription,
    this.storeName,
    required this.passwordUpdated,
    this.ssoAuthKey,
    required this.ssoSetup,
    this.employeeFullName,
    this.key,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      version: json['version'],
      retailerId: json['retailerId'],
      createdDate: json['createdDate'],
      createdByUser: json['createdByUser'],
      modifiedDate: json['modifiedDate'],
      modifiedByUser: json['modifiedByUser'],
      modifiedDateAfter: json['modifiedDateAfter'],
      retailerIds: json['retailerIds'] != null ? List<String>.from(json['retailerIds']) : null,
      tokenRetailerId: json['tokenRetailerId'],
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
      status: json['status'],
      username: json['username'],
      password: json['password'],
      roleId: json['roleId'],
      color: json['color'],
      appointmentsAllowed: json['appointmentsAllowed'],
      commissionPercent: json['commissionPercent'],
      profileImageUrl: json['profileImageUrl'],
      monthlySalesGoals: json['monthlySalesGoals'],
      employeeAppointmentTypes: json['employeeAppointmentTypes'] != null ? List<String>.from(json['employeeAppointmentTypes']) : null,
      employeeAppointmentTypeIds: json['employeeAppointmentTypeIds'] != null ? List<int>.from(json['employeeAppointmentTypeIds']) : null,
      scheduleEntries: json['scheduleEntries'] != null ? List<String>.from(json['scheduleEntries']) : null,
      timeOffEntries: json['timeOffEntries'] != null ? List<String>.from(json['timeOffEntries']) : null,
      newPassword: json['newPassword'],
      roleDescription: json['roleDescription'],
      role: json['role'],
      storeLocationDescription: json['storeLocationDescription'],
      storeName: json['storeName'],
      passwordUpdated: json['passwordUpdated'],
      ssoAuthKey: json['ssoAuthKey'],
      ssoSetup: json['ssoSetup'],
      employeeFullName: json['employeeFullName'],
      key: json['key'],
    );
  }
}
