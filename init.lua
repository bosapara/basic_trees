dofile(minetest.get_modpath("basic_trees") .. "/config.lua")


-- craft

dofile(minetest.get_modpath("basic_trees") .. "/craft.lua")

-- cypress stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/cypress/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/cypress/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/cypress/leaves.lua")


-- eucalyptus stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/eucalyptus/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/eucalyptus/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/eucalyptus/leaves.lua")


-- birch stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/birch/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/birch/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/birch/leaves.lua")

-- sequoia stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/sequoia/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/sequoia/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/sequoia/leaves.lua")

-- maple stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/maple/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/maple/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/maple/leaves.lua")

-- willow stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/willow/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/willow/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/willow/leaves.lua")

-- oak stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/oak/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/oak/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/oak/leaves.lua")

-- cedar stuff

dofile(minetest.get_modpath("basic_trees") .. "/trees/cedar/abms.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/cedar/functions.lua")
dofile(minetest.get_modpath("basic_trees") .. "/trees/cedar/leaves.lua")




-- Used to fix the leaves that not fall after tree chop

minetest.register_abm {
	nodenames = {"basic_trees:cypress_leaves",
"basic_trees:eucalyptus_leaves",
"basic_trees:willow_leaves",
"basic_trees:sequoia_leaves",
"basic_trees:birch_leaves",
"basic_trees:maple_leaves",
"basic_trees:oak_leaves",
"basic_trees:cedar_leaves"},
	chance = 4,
	interval = 4,
	action = function(pos)
		if minetest.find_node_near(pos, 4, {"group:tree"}) == nil then
			minetest.set_node(pos,{name = "air"})
		end
	end
}