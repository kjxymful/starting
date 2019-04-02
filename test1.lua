--meshes
meshes = {
  UpperBody = {
    name = "UpperBody",
    dimensions = { 0.2, 0.5, 0.8},
    color = { 0.2, 0.2, 0.8},
    src = "meshes/unit_cube.obj",
  },
  Leg1 = {
    name = "Leg1",
    dimensions = { 0.2, 0.2, 0.8},
    color = { 0.5, 0.8, 0.5},
    src = "meshes/unit_cube.obj",
  },
  Leg2={
    name = "Leg2",
    dimensions = {0.2,0.2,0.8},
    color = {0.5,0.8,0.5},
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
    },
    {
      name = "Leg_L",
      parent = "UpperBody",
      joint_frame = {
        r = { 0, -0.125,  -0.8},
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
        r = { 0, 0.125, -0.8},
      },
      visuals = {
        meshes.Leg2,
      },
     },
  }
} --model

return model
