import time

hour=time.strftime("%I")
minute=time.strftime("%M")

def HourChime(currenthour):
	print
	for i in range(currenthour):
		print "DONG"

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
	if b!=0:
		print
		for i in range(b):
			print "DING"

HourChime(int(hour))
MinuteChime(int(minute))

print "\nThe current time is " + hour + ":" + minute