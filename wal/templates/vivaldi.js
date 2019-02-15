function hack() {{
  // remove header
  document.getElementById("header").remove();

  // remove new tab button
  document.getElementsByClassName("newtab")[0].remove();

}};

// wait for browser to load
setTimeout(function wait() {{
  const tabs = document.getElementById('tabs-container');
  if (tabs) {{
    hack();
  }}
  else {{
    setTimeout(wait, 300);
  }}
}}, 300);
