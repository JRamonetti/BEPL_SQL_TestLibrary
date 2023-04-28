SELECT substring(rid.fileName,7,(locate('_',rid.fileName,7)-7)) AS 'NID',
concat(di.distCustAccountCode,'|','DI-',di.DISTLOCATION_ID) AS 'DCN',
concat('CU-',di.CUSTOMERLOCATION_ID) as 'Customer OID',
co3.name AS 'Customer Name',
di.customerName as 'Dist Customer Name',
di.customerPath as 'Customer Path',
substring(di.customerPath,0,length(di.customerPath)-7) as 'Group Path',
co1.name AS 'Top Group',
co2.name AS 'Second Group'
FROM raw_import_data rid
JOIN distributor_invoice di ON rid.id=di.rawReference
JOIN company co1 ON co1.id=di.CUSTOMERACCOUNT_ID
JOIN company co2 ON co2.id=substring(di.customerPath,(locate('/',di.customerPath,3)+1),(locate('/',di.customerPath,9)+1))
JOIN company co3 ON co3.id=di.CUSTOMERLOCATION_ID
WHERE rid.IMPORTCONFIG_ID='4143'
AND rid.processDateTime >'2022-01-01'
AND di.invoiceStatus='VALID'
AND substring(rid.fileName,7,4)=('ICHG')
GROUP BY di.DISTLOCATION_ID,di.distCustAccountCode,substring(rid.fileName,7,4),substring(di.customerPath,(locate('/',di.customerPath,3)+1),(locate('/',di.customerPath,9)+1));

select fileName,substring(fileName,7,8) from raw_import_data where IMPORTCONFIG_ID=4143 order by id desc;