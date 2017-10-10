import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

void initYoutubeFrame(Function onAPIReadyCallback) {
  if (onAPIReadyCallback != null)
    setProperty(
        window, 'onYouTubeIframeAPIReady', allowInterop(onAPIReadyCallback));
  final script = new ScriptElement();
  script.src = 'https://www.youtube.com/iframe_api';
  document.body.children.add(script);
}
