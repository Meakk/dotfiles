let colors = {};

colors.Bg = '{background.rgba}'.split(',');
colors.BgAlpha = [ colors.Bg[0], colors.Bg[1], colors.Bg[2], 0.8 ];
colors.BgAlphaHeavy = [ Math.floor(colors.Bg[0]*0.75), Math.floor(colors.Bg[1]*0.75), Math.floor(colors.Bg[2]*0.75), 0.6 ];
colors.BgAlphaHeavier = [ Math.floor(colors.Bg[0]*0.5), Math.floor(colors.Bg[1]*0.5), Math.floor(colors.Bg[2]*0.5), 0.2 ];

/*

  --colorBg: #1f1f1f;
  --colorBgAlpha: rgba(31,31,31,0.8);
  --colorBgAlphaHeavy: rgba(24,24,24,0.6);
  --colorBgAlphaHeavier: rgba(16,16,16,0.2);
  --colorBgDark: #1b1b1b;
  --colorBgDarker: #141414;
  --colorBgLight: #252525;
  --colorBgLighter: #2a2a2a;
  --colorBgLightIntense: #252525;
  --colorBgIntense: #181818;
  --colorBgIntenser: #101010;
  --colorBgInverse: #232323;
  --colorBgInverser: #2a2a2a;
  --colorBgFaded: #2a2a2a;
  --colorFg: #c6c6c6;
  --colorFgAlpha: rgba(198,198,198,0.1);
  --colorFgIntense: #ececec;
  --colorFgFaded: #a1a1a1;
  --colorFgFadedMore: #7e7e7e;
  --colorHighlightBg: #ff8080;
  --colorHighlightBgAlpha: rgba(255,128,128,0.25);
  --colorHighlightBgDark: #e36869;
  --colorHighlightFg: #f6f6f6;
  --colorHighlightFgAlpha: rgba(246,246,246,0.5);
  --colorHighlightFgAlphaHeavy: rgba(246,246,246,0.25);
  --colorAccentBg: #8abeb7;
  --colorAccentBgAlpha: rgba(197,251,243,0.4);
  --colorAccentBgAlphaHeavy: rgba(197,251,243,0.25);
  --colorAccentBgDark: #77aaa4;
  --colorAccentBgDarker: #5b8e87;
  --colorAccentBgFaded: #98cdc6;
  --colorAccentBgFadedMore: #a2d7d0;
  --colorAccentBgFadedMost: #c5fbf3;
  --colorAccentBorder: #7eb2ab;
  --colorAccentBorderDark: #6b9e98;
  --colorAccentFg: #111111;
  --colorAccentFgFaded: #4e6864;
  --colorAccentFgAlpha: rgba(17,17,17,0.25);
  --colorBorder: #161616;
  --colorBorderHighlight: #d06b6b;
  --colorBorderDisabled: #1a1a1a;
  --colorBorderIntense: #000000;

*/

function inject() {{
  // remove header
  document.getElementById("header").remove();

  // remove new tab button
  document.getElementsByClassName("newtab")[0].remove();

  // override css vars
  for (c in colors)
    document.body.style.setProperty('--color' + c, 'rgba(' + colors[c].joint(',') + ')');

}};

// wait for browser to load
setTimeout(function wait() {{
  const tabs = document.getElementById('tabs-container');
  if (tabs) {{
    inject();
  }}
  else {{
    setTimeout(wait, 300);
  }}
}}, 300);
