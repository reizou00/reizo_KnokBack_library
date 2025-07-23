
# スコア作成
scoreboard objectives add reizo_KnokBack_lib.Temp dummy

#> フォースリロード！！！
    # 読み込む位置にAECを召喚
    execute \
    in minecraft:overworld run \
    summon area_effect_cloud 0.0 0.0 0.0 {Tags:["reizo_KnokBack_lib.OriginAEC"]}
    # AECを中心にフォースリロード
    execute \
    positioned as @e[tag=reizo_KnokBack_lib.OriginAEC] at @s run \
    forceload add ~ ~