
# DebugModeじゃないならすぐ実行
execute \
if data storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:false\
    }\
} run \
function reizo_knokback_lib:reset/no_debug

    # MotionPowerは1tickだけ遅らせてからリセットする。
    schedule function reizo_knokback_lib:reset/1t 1t