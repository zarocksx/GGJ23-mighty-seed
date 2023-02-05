extends CollisionPolygon2D

const displaywidth = 1920
const displayheight = 1080
var center = Vector2(rand_range(0, displaywidth), rand_range(0, displayheight))
var max_size = 1
var vectors: Array = []
var how_long = 0.0

func _ready():

    pass

func _process(delta):
    how_long += delta

    if how_long > 2.0:
        max_size = 100
        vectors = []

        for i in range(0, 5):
            vectors.append(Vector2(rand_range(center.x - max_size, center.x + max_size), rand_range(center.y - max_size, center.y + max_size)))

        vectors.sort_custom(self, "sort_clockwise")

        set_polygon(PoolVector2Array(vectors))
        how_long = 0
    pass

func sort_clockwise(a, b):
    return a.angle() < b.angle()