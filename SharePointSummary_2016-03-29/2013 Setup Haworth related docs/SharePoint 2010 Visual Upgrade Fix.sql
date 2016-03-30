update a 
SET tp_WebPartTypeId = '874F5460-71F9-FECC-E894-E7E858D9713E'
from AllWebParts a
left join AllLists b on a.tp_ListId = b.tp_ID
WHERE tp_WebPartTypeId IN('BAF5274E-A800-8DC3-96D0-0003D9405663','2242CCE6-491A-657A-C8EE-B10A2A993EDA') 
and tp_title IN
  ('WelcomePage', 'ContactMosaic', 'Catalogue')