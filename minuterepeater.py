import time

hour=time.strftime("%I")
minute=time.strftime("%M")

def HourChime(currenthour):
	for i in range(currenthour):
		print "DONG"

def MinuteChime(currentminute):
	if currentminute==0:
		return
	else:
		a=currentminute/15
		b=currentminute%15
	if a!=0:
		for i in range(a):
			print "DING-DONG"
	if b!=0:
		for i in range(b):
			print "DING"

HourChime(int(hour))
MinuteChime(int(minute))