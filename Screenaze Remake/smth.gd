extends StaticBody3D

func _ready(): 
	var gridmap = get_node("/root/level1/GridMap/")  # Replace with the path to your GridMap node
	
	var vertices = []
	var indices = []
	
	# Retrieve the grid data from the GridMap
	var grid_data = gridmap.get_used_cells()
	
	# Iterate over each grid cell
	for cell in grid_data:
		var grid_pos = gridmap.(cell)
		
		# Define the vertices of the triangle
		var v0 = grid_pos
		var v1 = grid_pos + Vector3(1, 0, 0)
		var v2 = grid_pos + Vector3(1, 0, 1)
		
		# Add the vertices to the vertices array
		vertices.append(v0)
		vertices.append(v1)
		vertices.append(v2)
		
		# Add the indices for the triangle
		indices.append(indices.size())
		indices.append(indices.size())
		indices.append(indices.size())
	
	# Set the triangle mesh shape
		var triangle_mesh_shape = TriangleMesh.new()
		triangle_mesh_shape.create_trimesh(vertices, indices)
	
		$CollisionShape.shape = triangle_mesh_shape
