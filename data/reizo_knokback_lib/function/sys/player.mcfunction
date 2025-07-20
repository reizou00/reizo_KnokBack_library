
#
    # Posをスコアに反映
        # X座標
        execute \
        store result score $KnokBackX reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[0] 100
        # Y座標
        execute \
        store result score $KnokBackY reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[1] 100
        # Z座標
        execute \
        store result score $KnokBackZ reizo_KnokBack_lib.Temp run \
        data get storage reizo_knokback_lib:_ Pos[2] 100
#> ベクトルを補正させる。(計算)
    # X座標
    scoreboard players operation $KnokBackX reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
    # Y座標
    scoreboard players operation $KnokBackY reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
    # Z座標
    scoreboard players operation $KnokBackZ reizo_KnokBack_lib.Temp *= $MotionPower reizo_KnokBack_lib.Temp
#> 補正計算は終了したので、値をmacroを使うためにstorageに移行、PlayerにP_Motionを実行。
    # X座標
    execute \
    store result storage reizo_knokback_lib:_ x int 1 run \
    scoreboard players get $KnokBackX reizo_KnokBack_lib.Temp
    # Y座標
    execute \
    store result storage reizo_knokback_lib:_ y int 1 run \
    scoreboard players get $KnokBackY reizo_KnokBack_lib.Temp
    # Z座標
    execute \
    store result storage reizo_knokback_lib:_ z int 1 run \
    scoreboard players get $KnokBackZ reizo_KnokBack_lib.Temp
    # 値をstorageに移行したので、macroを使ってP_Motionを使用
    function reizo_knokback_lib:bin/macros/set_p_motion with storage reizo_knokback_lib:_