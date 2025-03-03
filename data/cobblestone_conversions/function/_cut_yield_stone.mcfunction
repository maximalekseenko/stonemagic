# Generates yield from minecraft:item at @s.
# Slave function of cobblestone_conversions:cut and must not be called anywhere else.
#
# General rules when changing yield table:
# * when adding new stones to a table, don't forget to:
#     * include sone in three files: tick, cut and here;
#     * set roll range for a new stone:
#         * use negative numbers for min to represent "no result" results;
#         * you may limit what this stone may yield by setting it's max under yield min range;
# * when adding new yield:
#     * cry;


# Roll the dieses. Hash result in @s's "necro_cut_roll_value".
execute if entity @s[nbt={Item:{id:"minecraft:cobblestone"}}] \
    store result score @s necro_cut_roll_value run random value -800..132

execute if entity @s[nbt={Item:{id:"minecraft:stone"}}] \
    store result score @s necro_cut_roll_value run random value -600..132
    
execute if entity @s[nbt={Item:{id:"minecraft:cobbled_deepslate"}}] \
    store result score @s necro_cut_roll_value run random value -700..132

execute if entity @s[nbt={Item:{id:"minecraft:deepslate"}}] \
    store result score @s necro_cut_roll_value run random value -500..132
    
# Spawn yielded item based on the value we rolled above.
execute if score @s necro_cut_roll_value matches 1..40 run summon item ~ ~ ~ {Item:{id:"minecraft:coal"}}
execute if score @s necro_cut_roll_value matches 41..70 run summon item ~ ~ ~ {Item:{id:"minecraft:raw_copper", count:2}}
execute if score @s necro_cut_roll_value matches 71..90 run summon item ~ ~ ~ {Item:{id:"minecraft:raw_iron"}}
execute if score @s necro_cut_roll_value matches 91..100 run summon item ~ ~ ~ {Item:{id:"minecraft:raw_gold"}}
execute if score @s necro_cut_roll_value matches 101..110 run summon item ~ ~ ~ {Item:{id:"minecraft:lapis_lazuli"}}
execute if score @s necro_cut_roll_value matches 111..130 run summon item ~ ~ ~ {Item:{id:"minecraft:redstone", count:4}}
execute if score @s necro_cut_roll_value matches 131.. run summon item ~ ~ ~ {Item:{id:"minecraft:diamond"}}

# Reduce material amount.
scoreboard players remove @s necro_cut_material_count 1

# Repeat until done.
execute if score @s necro_cut_material_count matches 1.. run function cobblestone_conversions:_cut_yield_stone