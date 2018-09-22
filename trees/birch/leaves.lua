default.register_fence("basic_trees:fence_birch", {
	description = "Birch Fence",
	texture = "birch_wood.png",
	inventory_image = "default_fence_overlay.png^birch_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	wield_image = "default_fence_overlay.png^birch_wood.png^default_fence_overlay.png^[makealpha:255,126,126",
	material = "basic_trees:birch_planks",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})



minetest.register_node("basic_trees:birch_leaves", {
  description = "Birch Leaves",
  drawtype = "allfaces_optional",
  waving = 1,
  tiles = { "birch_leaves.png" },
  special_tiles = {"birch_leaves.png"},
  paramtype = "light",
  is_ground_content = false,
  groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
  sounds = default.node_sound_leaves_defaults(),
  drop = {
    max_items = 1,
    items = {
      {items = {"basic_trees:birch_sapling"}, rarity = 50 },
      {items = {"basic_trees:birch_leaves"} }
    }
  },
})

minetest.register_node("basic_trees:birch_trunk", {
  description = "Birch Trunk",
  tiles = {
    "birch_trunk_top.png",
    "birch_trunk_top.png",
    "birch_trunk.png"
  },
  paramtype2 = "facedir",
  is_ground_content = true,
  groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
  on_place = minetest.rotate_node,
    sounds = default.node_sound_wood_defaults()
})

minetest.register_node("basic_trees:birch_planks", {
  description = "Birch Planks",
  tiles = {"birch_wood.png"},
  is_ground_content = true,
  groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
    sounds = default.node_sound_wood_defaults()
})


minetest.register_node("basic_trees:birch_sapling", {
	description = "Birch Tree Sapling",
	drawtype = "plantlike",
	tiles = {"birch_sapling.png"},
	inventory_image = "birch_sapling.png",
	wield_image = "birch_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 3,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),



	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"basic_trees:birch_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,
	
		on_timer = function(pos)
		birch_growth(pos,1,2)
	end,

	on_construct = function(pos)
		if birch_growth(pos,1,1) then
			minetest.get_node_timer(pos):start(growth_time["birch"] * 1)
		end
	end,
})





default.register_leafdecay({
	trunks = {"basic_trees:birch_trunk"},
	leaves = {"basic_trees:birch_leaves"},
	radius = 3,
})

