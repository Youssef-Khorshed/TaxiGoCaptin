import 'dart:io';
import 'package:dio/dio.dart';

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

  /// Factory constructor for creating an instance from a JSON map
  factory CaptainDocumentsModel.fromJson(Map<String, dynamic> json) {
    return CaptainDocumentsModel(
      profilePhoto: json['profile_photo'],
      drivingLicenseFront: json['driving_license_front'],
      drivingLicenseBack: json['driving_license_back'],
      nationalIdFront: json['national_id_front'],
      nationalIdBack: json['national_id_back'],
      vehicleLicenseFront: json['vehicle_license_front'],
      vehicleLicenseBack: json['vehicle_license_back'],
      vehicleModel: json['vehicle_model'] as String?,
      vehicleColor: json['vehicle_color'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
    );
  }

  /// Converts the model to a JSON map suitable for sending as a multipart request
  Map<String, dynamic> toJson() {
    return {
      if (profilePhoto != null)
        'profile_photo': MultipartFile.fromFileSync(
          profilePhoto!.path,
          filename: _getFileName(profilePhoto!),
        ),
      if (drivingLicenseFront != null)
        'driving_license_front': MultipartFile.fromFileSync(
          drivingLicenseFront!.path,
          filename: _getFileName(drivingLicenseFront!),
        ),
      if (drivingLicenseBack != null)
        'driving_license_back': MultipartFile.fromFileSync(
          drivingLicenseBack!.path,
          filename: _getFileName(drivingLicenseBack!),
        ),
      if (nationalIdFront != null)
        'national_id_front': MultipartFile.fromFileSync(
          nationalIdFront!.path,
          filename: _getFileName(nationalIdFront!),
        ),
      if (nationalIdBack != null)
        'national_id_back': MultipartFile.fromFileSync(
          nationalIdBack!.path,
          filename: _getFileName(nationalIdBack!),
        ),
      if (vehicleLicenseFront != null)
        'vehicle_license_front': MultipartFile.fromFileSync(
          vehicleLicenseFront!.path,
          filename: _getFileName(vehicleLicenseFront!),
        ),
      if (vehicleLicenseBack != null)
        'vehicle_license_back': MultipartFile.fromFileSync(
          vehicleLicenseBack!.path,
          filename: _getFileName(vehicleLicenseBack!),
        ),
      if (vehicleModel != null) 'vehicle_model': vehicleModel,
      if (vehicleColor != null) 'vehicle_color': vehicleColor,
      if (vehicleNumber != null) 'vehicle_number': vehicleNumber,
    };
  }

  /// Helper function to extract the file name from a File object
  String _getFileName(File file) {
    return file.path.split('/').last;
  }
}
