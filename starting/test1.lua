local lengthleg = 0.8
local bodywidth = 0.5
local bodyheight = 0.8
local massBody = 60
local massFoot = massBody/10 
 
--meshes
meshes = {
  UpperBody = {
    name = "UpperBody",
    dimensions = { 0.2, bodywidth, bodyheight},
    color = { 0.2, 0.2, 0.8},
    src = "meshes/unit_cube.obj",
  },
  Leg1 = {
    name = "Leg1",
    dimensions = { 0.2, 0.2, lengthleg},
    color = { 0.5, 0.8, 0.5},
    mesh_center = {0, 0, lengthleg/2.0},
    src = "meshes/unit_cube.obj",
  },
  Leg2={
    name = "Leg2",
    dimensions = {0.2,0.2,lengthleg},
    color = {0.5,0.8,0.5},
    mesh_center = {0, 0, lengthleg/2.0},
    src = "meshes/unit_cube.obj"
  },
}
--meshes

--joints
joints={
	revolute_z ={
		{0.0,0.0,1.0,0.0,0.0,0.0}
	},
	revolute_y = {
		{0.0,1.0,0.0,0.0,0.0,0.0}
	},
} --joints

--dynamics 
dynamics={
	body = {
		mass = massBody,
		com = {0, 0,0},
	},

	Foot= {
		mass = massFoot,
		com = {0,0, -lengthleg},
	},
}

--dynamics

--model
model = {
  configuration = {
    axis_front = { -1, 0, 0 },
    axis_up    = { 0, 0, 1 },
    axis_right = { 0, 1, 0 },
    rotation_order = { 2, 1, 0},
  },

  frames = {
    {
      name = "UpperBody",
      parent = "ROOT",
      joint_frame = {
        r = { 0, 0, 1.2 },
      },
      visuals = {
        meshes.UpperBody,
      },
      body = dynamics.body,
    },
    {
      name = "Leg_L",
      parent = "UpperBody",
      joint_frame = {
        r = { 0, -0.125,  -0.4},
      },
      visuals = {
        meshes.Leg1,
      },
      joint =joints.revolute_y,
     },
     {
      name = "Leg_R",
      parent = "UpperBody",
      joint_frame = {
        r = { 0, 0.125, -0.4},
      },
      visuals = {
        meshes.Leg2,
      },
      joint=joints.revolute_y,
     },
     {
	name ="Foot_L",
	parent = "Leg_L",
	joint_frame={
		r={0,0,lengthleg},
	},
	body= dynamics.Foot,
	},
   {
	name ="Foot_R",
	parent = "Leg_R",
	joint_frame={
		r={0,0,lengthleg},
	},
	body= dynamics.Foot,
	},
  }
} --model

return model
