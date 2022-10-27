SELECT street.street_name, AVG(`readings`.`vpm2.5`), AVG(`readings`.`pm2.5`) from readings, street where readings.SiteID = street.street_id and year(`readings`.`Date Time`) >= '2010-01-01' 
and year(`readings`.`Date Time`) <= '2019-12-31' 
and readings.`Date Time` LIKE '%08:00:00+00:00' GROUP BY street.street_name;


