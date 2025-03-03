# Initializes scoreboard for this datapack. Should be called before cobblestone_conversions:cut.

# Objective for keeping track of how many times yield should generate.
# Should not be used outside cobblestone_conversions:cut function.
scoreboard objectives add necro_cut_material_count dummy

# Objective for storing temporary value when determining yield from a stone.
# Should not be used outside cobblestone_conversions:cut function.
scoreboard objectives add necro_cut_roll_value dummy