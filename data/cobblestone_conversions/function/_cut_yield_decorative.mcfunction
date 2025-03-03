# Generates yield from minecraft:item at @s.
# This one is different from the others.
# Instead of rolling, it converts 100% one decorative stone into another.
# It circles granite -> diorite -> andesite.


# Spawn next type of stone. Tag "necro_cut_yield_result_item" is used to find that item later.
execute if entity @s[nbt={Item:{id:"minecraft:granite"}}] \
    run summon item ~ ~ ~ {Item:{id:"minecraft:diorite"}, Tags:["necro_cut_yield_result_item"]}

execute if entity @s[nbt={Item:{id:"minecraft:diorite"}}] \
    run summon item ~ ~ ~ {Item:{id:"minecraft:andesite"}, Tags:["necro_cut_yield_result_item"]}
    
execute if entity @s[nbt={Item:{id:"minecraft:andesite"}}] \
    run summon item ~ ~ ~ {Item:{id:"minecraft:granite"}, Tags:["necro_cut_yield_result_item"]}


# Fix stack amount, no need for loop this way.
execute store result entity @n[tag=necro_cut_yield_result_item] Item.count int 1 run data get entity @s Item.count