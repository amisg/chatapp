import 'package:googleapis_auth/auth_io.dart';

class AccessFirebaseToken {
  static String fMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson({
        "type": "service_account",
        "project_id": "chat-app-3a510",
        "private_key_id": "2821bfd4a491710e52dc4a5b74026320694d99a9",
        "private_key":
            "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDVs/NH1S0/8ord\n9t+uIgqYHX11GaZegpvhysMPT+yna2D+hE4FU6Zz7Pssdqb836U72J7Yq1cLna19\nJ2j+/3P0nZSr0LZnAdnimqUxP954CnDqXJpU4QyNlmeDeiVEbL9OhnWU5k3Hbk84\nwEIMFj1ocSMpWgI17HV9lBhmhIMu2HGCw6ynQ4n7sk4xCkpBdgOhbn7Bu89O4n/o\noW9eCU8CmHYPJ8iHw15isWiq9lU37Fxs9jt6h+r2monQA8bNE+JA0O+C/TdIhHgT\nZaSgckn2w6yaeyfqWC8SMo7ZNhmoh3iSZN8d4eZLGGzJ2hIRb6+XuNdbXuWCsxRe\nJvD2V499AgMBAAECggEAG71XF/zw+bsHEZbpJBZhH6u8TEX/FYeIqn+CYGt0garr\nlT4hTom0MpoRZI0mUe7J6QHOZLug+e4Gxhcmhusr5xXJZaAa/TX9TW/bf5AV1akt\nTQ6mLdxkn8BlQWjKi54+GvhTLPfUIs4L1IcIS79bS0JcWRLI9Kzz91AQ9sW+rYbI\nHIJBgAYZKVQc9vqzVGaj5R/uM7Df9iQY+mO4PNdILjVpzMcinMOSVLh0FNMfYUpg\nkzgr0wTyG4U+ngbb2OnTfFjLRHoDaFkD5r0Ecig8pwSctjAcAKujYgrCoMPuqYBS\nrKj1qQbwkePfHO6SvChM90Rf5nH9KjN4u+6kkNKTdQKBgQD7OEeQFn3Y8PcVhj6f\n2CtbDPytMYrIOJS2JjanCcwZIH0wHjHuZa/mjJ/w5EFD/Qc09DyVJgmMuzJwNyfk\nwx/84E1xh995P+Zu8hObZtRSDtK5iacHnVdptasRGSU3RCQqBAAqV+WUDrUJVSse\niFjLWXyx0kMW143hgH9eiQBpRwKBgQDZxOvvt/7NYGW/sOocP+J/ik79x/OHQI1u\nUpnjmz4c1MmhicYc8TrTpAfA+9hcLc/h8GmC2Eb2m7kqgEnvtTiWBFSt4XBCrBGs\n0ArFRSb08wHmX2Baaq91WqjA9j8QZB4WhhlIpm4lAu18DC4p85ZFXaRDTYcwvEdy\nQmTmu7pjGwKBgQDBlj7fM9XKhPWCKq67clMGmN1lgRXW8HL4Yj4fPhd/DWAq4jnL\n4aRI3vipItuATs1s6wB8VpFpVx+pBXfCevJ9ZUOIRxHYV3t05ypgyD649R9BRmfm\nIEMp/IpUZLIfAm1zyx1tg8ov651qEa1mm98A5HaIeOSmB3kX2nNMH/qnJQKBgEBM\nCjVvKAZPjfs5KwZIPoHVvljj7p1ii9+k99biAUbV9OqDGUF2YB4Y8kkiktE0nYpi\nR2TgoqMxe0x3MF1cLmbsxGvKgjDNSTKzAlsYfdYY4di5FGPd2AxYRjci/Z/DT7bq\nxRBUQ3UeFixoFEFCsH2ulk9g1qenD5lGzS/rAa89AoGAGHXUdYg0EJo69bPWZAUK\nFjlFPj5TipIKoC/gJftQhLS76qbhGCnqI1Fp95iJrrxD3MXEHL1q/ZaNNafh2OZ0\njTqlSGLQ5RKNXsmk87QDRH0mrmSR6th2ygGXfXs46Z5EAk4mBzFMaPB3FPSGZ9P7\nWm4PkdsLsJSwmsyM1NncpYg=\n-----END PRIVATE KEY-----\n",
        "client_email":
            "firebase-adminsdk-fbsvc@chat-app-3a510.iam.gserviceaccount.com",
        "client_id": "109221838558578222147",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url":
            "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40chat-app-3a510.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com",
      }),
      [fMessagingScope],
    );

    final accessToken = client.credentials.accessToken.data;
    return accessToken;
  }
}
