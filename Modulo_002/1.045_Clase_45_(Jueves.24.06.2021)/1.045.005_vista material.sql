CREATE VIEW `v_material` AS
select nombreMaterial,
		tipoMezcla,
        clasificacion,
        tipoMaterial,
        abrasividad,
        densidad,
        fluidez,
        categoriaPeso
from material;