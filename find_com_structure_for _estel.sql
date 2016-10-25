select
sln.id,
sln.row,
sln.brand,
sln.universe_code,
sln.partner_code,
sln.id_eacademie,
sln.name,
sln.address, 
sln.open_date,
sln.law_name,
sln.phone,
sln.email,
sln.chain_name,


(Case when sln.com_mreg is Null or length(sln.com_mreg) = 0 Then
	(Case when
		(select slnr.com_mreg
		from salons as slnr
		where sln.city_name_geographic = slnr.city_name_geographic  and slnr.brand = 'MX'
		group by  slnr.city_name_geographic, slnr.com_mreg
		order by count(slnr.city_name_geographic) desc
		limit 1 ) <> '' then 
			(select slnr.com_mreg
			from salons as slnr
			where sln.city_name_geographic = slnr.city_name_geographic   and slnr.brand = 'MX'
			group by  slnr.city_name_geographic, slnr.com_mreg
			order by count(slnr.city_name_geographic) desc
			limit 1 ) Else
				(select slnr.com_mreg
				from salons as slnr
				where sln.region_name_geographic = slnr.region_name_geographic    and slnr.region_name_geographic is not Null and slnr.brand = 'MX'
				group by   slnr.region_name_geographic, slnr.com_mreg
				order by count(slnr.region_name_geographic) desc
				limit 1 )end)
 Else sln.com_mreg end) as com_mreg,
 

(Case when length(sln.com_reg) = 0 or sln.com_reg is Null Then
	(Case when
		(select slnr.com_reg
		from salons as slnr
		where sln.street =  slnr.street and sln.city_name_geographic = slnr.city_name_geographic   and slnr.brand = 'MX'
		group by  slnr.street, slnr.city_name_geographic, slnr.com_reg
		order by count(slnr.street) desc
		limit 1 ) <> '' then 
			(select slnr.com_reg
			from salons as slnr
			where sln.street =  slnr.street and sln.city_name_geographic = slnr.city_name_geographic  and slnr.brand = 'MX'  
			group by  slnr.street, slnr.city_name_geographic, slnr.com_reg
			order by count(slnr.street) desc
			limit 1 ) Else
				(select slnr.com_reg
				from salons as slnr
				where sln.city_name_geographic = slnr.city_name_geographic  and slnr.city_name_geographic is not Null  and slnr.brand = 'MX'
				group by   slnr.city_name_geographic, slnr.com_reg
				order by count(slnr.city_name_geographic) desc
				limit 1 )end)
 Else sln.com_reg end) as com_reg,

 (Case when length(sln.com_sect) = 0 or sln.com_sect is Null Then
	(Case when
		(select slnr.com_sect
		from salons as slnr
		where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and slnr.brand = 'MX'
		group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
		order by count(slnr.street) desc
		limit 1 ) <> '' then 
			(select slnr.com_sect
			from salons as slnr
			where sln.street =  slnr.street and sln.city_name_geographic = slnr.city_name_geographic  and slnr.brand = 'MX'
			group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
			order by count(slnr.street) desc
			limit 1 ) Else
				(select slnr.com_sect
				from salons as slnr
				where sln.city_name_geographic = slnr.city_name_geographic   and slnr.city_name_geographic is not Null and slnr.brand = 'MX'
				group by   slnr.city_name_geographic, slnr.com_sect
				order by count(slnr.city_name_geographic) desc
				limit 1 )end)
 Else sln.com_sect end) as com_sect,



sln.representative_full_name,
sln.client_type,
sln.address_full,
sln.street,
sln.house,
sln.ext_address,
sln.city_name_geographic,
sln.fias_id,
sln.region_name_geographic,
sln.area_name_geographic,
sln.city_district,
sln.kladr_id,
sln.fias_level,
sln.capital_marker,
sln.okato,
sln.oktmo,
sln.tax_office,
sln.timezone,
sln.geo_lat,
sln.geo_lon,
sln.beltway_hit,
sln.beltway_distance,
sln.qc_geo,

(Case when sln.brand = 'LP' then 'LP' else
	(case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic  and sln.house = slnr.house and slnr.brand = 'LP'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'LP' end ) end) as LP,

(Case when sln.brand = 'MX' then 'MX' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'MX'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'MX' end ) end) as MX,

(Case when sln.brand = 'KR' then 'KR' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'KR'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'KR' end ) end) as KR,

(Case when sln.brand = 'RD' then 'RD' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house  and slnr.brand = 'RD'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'RD' end ) end) as RD,

(Case when sln.brand = 'ES' then 'ES' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'ES'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'ES' end ) end) as ES,

(Case when sln.brand = 'DE' then 'DE' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'DE'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'DE' end ) end) as DE,

(Case when sln.brand = 'CR' then 'CR' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'CR'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'CR' end ) end) as CR,

(Case when sln.brand = 'Estel' then 'Estel' else
	( case when (select Count(slnr.id)
	from salons as slnr
	where sln.street = slnr.street and sln.city_name_geographic = slnr.city_name_geographic and sln.house = slnr.house and slnr.brand = 'Estel'
	group by  slnr.street, slnr.city_name_geographic, slnr.com_sect
	order by count(slnr.street) desc
	limit 1 ) <> 0 then 'Estel' end ) end) as Estel




from salons as sln
--where sln.brand = 'Estel' --and sln.id = '38815' -- and sln.city_name_geographic is Null --a
 --sln.com_mreg is Null or sln.com_reg is Null or sln.com_sect is Null ф
order by sln.id --sln.city_name_geographic, sln.street 