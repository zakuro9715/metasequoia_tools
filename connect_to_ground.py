from functools import reduce
from statistics import mean
# 選択頂点（複数ある場合はその平均）が y = 0 になるように全体を移動

def v_to_tuple(v):
	p = v.getPos()
	return (p.x, p.y, p.z)

doc = MQSystem.getDocument()
objects = filter(lambda o: o != None, doc.object)
vertices = [v for o in objects for v in o.vertex]

pivots = map(v_to_tuple, filter(lambda v: v.select == 1, vertices))
pivot = list(map(mean, zip(*pivots)))

for v in vertices:
	p = v_to_tuple(v)
	v.setPos(MQSystem.newPoint(p[0], p[1] - pivot[1], p[2]))