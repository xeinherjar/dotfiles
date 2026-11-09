-- Rex config migrated from tmux (~/.tmux.conf) and Ghostty (~/.config/ghostty/config).
-- Prefix in the source tmux config was ctrl+b.

-- Repeat mode: ctrl+b, then ctrl+r enters it; enter or escape leaves it.
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+b>ctrl+r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

-- Let programs that read ctrl+b themselves still receive it, since ctrl+b now
-- starts sequences.
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })

-- ~/.tmux.conf:5
rex.bind("ctrl+b>r", "client.config.reload")

-- ~/.tmux.conf:37
rex.bind("ctrl+b>shift+\\", "pane.split", { direction = "right" })
-- ~/.tmux.conf:38
rex.bind("ctrl+b>-", "pane.split", { direction = "down" })

-- ~/.tmux.conf:41
rex.bind("ctrl+b>h", "pane.focus", { direction = "left" })
-- ~/.tmux.conf:42
rex.bind("ctrl+b>j", "pane.focus", { direction = "down" })
-- ~/.tmux.conf:43
rex.bind("ctrl+b>k", "pane.focus", { direction = "up" })
-- ~/.tmux.conf:44
rex.bind("ctrl+b>l", "pane.focus", { direction = "right" })

-- ~/.tmux.conf:54
rex.bind("ctrl+b>shift+h", "pane.resize", { amount = 5, direction = "left" })
rex.bind("repeat/shift+h", "pane.resize", { amount = 5, direction = "left" })
-- ~/.tmux.conf:55
rex.bind("ctrl+b>shift+j", "pane.resize", { amount = 5, direction = "down" })
rex.bind("repeat/shift+j", "pane.resize", { amount = 5, direction = "down" })
-- ~/.tmux.conf:56
rex.bind("ctrl+b>shift+k", "pane.resize", { amount = 5, direction = "up" })
rex.bind("repeat/shift+k", "pane.resize", { amount = 5, direction = "up" })
-- ~/.tmux.conf:57
rex.bind("ctrl+b>shift+l", "pane.resize", { amount = 5, direction = "right" })
rex.bind("repeat/shift+l", "pane.resize", { amount = 5, direction = "right" })

-- Ghostty: no bindings migrated. Its one keybind (config:29) used the global:
-- prefix and the toggle_quick_terminal action, neither of which Rex has a
-- counterpart for.
