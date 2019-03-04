let colors = {{}};

colors.Bg = '{background.rgba}'.split(',');
colors.BgAlpha = '{background.rgb}'.split(',').concat(0.8);
colors.BgAlphaHeavy = '{background.rgb}'.split(',').concat(0.6);
colors.BgAlphaHeavier = '{background.rgb}'.split(',').concat(0.2);
colors.BgDark = '{background.rgba}'.split(',');
colors.BgDarker = '{background.rgba}'.split(',');
colors.BgLight = '{background.rgba}'.split(',');
colors.BgLighter = '{background.rgba}'.split(',');
colors.BgLightIntense = '{background.rgba}'.split(',');
colors.BgIntense = '{background.rgba}'.split(',');
colors.BgIntenser = '{background.rgba}'.split(',');
colors.BgInverse = '{background.rgba}'.split(',');
colors.BgInverser = '{background.rgba}'.split(',');
colors.BgFaded = '{background.rgba}'.split(',');
colors.Fg = '{foreground.rgba}'.split(',');
colors.FgAlpha = '{foreground.rgb}'.split(',').concat(0.1);
colors.FgIntense = '{foreground.rgba}'.split(',');
colors.FgFaded = '{foreground.rgba}'.split(',');
colors.FgFadedMore = '{foreground.rgba}'.split(',');
colors.HighlightBg = '{color9.rgba}'.split(',');
colors.HighlightBgAlpha = '{color9.rgb}'.split(',').concat(0.25);
colors.HighlightBgDark = '{color1.rgba}'.split(',');
colors.HighlightFg = '{foreground.rgba}'.split(',');
colors.HighlightFgAlpha = '{foreground.rgb}'.split(',').concat(0.5);
colors.HighlightFgAlphaHeavy = '{foreground.rgb}'.split(',').concat(0.25);
colors.AccentBg = '{color4.rgba}'.split(',');
colors.AccentBgAlpha = '{color4.rgb}'.split(',').concat(0.4);
colors.AccentBgAlphaHeavy = '{color4.rgb}'.split(',').concat(0.25);
colors.AccentBgDark = '{color4.rgba}'.split(',');
colors.AccentBgDarker = '{color4.rgba}'.split(',');
colors.AccentBgFaded = '{color12.rgba}'.split(',');
colors.AccentBgFadedMore = '{color12.rgba}'.split(',');
colors.AccentBgFadedMost = '{color12.rgba}'.split(',');
colors.AccentBorder = '{color13.rgba}'.split(',');
colors.AccentBorderDark = '{color5.rgba}'.split(',');
colors.AccentFg = '{foreground.rgba}'.split(',');
colors.AccentFgFaded = '{foreground.rgba}'.split(',');
colors.AccentFgAlpha = '{foreground.rgb}'.split(',').concat(0.25);
colors.Border = '{color0.rgba}'.split(',');
colors.BorderHighlight = '{color0.rgba}'.split(',');
colors.BorderDisabled = '{color0.rgba}'.split(',');
colors.BorderIntense = '{background.rgba}'.split(',');

function inject() {{
  // remove header
  document.getElementById("header").style.display = 'none';

  // remove new tab button
  document.getElementsByClassName("newtab")[0].style.display = 'none';

  // get app
  let app = document.getElementById('app');

  // override css vars
  for (c in colors)
    app.style.setProperty('--color' + c, 'rgba(' + colors[c].join(',') + ') !important');
}};

// wait for browser to load
setTimeout(function wait() {{
  if (document.getElementsByClassName('newtab').length == 1) {{
    inject();
  }}
  else {{
    setTimeout(wait, 300);
  }}
}}, 300);
