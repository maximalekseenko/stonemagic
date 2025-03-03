# Cuts a minecraft:item at @s. Yield wont happen if type is not specified. 
# @s Will be killed in this function.


# Play sound of cutting.
playsound minecraft:ui.stonecutter.take_result block @a ~ ~ ~

# Set how much times yield should be generated.
execute store result score @s necro_cut_material_count run data get entity @s Item.count

# Run correct yield function.
# -Normal stones
execute unless entity @s[ \
        nbt=!{Item:{id:"minecraft:stone"}}, \
        nbt=!{Item:{id:"minecraft:cobblestone"}}, \
        nbt=!{Item:{id:"minecraft:deepslate"}}, \
        nbt=!{Item:{id:"minecraft:cobbled_deepslate"}} \
    ] run function cobblestone_conversions:_cut_yield_stone

# -Nether rocks
execute unless entity @s[ \
        nbt=!{Item:{id:"minecraft:netherrack"}}, \
        nbt=!{Item:{id:"minecraft:basalt"}}, \
        nbt=!{Item:{id:"minecraft:blackstone"}}, \
        nbt=!{Item:{id:"minecraft:smooth_basalt"}} \
    ] run function cobblestone_conversions:_cut_yield_nether

# Decorative stones
execute unless entity @s[ \
        nbt=!{Item:{id:"minecraft:granite"}}, \
        nbt=!{Item:{id:"minecraft:diorite"}}, \
        nbt=!{Item:{id:"minecraft:andesite"}} \
    ] run function cobblestone_conversions:_cut_yield_decorative

# Kill stone item we have just cut.
kill @s