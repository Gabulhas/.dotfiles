import subprocess
import os
from qutebrowser.api import interceptor

"""
qutebrowser settings for video
for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)
# }}}
# =================== Launch Qutebrowser from Dmenu ====== {{{

    # }}}
# ====================== xresources ======================= {{{
# taken from https://qutebrowser.org/doc/help/configuring.html

def read_xresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props


xresources = read_xresources("*")


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

config.load_autoconfig()
