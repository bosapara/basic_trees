minetest.register_abm {
	nodenames = "basic_trees:oak_sapling",
	chance = 1,
	interval = 2,
	action = function(pos)
		if oak_growth(pos,1,1) and (not minetest.get_node_timer(pos):is_started()) then
		minetest.get_node_timer(pos):start(growth_time["oak"] * 1)
		end
	end
}
