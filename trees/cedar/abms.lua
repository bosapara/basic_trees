minetest.register_abm {
	nodenames = "basic_trees:cedar_sapling",
	chance = 1,
	interval = 2,
	action = function(pos)
		if cedar_growth(pos,1,1) and (not minetest.get_node_timer(pos):is_started()) then
		minetest.get_node_timer(pos):start(growth_time["cedar"] * 1)
		end
	end
}
