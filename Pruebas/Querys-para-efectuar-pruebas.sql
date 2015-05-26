--querys utiles para hacer pruebas
--q1: Datos completos de los usuarios(personas con usuario y rol asociado)
	select
	role.authority as Rol,
	u_r.user_id,
	user.username as Usuario,
	p_u.persona_id,
	p.nombre as Nombre,
	p.apellido as Apellido
	from user_role u_r
	inner join user
	on u_r.user_id= user.id
	inner join role
	on u_r.role_id=role.id
	inner join persona_user p_u
	on u_r.user_id = p_u.user_id
	inner join persona p
	on p_u.persona_id = p.id

	;
--q2: Usuarios sin rol asignado
	select
	u.id,
	u.username
	from user u
	left join user_role u_r
	on u.id=u_r.user_id
	where u_r.role_id is null
	;
--q3 : Personas sin usuarios asignados. Si username es NULL, indica que aunque está la asociacion de usuario y persona
--ese usuario se ha eliminado sin el borrado de la persona o la relación
	select
	p.nombre,
	p.apellido,
	p_u.user_id,
	p_u.persona_id as id_persona,
	u.username
	from persona p
	right join persona_user p_u
	on p.id=p_u.persona_id
	left join user u
	on p_u.user_id = u.id
	;

