Map<String, String> parseAddress(String address) {
  List<String> addressParts = address.split(' ');
  Map<String, String> parsedAddress = {};

  if (addressParts.isNotEmpty) {
    parsedAddress['city'] = addressParts.length > 5 ? addressParts[5] : '';
    parsedAddress['county'] = addressParts.length > 4 ? addressParts[4] : '';
    parsedAddress['state'] = addressParts.length > 3 ? addressParts[3] : '';
    parsedAddress['street_name'] =
        addressParts.length > 2 ? addressParts[2] : '';
    parsedAddress['street_number'] =
        addressParts.length > 1 ? addressParts[1] : '';
    parsedAddress['postal_code'] =
        addressParts.isNotEmpty ? addressParts[0] : '';
  }

  return parsedAddress;
}
