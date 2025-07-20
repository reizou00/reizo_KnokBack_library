
#
execute \
unless data storage reizo_knokback_lib:_ Setting.DebugMode run \
data merge storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:false\
    }\
}

#
execute \
if data storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:false\
    }\
} run tellraw @s \
[\
    {\
    "text": "デバッグモードをONにしますか？"\
    },\
    {\
    "text": "\n[ハイ]",\
    "bold": true,\
    "clickEvent": \
        {\
        "action": "run_command",\
        "value": "/data merge storage reizo_knokback_lib:_ \
            {\
            Setting:\
                {\
                DebugMode:true\
                }\
            }"\
        },\
        "color": "green",\
        "hoverEvent": \
            {\
            "action": "show_text",\
            "contents": "クリックして変更！"\
            }\
    }\
]

execute \
if data storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:true\
    }\
} run tellraw @s \
[\
    {\
    "text": "デバッグモードをOFFにしますか？"\
    },\
    {\
    "text": "\n[ハイ]",\
    "bold": true,\
    "clickEvent": \
        {\
        "action": "run_command",\
        "value": "/data merge storage reizo_knokback_lib:_ \
            {\
            Setting:\
                {\
                DebugMode:false\
                }\
            }"\
        },\
        "color": "green",\
        "hoverEvent": \
            {\
            "action": "show_text",\
            "contents": "クリックして変更！"\
            }\
    }\
]