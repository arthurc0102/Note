# Firefox 

> Firefox config and note

## Fix Firefox anime theme not working

Try this to fix this issue:

1. Open a new tab, and type “about:config” at the URL bar, then search for “lightweightthemes” with the filter.
2. Change the values of “lightweightThemes.persisted.footerURL” and “lightweightThemes.persisted.headerURL” from true to false( by double click on them).
3. After doing so, restart Firefox and you will see it works! You don’t have to install any add-on.

ref: <https://discourse.mozilla.org/t/animated-theme-quit-working/4470>
