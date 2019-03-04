let colors = {{}};

colors.Bg = '{background.rgb}'.split(',').concat(1.0);
colors.BgAlpha = '{background.rgb}'.split(',').concat(0.8);
colors.BgAlphaHeavy = '{background.rgb}'.split(',').concat(0.6);
colors.BgAlphaHeavier = '{background.rgb}'.split(',').concat(0.2);
colors.BgDark = '{background.rgb}'.split(',').concat(1.0);
colors.BgDarker = '{background.rgb}'.split(',').concat(1.0);
colors.BgLight = '{background.rgb}'.split(',').concat(1.0);
colors.BgLighter = '{background.rgb}'.split(',').concat(1.0);
colors.BgLightIntense = '{background.rgb}'.split(',').concat(1.0);
colors.BgIntense = '{background.rgb}'.split(',').concat(1.0);
colors.BgIntenser = '{background.rgb}'.split(',').concat(1.0);
colors.BgInverse = '{background.rgb}'.split(',').concat(1.0);
colors.BgInverser = '{background.rgb}'.split(',').concat(1.0);
colors.BgFaded = '{background.rgb}'.split(',').concat(1.0);
colors.Fg = '{foreground.rgb}'.split(',').concat(1.0);
colors.FgAlpha = '{foreground.rgb}'.split(',').concat(0.1);
colors.FgIntense = '{foreground.rgb}'.split(',').concat(1.0);
colors.FgFaded = '{foreground.rgb}'.split(',').concat(1.0);
colors.FgFadedMore = '{foreground.rgb}'.split(',').concat(1.0);
colors.HighlightBg = '{color9.rgb}'.split(',').concat(1.0);
colors.HighlightBgAlpha = '{color9.rgb}'.split(',').concat(0.25);
colors.HighlightBgDark = '{color1.rgb}'.split(',').concat(1.0);
colors.HighlightFg = '{foreground.rgb}'.split(',').concat(1.0);
colors.HighlightFgAlpha = '{foreground.rgb}'.split(',').concat(0.5);
colors.HighlightFgAlphaHeavy = '{foreground.rgb}'.split(',').concat(0.25);
colors.AccentBg = '{color4.rgb}'.split(',').concat(1.0);
colors.AccentBgAlpha = '{color4.rgb}'.split(',').concat(0.4);
colors.AccentBgAlphaHeavy = '{color4.rgb}'.split(',').concat(0.25);
colors.AccentBgDark = '{color4.rgb}'.split(',').concat(1.0);
colors.AccentBgDarker = '{color4.rgb}'.split(',').concat(1.0);
colors.AccentBgFaded = '{color12.rgb}'.split(',').concat(1.0);
colors.AccentBgFadedMore = '{color12.rgb}'.split(',').concat(1.0);
colors.AccentBgFadedMost = '{color12.rgb}'.split(',').concat(1.0);
colors.AccentBorder = '{color13.rgb}'.split(',').concat(1.0);
colors.AccentBorderDark = '{color5.rgb}'.split(',').concat(1.0);
colors.AccentFg = '{foreground.rgb}'.split(',').concat(1.0);
colors.AccentFgFaded = '{foreground.rgb}'.split(',').concat(1.0);
colors.AccentFgAlpha = '{foreground.rgb}'.split(',').concat(0.25);
colors.Border = '{color0.rgb}'.split(',').concat(1.0);
colors.BorderHighlight = '{color0.rgb}'.split(',').concat(1.0);
colors.BorderDisabled = '{color0.rgb}'.split(',').concat(1.0);
colors.BorderIntense = '{background.rgb}'.split(',').concat(1.0);

function inject() {{
  // remove header
  document.getElementById("header").style.display = 'none';

  // remove new tab button
  document.getElementsByClassName("newtab")[0].style.display = 'none';

  // get app
  let app = document.getElementById('app');

  // override css vars
  for (c in colors)
    app.style.setProperty('--color' + c, 'rgb(' + colors[c].join(',') + ')');
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
