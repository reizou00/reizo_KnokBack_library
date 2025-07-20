
scoreboard players reset $DebugMotionPower
scoreboard players reset $DebugX
scoreboard players reset $DebugY
scoreboard players reset $DebugZ

#
scoreboard players operation $DebugMotionPower reizo_KnokBack_lib.Temp = $MotionPower reizo_KnokBack_lib.Temp
scoreboard players operation $DebugX reizo_KnokBack_lib.Temp = $KnokBackX reizo_KnokBack_lib.Temp
scoreboard players operation $DebugY reizo_KnokBack_lib.Temp = $KnokBackY reizo_KnokBack_lib.Temp
scoreboard players operation $DebugZ reizo_KnokBack_lib.Temp = $KnokBackZ reizo_KnokBack_lib.Temp

data modify storage reizo_knokback_lib:_ Debug.Pos set from storage reizo_knokback_lib:_ Pos