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
execute if entity @s[nbt={Item:{id:"minecraft:netherrack"}}] \
    store result score @s necro_cut_roll_value run random value -1000..80

execute if entity @s[nbt={Item:{id:"minecraft:basalt"}}] \
    store result score @s necro_cut_roll_value run random value -940..20
    
execute if entity @s[nbt={Item:{id:"minecraft:blackstone"}}] \
    store result score @s necro_cut_roll_value run random value -900..20

execute if entity @s[nbt={Item:{id:"minecraft:smooth_basalt"}}] \
    store result score @s necro_cut_roll_value run random value -900..20

# Spawn yielded item based on the value we rolled above.
execute if score @s necro_cut_roll_value matches 0 run summon item ~ ~ ~ {Item:{id:"minecraft:netherite_scrap"}, Tags:["necro_cut_result"]}
execute if score @s necro_cut_roll_value matches 1..20 run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget", count:2}, Tags:["necro_cut_result"]}
execute if score @s necro_cut_roll_value matches 21..40 run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget", count:4}, Tags:["necro_cut_result"]}
execute if score @s necro_cut_roll_value matches 41..60 run summon item ~ ~ ~ {Item:{id:"minecraft:quartz"}, Tags:["necro_cut_result"]}
execute if score @s necro_cut_roll_value matches 61..80 run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget", count:6}, Tags:["necro_cut_result"]}

# Reduce material amount.
scoreboard players remove @s necro_cut_material_count 1

# Repeat until done.
execute if score @s necro_cut_material_count matches 1.. run function cobblestone_conversions:_cut_yield_nether