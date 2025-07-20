
# とりま0 0 0ってわかるようにする。
execute \
positioned 0.0 0.0 0.0 run particle wax_on

# AECがいるところをわかりやすく。
execute as @e[tag=reizo_KnokBack_lib.AEC] at @s run \
particle electric_spark

# どう動くかをわかりやすく。
execute as @e[tag=KnokBack_Test] at @s run \
particle electric_spark ^ ^0.2 ^