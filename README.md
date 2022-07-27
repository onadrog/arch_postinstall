# My sway custom config

## Do not use the bash script file it's still experimental need some real tests !!


`custom` directory goes into .config/nvim/lua/


### waybar

```

"custom/power": {
        "format": "",
       // "on-click": "swaynag -t warning -m 'Power Menu Options' -b 'Logout' 'swaymsg exit' -b 'Suspend' 'zzz' -b 'Restart' 'shutdown -r now' -b 'Shutdown'  'shutdown -h now'"
       "on-click": "swaypowerbtn" // => need to be commented since the program is still in dev !!
    }

```

