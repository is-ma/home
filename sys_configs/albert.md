# Albert Launcher

## Installation
From official OBS repository (home:manuelschneid3r) for Debian 13.

```bash
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install -y albert libqalculate23 scrot picom
```

## Dependencies
- `picom` — compositor required for proper display in i3
- `libqalculate23` — calculator backend
- `scrot` — screenshot tool (X11)

## Config Files
- `targets/albert/albert.conf` → `~/.config/albert/albert.conf`
- `targets/albert/org.albert.websearch` → `~/.config/albert/org.albert.websearch`
- `targets/albert/python/plugins/*` → `~/.local/share/albert/python/plugins/`

## Plugins Enabled

### Built-in (official)
- `applications` — App launcher
- `calculator-qalculate` — Calculator (trigger: `=`)
- `files` — File search
- `firefox` — Firefox bookmarks (trigger: `f`)
- `clipboard` — Clipboard integration
- `websearch` — Web search with keywords
- `system` — System actions (shutdown, restart, lock)
- `commandline` — Run terminal commands
- `urlhandler` — Open URLs
- `python` — Python plugin support

### Third-party Python
- `emoji` — Emoji picker (trigger: `emoji`)
- `killproc` — Process killer (trigger: `kill`)
- `image_search` — Web image search (trigger: `img`)
- `firefox` — Firefox bookmarks + history (trigger: `f`)

## Web Search Keywords

| Keyword | Engine | URL |
|---------|--------|-----|
| `gg` | Google | `https://www.google.com/search?q=%s` |
| `wiki` | Wikipedia | `https://en.wikipedia.org/wiki/%s` |
| `yt` | YouTube | `https://www.youtube.com/results?search_query=%s` |
| `maps` | Google Maps | `https://maps.google.com/maps?q=%s` |
| `tr` | Google Translate | `https://translate.google.com/#auto|en|%s` |
| `gh` | GitHub | `https://github.com/search?q=%s` |
| `gmail` | Gmail | `https://mail.google.com/mail/ca/u/0/#apps/%s` |
| `image` | Google Images | `https://www.google.com/search?q=%s&tbm=isch` |
| `mm` | Mistral Chat | `https://chat.mistral.ai/chat?q=%s` |

Google is the default fallback (no keyword needed).

## i3 Integration
- Albert hotkey: `$mod+d` (replaces Rofi drun)
- Albert floating rule: `for_window [class="^Albert$"] floating enable, border none, focus`
- CopyQ hotkey: `$mod+c` (clipboard menu)

## Startup
```bash
exec --no-startup-id picom --daemon
exec --no-startup-id albert
exec --no-startup-id copyq
```

## Troubleshooting
- **Albert shows black box**: picom compositor not running. Run `picom --daemon`.
- **Plugins don't load**: Check `~/.local/share/albert/python/plugins/` has symlinks to `targets/albert/python/plugins/`.
- **Web search engines missing**: Verify `~/.config/albert/org.albert.websearch/engines.json` is symlinked.
- **Albert doesn't start**: Check `~/.local/share/albert/logs/`.
- **Firefox plugin not finding bookmarks**: Edit plugin settings to specify Firefox profile path.
