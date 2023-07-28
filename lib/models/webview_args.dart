class WebViewArgs{
  String? initialUrl;
  String? defaultUrl; //Default URL after successful login - SSO only
  String? targetUrl; //HC Entry URL to redirect after successful login - SSO only
  String? fragmentParams;
  WebViewArgs({this.initialUrl, this.defaultUrl, this.targetUrl, this.fragmentParams});

  factory WebViewArgs.fromJson(Map<String, dynamic> json) => WebViewArgs(
    initialUrl: json["initialUrl"],
    defaultUrl: json["defaultUrl"],
    targetUrl: json["targetUrl"],
    fragmentParams: json["fragmentParams"]
  );

  Map<String, dynamic> toJson() => {
    "initialUrl": initialUrl,
    "defaultUrl": defaultUrl,
    "targetUrl": targetUrl,
    "fragmentParams": fragmentParams
  };
}