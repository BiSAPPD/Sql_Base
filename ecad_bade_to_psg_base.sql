select
sln.id,
0 as row,
sln.brand,
sln.salon_code,
sln.partner_code,
sln.id_eacademie,
sln.name,
sln.address,
sln.open_date,
sln.law_name,
sln.phone,
sln.email,
sln.chain_name,
sln.com_mreg,
sln.com_reg,
sln.com_sect,
sln.representative_full_name,
sln.client_type,
0 as address_full ,
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
sln.qc_geo
from salons as sln
