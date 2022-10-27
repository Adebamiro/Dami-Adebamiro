SELECT `Date Time`, street.street_name, `NOx` FROM readings,street
WHERE NOx = (SELECT max(NOx) FROM readings WHERE`Date Time` >= '2019-01-01' and `Date Time` <='2019-12-31')and street.street_id = readings.SiteID;
