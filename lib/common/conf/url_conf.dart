import 'package:starcitizen_doctor/common/io/rs_http.dart';
import 'package:starcitizen_doctor/common/rust/http_package.dart';
import 'package:starcitizen_doctor/common/utils/log.dart';

class URLConf {
  /// HOME API
  static String gitApiHome = "https://web-proxy.scbox.xkeyc.cn/git";
  static String rssApiHome = "https://web-proxy.scbox.xkeyc.cn/rss";
  static const String analyticsApiHome =
      "https://web-proxy.scbox.xkeyc.cn/analytics/analytics";

  static bool isUrlCheckPass = false;

  /// URLS
  static String get giteaAttachmentsUrl => "$gitApiHome/SCToolBox/Release";

  static String get gitlabLocalizationUrl =>
      "$gitApiHome/SCToolBox/LocalizationData";

  static String get gitApiRSILauncherEnhanceUrl =>
      "$gitApiHome/SCToolBox/RSILauncherEnhance";

  static String get apiRepoPath => "$gitApiHome/SCToolBox/api/raw/branch/main";

  static String get gitlabApiPath => "$gitApiHome/api/v1/";

  static String get webTranslateHomeUrl =>
      "$gitApiHome/SCToolBox/ScWeb_Chinese_Translate/raw/branch/main/json/locales";

  static String get rssVideoUrl =>
      "$rssApiHome/bilibili/user/channel/27976358/290653";

  static String get rssTextUrl2 =>
      "$rssApiHome/baidu/tieba/user/%E7%81%AC%E7%81%ACG%E7%81%AC%E7%81%AC&";

  static const feedbackUrl = "https://txc.qq.com/products/614843";

  static String get devReleaseUrl => "$gitApiHome/SCToolBox/Release/releases";

  static Future<bool> checkHost() async {
    isUrlCheckPass = true;
    return isUrlCheckPass;
  }

  static Future<String?> getFasterUrl(List<String> urls) async {
    String firstUrl = "";
    int callLen = 0;

    void onCall(RustHttpResponse? response, String url) {
      callLen++;
      if (response != null && response.statusCode == 200 && firstUrl.isEmpty) {
        firstUrl = url;
      }
    }

    for (var value in urls) {
      RSHttp.head(value).then((resp) => onCall(resp, value), onError: (err) {
        callLen++;
        dPrint("RSHttp.head error $err");
      });
    }

    while (true) {
      await Future.delayed(const Duration(milliseconds: 16));
      if (firstUrl.isNotEmpty) {
        return firstUrl;
      }
      if (callLen == urls.length && firstUrl.isEmpty) {
        return null;
      }
    }
  }
}
