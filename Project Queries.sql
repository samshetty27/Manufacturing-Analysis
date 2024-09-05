create database manufacture_analysis;
show databases ;
use manufacture_analysis;

select * from manufecturing_data;

delete from manufecturing_data
where 'Manufecturing Qty' = '' 
and 'Manufecturing Qty' is  null;

-- Total Manufactured Qty

   SELECT concat(round(sum(`Manufactured Qty`) / 1000000,0),'M')
   as 'Manufacture Qty' FROM `manufacture_analysis`.`manufecturing_data`;
 
-- Rejected Qty

  SELECT concat(round(sum(`Rejected Qty`) / 1000,0),'K')
  as 'Rejected Qty' FROM `manufacture_analysis`.`manufecturing_data`;
 
 -- Total Processed Qty
  SELECT concat(round(sum(`processed Qty`)/ 1000000,0),'M') as 'Total_Processed Qty' 
  FROM `manufacture_analysis`.`manufecturing_data`;

-- Total Westage Qty
  SELECT  concat(round(sum(`Manufactured Qty` - `Rejected Qty`) / 1000,0),'K' )
  as 'Westage Qty' 
  FROM `manufacture_analysis`.`manufecturing_data`;

-- Employee wise rejected qty
 SELECT `Emp Name`,
 concat(round(sum(`Rejected Qty`) / 1000,0),'K')
 as 'Emp_Rejected Qty' FROM `manufacture_analysis`.`manufecturing_data`
 group by `Emp Name`
 having sum(`Rejected Qty`) > 0
 order by sum(`Rejected Qty`)
 desc;
 
 -- Machine wise rejected qty
 SELECT `Machine Name`,
 concat(round(sum(`Rejected Qty`) / 1000,0),'K') as 'Machine_Rejected Qty' 
 FROM `manufacture_analysis`.`manufecturing_data`
 group by `Machine Name`
 having sum(`Rejected Qty`) > 0
 order by sum(`Rejected Qty`)
 desc;
 
-- Department wise Manufactured vS Rejected Qty

 select `Department Name` ,
 concat(round(sum(`Manufactured Qty`) / 1000000,0),'M') as 'Manufacture Qty',
 concat(round(sum(`Rejected Qty`) / 1000,0),'K') as 'Rejected Qty'
 from `manufacture_analysis`.`manufecturing_data`
 group by `Department Name`
 having sum(`Rejected Qty`) > 0
 order by sum(`Rejected Qty`)
 desc;
 
 -- Manufactured Vs Rejected
 SELECT concat(round(sum(`Manufactured Qty`) / 1000000,0),'M')
 as 'Manufacture Qty',
 concat(round(sum(`Rejected Qty`) / 1000,0),'K')
 as 'Rejected Qty' 
 FROM `manufacture_analysis`.`manufecturing_data`
 where `Rejected Qty`!= 0;
 
-- Production Comparision Treand
 SELECT `Fiscal Date`,
 concat(round(sum(`processed Qty`)/ 1000000,0),'M') as 'Total_Processed Qty' ,
 concat(round(sum(`Manufactured Qty`) / 1000000,0),'M') as 'Manufacture Qty',
 concat(round(sum(`Produced Qty`) / 1000000,0),'M') as 'Produced Qty' ,
 concat(round(sum(`Rejected Qty`) / 1000,0),'K') as 'Rejected Qty' 
 FROM `manufacture_analysis`.`manufecturing_data`
 group by `Fiscal Date`
 order by sum(`Rejected Qty`) ;


