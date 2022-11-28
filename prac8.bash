# oef 2
# 1
mosquitto -help
# 2
mosquitto
# 3
mosquitto_pub --help
or
man mosquitto_pub
# 4
mosquitto_pub --help
or
man mosquitto_pub
# 5

# 11
mosquitto_sub -h localhost -p 1883 -t "/AP/+/+/temperature" -i mosquitto_sub_ap -v > mqttlog

# oef 2
# 1
cp /usr/share/doc/mosquitto/examples/mosquitto.conf /home/<name>
#in security uncomment prefix en typ ap- er achter
# 2
mosquitto_sub -h localhost -p 1883 -t /AP/liegeois/joren
# 3
mosquitto_sub -h localhost -p 1883 -t /AP/liegeois/joren -i ap-joren