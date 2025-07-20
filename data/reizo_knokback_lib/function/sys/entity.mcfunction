
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