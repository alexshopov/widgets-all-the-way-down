extends Camera3D

@export
var gridmap: GridMap


func _physics_process(_delta: float) -> void:
    var space_state := get_world_3d().direct_space_state
    var mouse_pos := get_viewport().get_mouse_position()

    var origin := project_ray_origin(mouse_pos)
    var end = origin + project_ray_normal(mouse_pos) * 1000
    var query = PhysicsRayQueryParameters3D.create(origin, end)
    query.collide_with_areas = true

    var result := space_state.intersect_ray(query)
    if result:
        var collider = result.collider
        if collider is Extractor:
            if Input.is_action_just_pressed("left_click"):
                collider.handle_click()
        elif collider is Miniaturizer:
            if Input.is_action_just_pressed("left_click"):
                collider.push_or_pop()
        elif collider is GridMap:
            var cell := gridmap.local_to_map(result.position)
            # print(cell)

