create database if not exists `sensordevices`;
use `sensordevices`;

create table if not exists `Brands`
	(id smallint not null primary key auto_increment,
    brandName VARCHAR(50) NOT NULL unique);

create table if not exists `tblDevices` 
	(id INT NOT NULL primary key auto_increment,
    deviceName VARCHAR(50) NOT NULL,
    brandId INT NOT NULL,
    foreign key (brandId) references Brands (id));
    
create table if not exists `tblSensors`
	(id INT NOT NULL primary key auto_increment,
    sensorType VARCHAR(50) NOT NULL unique,
    sensorDescription VARCHAR(100),
    UoM VARCHAR(10));

create table if not exists `tblSensorDevices`
	(id INT NOT NULL primary key auto_increment,
    deviceId INT NOT NULL,
    sensorId INT NOT NULL,
    unique(deviceId, sensorId),
    foreign key (deviceId) references tblDevices (id),
    foreign key (sensorId) references tblSensors (id));

create table if not exists `tblSensorData`
	(id INT NOT NULL primary key auto_increment,
    sensorDeviceId INT NOT NULL,
    sensorValue FLOAT,
    `timestamp` DATETIME,
    foreign key (id) references tblSensorDevices (sensorDeviceId));

create table if not exists `tblSensorDataLatest`
	(id INT NOT NULL primary key auto_increment,
    sensorDeviceId INT NOT NULL unique,
    sensorValue FLOAT,
    `timestamp` DATETIME,
    foreign key (sensorDeviceId) references tblSensorDevices (id));

/*
The SQL code below creates a trigger for the sensor data table.
Each time a new row is inserted in this table the sensor data latest table gets updated.
This way we always have a quick way to find the latest value for a device instead of consulting the entire table.
We change the delimiter (character that shows where a line of code ends) temporarly to avoid that the code of the trigger gets executed before it is stored.
*/
DELIMITER $$
create trigger sdlatest after insert on `tblSensorData` for each row
begin
	IF exists (select * from tblSensorDataLatest where sensorDeviceId = NEW.sensorDeviceId)
    THEN
		UPDATE tblSensorDataLatest
        SET sensorValue = NEW.sensorValue, `timestamp` = NEW.`timestamp`
        WHERE sensorDeviceId = NEW.sensorDeviceId;
	ELSE 
		INSERT INTO tblSensorDataLatest (sensorDeviceId, sensorValue, `timestamp`) VALUES (NEW.sensorDeviceId, NEW.sensorValue, NEW.`timestamp`);
	END IF;
end;
$$
DELIMITER ;

INSERT INTO `tblBrands` (brandName) VALUES ('Hewlett-Packard'),('Texas Instruments'),('Element14');
INSERT INTO `tblDevices` (deviceName, brandId) VALUES ('Simon\'s Raspberry Pi', (SELECT id from tblBrands where brandName = 'Element14'));
INSERT INTO `tblSensors` (sensorType, sensorDescription, UoM) VALUES ('temp','ambiant room temperature','°C'),('hum','Relative Humidity','%'),('pres','barometric air presure','hPa'),('CO2','Carbon dioxide concetration','ppm');
INSERT INTO `tblSensorDevices` 
	(deviceId, sensorId) 
    VALUES 
    ((SELECT id from tblDevices where deviceName = 'Simon\'s Raspberry Pi'),(SELECT id from tblSensors where sensorType = 'temp')),
    ((SELECT id from tblDevices where deviceName = 'Simon\'s Raspberry Pi'),(SELECT id from tblSensors where sensorType = 'hum'));
INSERT INTO `tblSensorData` (sensorDeviceId, sensorValue, `timestamp`) values (1, 20.3, NOW());