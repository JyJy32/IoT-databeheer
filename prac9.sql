drop database sensordevices # test

SELECT * from sensordevices.tblDevices
SELECT * from sensordevices.tblBrands ORDER BY id

INSERT INTO sensordevices.tblBrands VALUES (4, "HP")

INSERT INTO tbldevices(deviceName, brandId) 
VALUES ("LAPTOP_JOREN", (
    select id 
    from tblbrands 
    where brandName = "HP"))

SELECT * from sensordevices.tblSensors
SELECT * from sensordevices.tblSensorDevices

DELETE from sensordevices.tbldevices where devicename = "LAPTOP_JOREN"

select *, (
    select deviceName 
    from sensordevices.tblDevices D
    where D.id = SD.deviceid
    ) as device, 
    (
    select sensorType
    from sensordevices.tblSensors S
    where S.id = SD.sensorId
    ) as sensor
from sensordevices.tblSensorDevices SD  

select * from sensordevices.tbldevices where id = 4