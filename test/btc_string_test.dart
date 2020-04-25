import 'package:btc_address_validate/btc_address_validate.dart';
import 'package:test/test.dart';

import 'package:btclipboard/btc_string.dart';

void main() {
  group('btcString mainnet', () {
    test('matches P2PKH', () {
      expect(btcString("1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2"), Network.mainnet);
    });

    test('matches P2SH', () {
      expect(btcString("3J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"), Network.mainnet);
    });

    test('matches bech32', () {
      expect(btcString("bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq"),
          Network.mainnet);
    });
  });
  group('btcString testnet', () {
    test('matches P2PKH', () {
      expect(btcString("mipcBbFg9gMiCh81Kj8tqqdgoZub1ZJRfn"), Network.testnet);
    });

    test('matches P2SH', () {
      expect(btcString("2MzQwSSnBHWHqSAqtTVQ6v47XtaisrJa1Vc"), Network.testnet);
    });

    test('matches bech32', () {
      expect(btcString("tb1qw508d6qejxtdg4y5r3zarvary0c5xw7kxpjzsx"),
          Network.testnet);
    });
  });
  group('SHA256', () {
    test('matches a block SHA256', () {
      expect(
          btcString(
              "0000000000000000000adff45b6a1664ae0c3fcc39573c233b620bdbaa55302a"),
          Network.mainnet);
    });
    test('matches a tx SHA256', () {
      expect(
          btcString(
              "7a637d3a2663d99f595e0ee4e2c95bedc8a3d88c206129d8419c2ccaa4ab0823"),
          Network.mainnet);
    });
  });
}
