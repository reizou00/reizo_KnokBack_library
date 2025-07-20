
# とりま0 0 0ってわかるようにする。
execute \
positioned 0.0 0.0 0.0 run particle wax_on

# AECがいるところをわかりやすく。
execute as @e[tag=reizo_KnokBack_lib.AEC] at @s run \
particle electric_spark
#

# TODO:軌道が分かるように、移動中のEntityにモヤっとしたり少し長く残るparticleを追従させとけ。