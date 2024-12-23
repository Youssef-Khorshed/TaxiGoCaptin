Future<Map<String, String>> parseAddress(String address) {
  List<String> addressParts = address.split(' ');
  Map<String, String> parsedAddress = {};
  if (addressParts.isNotEmpty) {
    parsedAddress['street_number'] = addressParts[0];
    parsedAddress['street_name'] =
        addressParts.sublist(1, addressParts.length - 5).join(' ');
    parsedAddress['city'] = addressParts[addressParts.length - 5];
    parsedAddress['county'] = addressParts[addressParts.length - 4];
    parsedAddress['state'] = addressParts[addressParts.length - 3];
    parsedAddress['country'] = addressParts[addressParts.length - 2];
    parsedAddress['postal_code'] = addressParts[addressParts.length - 1];
  }
  return Future.value(parsedAddress);
}
