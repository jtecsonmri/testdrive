class WebViewArgs{
  String? initialUrl;
  String? defaultUrl; //Default URL after successful login - SSO only
  String? targetUrl; //HC Entry URL to redirect after successful login - SSO only
  WebViewArgs({this.initialUrl, this.defaultUrl, this.targetUrl});
}