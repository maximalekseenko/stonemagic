# Checks for stones to cut. Should be called every tick.
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣧⠀⠀⡀⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⢿⣿⣽⣿⡾⣿⣿⡿⠿⠻⠿⣿⣷⣿⠁⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⡿⣿⣾⡟⣾⢣⡄⠘⢸⣿⣿⣦⠀⢿⣧⢀⠀⠀⠘⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⡿⣿⣿⣿⣹⠇⢠⠘⡆⡰⢸⣿⣿⣿⣿⡄⠺⣿⠀⠀⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣾⣿⠭⣆⣿⠐⣄⡰⡑⣡⣸⣿⣿⣿⣏⠣⠂⡗⡅⠀⠈⡉⣿⣿⣿⣿
# ⣿⣿⣿⣿⡿⣿⣶⢸⡇⠰⠠⠂⠸⠆⢁⢻⠀⠀⠀⠀⡇⢁⡷⡅⠁⠀⠀⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣯⣿⣿⣟⢌⣁⠄⠄⡔⡄⠀⢙⣓⠶⣿⡇⢠⣟⠀⠀⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣏⣫⣿⣎⣿⡆⠰⢳⢹⣿⢣⠀⠀⣼⡟⠙⠀⠀⢀⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣽⣿⢟⣿⢷⣿⣿⣷⣦⣤⣶⣿⣿⣿⡀⠀⢀⣿⣶⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⡯⣿⣿⣟⢿⣿⣿⠻⢀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# With your strength you protect me,
# With my care I repair you,
# With sacred oil I appease you,
# Be quiet, good spirits,
# And accept my benediction.


execute as @e[type=item] at @s \ 
    unless entity @s[ \
        nbt=!{Item:{id:"minecraft:stone"}}, \
        nbt=!{Item:{id:"minecraft:cobblestone"}}, \
        nbt=!{Item:{id:"minecraft:deepslate"}}, \
        nbt=!{Item:{id:"minecraft:cobbled_deepslate"}}, \
        nbt=!{Item:{id:"minecraft:netherrack"}}, \
        nbt=!{Item:{id:"minecraft:basalt"}}, \
        nbt=!{Item:{id:"minecraft:blackstone"}}, \
        nbt=!{Item:{id:"minecraft:smooth_basalt"}}, \
        nbt=!{Item:{id:"minecraft:granite"}}, \
        nbt=!{Item:{id:"minecraft:diorite"}}, \
        nbt=!{Item:{id:"minecraft:andesite"}} \
    ] \
    unless entity @s[tag=necro_cut_yield_result_item] \
    if block ~ ~ ~ minecraft:stonecutter \
    run function cobblestone_conversions:cut