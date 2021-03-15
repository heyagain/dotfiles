#!/bin/bash

# 日期
print_date(){
     # date '+%Y年%m月%d日 %H:%M'
     # date '+%Y-%m-%d %H:%M'
     date '+%m-%d %H:%M'
}

# cpu温度

print_cpu_temperature(){
# 温度
   echo $[$(cat /sys/class/thermal/thermal_zone0/temp)/1000]°C
}

# 内存剩余信息 
print_mem(){
        memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
        echo -e "$memfree"
}

# 键盘
dwm_keyboard () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "⌨ %s" "$(setxkbmap -query | awk '/layout/{print $2}')"
    else
        printf "KEY %s" "$(setxkbmap -query | awk '/layout/{print $2}')"
    fi
    printf "%s\n" "$SEP2"
}

# 音量
dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "MUTE"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "VOL %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "VOL %s%%" "$VOL"
        else
            printf "VOL %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}

# 天气
# Change the value of LOCATION to match your city
dwm_weather() {
    LOCATION=city

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "%s" "$(curl -s wttr.in/$LOCATION?format=1)"
    else
        printf "WEA %s" "$(curl -s wttr.in/$LOCATION?format=1 | grep -o "[0-9].*")"
    fi
    printf "%s\n" "$SEP2"
}

# 电池
dwm_battery () {
    acpi -b | awk '{ print $4 " " $5 }' | tr -d ','
}

# 网络
# dwm_network () {
#     CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
#     if [ "$CONNAME" = "" ]; then
#         CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
#     fi
#
#     PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
#     PUBLIC=$(curl -s https://ipinfo.io/ip)
#
#     printf "%s" "$SEP1"
#     if [ "$IDENTIFIER" = "unicode" ]; then
#         printf "网 %s %s | %s" "$CONNAME" "$PRIVATE" "$PUBLIC"
#     else
#         printf "NET %s %s | %s" "$CONNAME" "$PRIVATE" "$PUBLIC"
#     fi
#     printf "%s\n" "$SEP2"
# }


# 设置dwm状态栏
while true
do
    
    #xsetroot -name "[$(print_mem)M][$(dwm_alsa)][$( acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')][$(dwm_keyboard)][$(print_date)]"
    xsetroot -name "[$(print_mem)M][$(print_cpu_temperature)][$(dwm_alsa)][$(dwm_battery)][$(dwm_keyboard)][$(print_date)]"
   
    sleep 1s   

#   if acpi -a | grep off-line > /dev/null; then
#       xsetroot -name "Bat. $( acpi -b | awk '{ print $4 " " $5 }' | tr -d ',') | Vol. $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | $(date +"%Y-%m-%d %H:%M")"
#   else
#       xsetroot -name "Bat. $( acpi -b | awk '{ print $4 " " $5 }' | tr -d ',') | Vol. $(amixer get Master | tail -1 | awk '{ print $5}' | tr -d '[]') | $(date +"%Y-%m-%d %H:%M")"
#   fi
#   sleep 1s   
done &

