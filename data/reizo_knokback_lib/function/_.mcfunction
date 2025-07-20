#> reizo_KnokBack_lib:_
#
# ノックバックをコマンドで再現しているファイル。
#
# @input
#   score $xPower reizo_KnokBack_lib.Temp
#       飛ぶ勢いってあるよね。それを設定する値だぞ。絶対いるに決まってる。
#   score $yPower reizo_KnokBack_lib.Temp
#       ※同上
#   tag @p reizo_KnokBack_lib.Attacker
#       攻撃者は絶対にいるでしょ。
# @executor
#   攻撃を食らったEntity
# @within
#   PlayerCommand
#   reizo_knokback_lib:tags/_

#> $MotionPowerがnullなら値を100に設定。
execute \
unless score $MotionPower reizo_KnokBack_lib.Temp matches -2147483648..2147483647 run \
scoreboard players set $MotionPower reizo_KnokBack_lib.Temp 125

#> Pos取得用AEC召喚
    # AttackerのPosを取り、ぶっ飛ばす方向をとるために少し離れた位置に召喚。
    execute \
    positioned 0.0 0.0 0.0 \
    rotated as @n[tag=reizo_KnokBack_lib.Attacker,tag=!reizo_KnokBack_lib.Hit] run \
    summon area_effect_cloud ^ ^ ^0.4 \
    {\
    Tags:\
        [\
        "reizo_KnokBack_lib.AEC"\
        ]\
    }
    # 召喚したAECのPosをstorageに格納。
    data modify storage reizo_knokback_lib:_ Pos set from entity @e\
    [\
    type=area_effect_cloud,\
    tag=reizo_KnokBack_lib.AEC,\
    sort=nearest,\
    limit=1\
    ] Pos
#> AECのPosを補正計算させるために、スコアに反映しなければならない。ここでEntityとPlayerで分岐
    # Y軸での吹っ飛ばしは一定の高さなので、Pos[1](Y座標)を0.32に変更
    data modify storage reizo_knokback_lib:_ Pos[1] set value 0.32
    # Entity
    execute at @s[type=!player] run \
    function reizo_knokback_lib:sys/entity
    # Player
    execute at @s[type=player] run \
    function reizo_knokback_lib:sys/player
#> 処理が終了したので値をすべてリセットする。
    # data remove storage reizo_knokback_lib:_ Pos
    # scoreboard players reset $KnokBackX reizo_KnokBack_lib.Temp
    # scoreboard players reset $KnokBackY reizo_KnokBack_lib.Temp
    # scoreboard players reset $KnokBackZ reizo_KnokBack_lib.Temp
    # Power系統は1tickだけ遅らせてからリセットする。
    schedule function reizo_knokback_lib:reset 1t

# Debug用
execute if data storage reizo_knokback_lib:_ \
{\
Setting:\
    {\
    DebugMode:true\
    }\
} run \
function reizo_knokback_lib:debug/for_viewing