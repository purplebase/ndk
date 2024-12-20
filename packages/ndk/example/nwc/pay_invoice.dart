// ignore_for_file: avoid_print

import 'dart:io';

import 'package:ndk/ndk.dart';

void main() async {
  // We use an empty bootstrap relay list,
  // since NWC will provide the relay we connect to so we don't need default relays
  final ndk = Ndk.emptyBootstrapRelaysConfig();

  // You need an NWC_URI env var or to replace with your NWC uri connection
  final nwcUri = Platform.environment['NWC_URI']!;
  final connection = await ndk.nwc.connect(nwcUri);

  // use an INVOICE env var or replace with your bolt11 invoice
  final invoice = Platform.environment['INVOICE']!;

  final payInvoice = await ndk.nwc.payInvoice(connection, invoice: invoice);

  print("preimage: ${payInvoice.preimage}");

  await ndk.destroy();
}
