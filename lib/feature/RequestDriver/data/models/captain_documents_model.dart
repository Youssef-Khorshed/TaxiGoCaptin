import 'dart:io';

class CaptainDocumentsModel {
  File? profilePhoto;
  File? drivingLicenseFront;
  File? drivingLicenseBack;
  File? nationalIdFront;
  File? nationalIdBack;
  File? vehicleLicenseFront;
  File? vehicleLicenseBack;
  String? vehicleModel;
  String? vehicleColor;
  String? vehicleNumber;

  CaptainDocumentsModel({
    this.profilePhoto,
    this.drivingLicenseFront,
    this.drivingLicenseBack,
    this.nationalIdFront,
    this.nationalIdBack,
    this.vehicleLicenseFront,
    this.vehicleLicenseBack,
    this.vehicleModel,
    this.vehicleColor,
    this.vehicleNumber,
  });

  // Factory constructor for creating an instance from JSON
  factory CaptainDocumentsModel.fromJson(Map<String, dynamic> json) {
    return CaptainDocumentsModel(
      profilePhoto:
          json['profile_photo'] != null ? File(json['profile_photo']) : null,
      drivingLicenseFront: json['driving_license_front'] != null
          ? File(json['driving_license_front'])
          : null,
      drivingLicenseBack: json['driving_license_back'] != null
          ? File(json['driving_license_back'])
          : null,
      nationalIdFront: json['national_id_front'] != null
          ? File(json['national_id_front'])
          : null,
      nationalIdBack: json['national_id_back'] != null
          ? File(json['national_id_back'])
          : null,
      vehicleLicenseFront: json['vehicle_license_front'] != null
          ? File(json['vehicle_license_front'])
          : null,
      vehicleLicenseBack: json['vehicle_license_back'] != null
          ? File(json['vehicle_license_back'])
          : null,
      vehicleModel: json['vehicle_model'] as String?,
      vehicleColor: json['vehicle_color'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
    );
  }

  // Method to serialize the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'profile_photo': profilePhoto?.path,
      'driving_license_front': drivingLicenseFront?.path,
      'driving_license_back': drivingLicenseBack?.path,
      'national_id_front': nationalIdFront?.path,
      'national_id_back': nationalIdBack?.path,
      'vehicle_license_front': vehicleLicenseFront?.path,
      'vehicle_license_back': vehicleLicenseBack?.path,
      'vehicle_model': vehicleModel,
      'vehicle_color': vehicleColor,
      'vehicle_number': vehicleNumber,
    };
  }
}
