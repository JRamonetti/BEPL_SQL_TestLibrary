select fileName,substring(fileName,7,8) from raw_import_data where IMPORTCONFIG_ID=4143 order by id desc;

select concat('CU-',di.CUSTOMERLOCATION_ID) as 'Customer OID', custCo.name as 'Customer Name', custCo.createDate as 'Customer Create Date', distCo.name as 'OpCo', di.distCustAccountCode as 'DCN',substring(raw.fileName,7,8) as 'NID' from distributor_invoice di
join raw_import_data raw on di.rawReference=raw.id
join company custCo on di.CUSTOMERLOCATION_ID=custCo.id
join company distCo on di.DISTLOCATION_ID=distCo.id
where di.purchaseDate>='2022-10-01' and di.DISTCOMPANY_ID=20134 AND customerPath like '%193131%'
group by di.distCustAccountCode,di.DISTLOCATION_ID;