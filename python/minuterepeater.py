'''
MinuteRepeater
AJ Schrier
'''
import time

# Get time
hour=time.strftime("%I")
minute=time.strftime("%M")

# Chime the hours
# One per hour, with a little pause in between
def HourChime(currenthour):
	print
	for i in range(currenthour):
		print "DONG"
		time.sleep(0.5)
	time.sleep(0.2)

# Chime the minutes 
# One 'DING-DONG' per 15 minutes, and then a 'DING' for each remaining minute
def MinuteChime(currentminute):
	print
	if currentminute==0:
		return
	else:
		a=currentminute/15
		b=currentminute%15
	if a!=0:
		for i in range(a):
			print "DING-DONG"
			time.sleep(0.5)
		time.sleep(0.1)
	if b!=0:
		print
		for i in range(b):
			print "DING"
			time.sleep(0.5)

HourChime(int(hour))
MinuteChime(int(minute))

# A little pause before ending
time.sleep(1)

# Print the time when the script started
print "\nThe current time is " + hour + ":" + minute