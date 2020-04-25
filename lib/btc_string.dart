import 'package:btc_address_validate/btc_address_validate.dart';

Network btcString(String candidate) {
  RegExp exp = new RegExp(r"^[0-9a-f]{64}$");
  if (exp.hasMatch(candidate)) {
    return Network.mainnet;
  }
  try {
    var validated = validate(candidate);
    return validated.network;
  } catch (e) {
    return null;
  }
}
