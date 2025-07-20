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
    rotated as @p[tag=reizo_KnokBack_lib.Attacker] run summon area_effect_cloud ^ ^ ^0.4 {Tags:["reizo_KnokBack_lib.AEC"]}
    # 召喚したAECのPosをstorageに格納。
    data modify storage reizo_knokback_lib:_ Pos set from entity @e\
    [\
    type=area_effect_cloud,\
    tag=reizo_KnokBack_lib.AEC,\
    sort=nearest,\
    limit=1\
    ] Pos
#> AECのPosを補正計算させるために、スコアに反映しなければならない。
    # Y軸での吹っ飛ばしは一定の高さなので、Pos[1](Y座標)を0.32に変更
    data modify storage reizo_knokback_lib:_ Pos[1] set value 0.32
    # Posをスコアに反映
        # X座標
        execute \
        store result score $KnokBackX reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[0] 1000
        # Y座標
        execute \
        store result score $KnokBackY reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[1] 1000
        # Z座標
        execute \
        store result score $KnokBackZ reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[2] 1000
#> ベクトルを補正させる。(計算)
    # X座標
    scoreboard players operation $KnokBackX reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
    # Y座標
    scoreboard players operation $KnokBackY reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
    # Z座標
    scoreboard players operation $KnokBackZ reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
#> 補正計算は終了したので、値をstorageに移行、EntityにMotionを実行。
#> 計算のために1000倍したのでそれを0.00001倍して元の値に戻す。
    # X座標
    execute \
    store result storage reizo_knokback_lib:_ Pos[0] double 0.00001 run \
    scoreboard players get $KnokBackX reizo_KnokBack_lib.Temp
    # Y座標
    execute \
    store result storage reizo_knokback_lib:_ Pos[1] double 0.00001 run \
    scoreboard players get $KnokBackY reizo_KnokBack_lib.Temp
    # Z座標
    execute \
    store result storage reizo_knokback_lib:_ Pos[2] double 0.00001 run \
    scoreboard players get $KnokBackZ reizo_KnokBack_lib.Temp
    # 値をstorageに移行したので、EntityにMotionを適用
    data modify entity @s Motion set from storage reizo_knokback_lib:_ Pos
#> 処理が終了したので値をすべてリセットする。
    # data remove storage reizo_knokback_lib:_ Pos
    scoreboard players reset $KnokBackX reizo_KnokBack_lib.Temp
    scoreboard players reset $KnokBackY reizo_KnokBack_lib.Temp
    scoreboard players reset $KnokBackZ reizo_KnokBack_lib.Temp
    # Power系統は1tickだけ遅らせてからリセットする。
    schedule function reizo_knokback_lib:reset 1t