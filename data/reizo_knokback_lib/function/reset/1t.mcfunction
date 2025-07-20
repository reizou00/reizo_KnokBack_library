
# power系統は1tick遅れてリセットするためこのファイルに記述
scoreboard players reset $MotionPower reizo_KnokBack_lib.Temp

# 見るためにDebugModeがONなら1tick遅らせる。
execute if data storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:true\
    }\
} run \
function reizo_knokback_lib:debug/reset