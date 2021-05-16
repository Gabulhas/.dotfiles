import subprocess
import os
from qutebrowser.api import interceptor
import re
import yaml
import subprocess


c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

# Load autoconfig.yml
config.load_autoconfig()


"""
qutebrowser settings for video
for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def pipe_to_mpv(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (url.host() == "www.youtube.com"and url.path() == "/watch"and "v" in url.query()):
        subprocess.call(["mpv", "url.toString()"])

interceptor.register(pipe_to_mpv)
# }}}
# =================== Launch Qutebrowser from Dmenu ====== {{{

    # }}}
# ====================== xresources ======================= {{{
# taken from https://qutebrowser.org/doc/help/configuring.html



c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    '!d':       'https://duckduckgo.com/?ia=web&q={}',
    '!fb':      'https://www.facebook.com/s.php?q={}',
    '!gh':      'https://github.com/search?o=desc&q={}&s=stars',
    '!gi':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    '!yt':      'https://www.youtube.com/results?search_query={}'
}

def read_xresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props


xresources = read_xresources("*")

"""

config.set("colors.webpage.darkmode.enabled", True)
c.colors.statusbar.normal.bg = xresources["*.background"]
c.colors.statusbar.command.bg = xresources["*.background"]
c.colors.statusbar.command.fg = xresources["*.foreground"]
c.colors.statusbar.normal.fg = xresources["*.foreground"]
c.statusbar.show = "always"

c.colors.tabs.even.bg = xresources["*.background"]
c.colors.tabs.odd.bg = xresources["*.background"]
c.colors.tabs.even.fg = xresources["*.foreground"]
c.colors.tabs.odd.fg = xresources["*.foreground"]
c.colors.tabs.selected.even.bg = xresources["*.color8"]
c.colors.tabs.selected.odd.bg = xresources["*.color8"]
c.colors.hints.bg = xresources["*.background"]
c.colors.hints.fg = xresources["*.foreground"]
c.tabs.show = "multiple"

# change title format
c.tabs.title.format = "{audio}{current_title}"
# fonts
c.fonts.web.size.default = 20

c.colors.tabs.indicator.stop = xresources["*.color14"]
c.colors.completion.odd.bg = xresources["*.background"]
c.colors.completion.even.bg = xresources["*.background"]
c.colors.completion.fg = xresources["*.foreground"]
c.colors.completion.category.bg = xresources["*.background"]
c.colors.completion.category.fg = xresources["*.foreground"]
c.colors.completion.item.selected.bg = xresources["*.background"]
c.colors.completion.item.selected.fg = xresources["*.foreground"]

# If not in light theme
if xresources["*.background"] != "#ffffff":
    # c.qt.args = ['blink-settings=darkMode=4']
    # c.colors.webpage.prefers_color_scheme_dark = True
    c.colors.webpage.darkmode.enabled = True
    c.hints.border = "1px solid #FFFFFF"
"""
