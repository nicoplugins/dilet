<CsoundSynthesizer>
<CsOptions>
-odac1 -iadc1 -d -b128 -B128 -m96
</CsOptions>
<CsInstruments>


sr      = 44100
ksmps   = 1
nchnls  = 2
0dbfs   = 1



		instr	1

iDel    =		1
kDel	=		1
kDepth	=		0.001
kRate	=	    6
kCF		=		20000
kFdbk	=		0
kDryWet =       0.5
iWave   =       0

aIn     inch    1

kLFO	lfo		kDepth, kRate, iWave
kOff	=		(kLFO + kDepth)/2

aDump	delayr 	iDel
aVar	deltapi kDel*kOff
aLPF	tone	aVar, kCF
		delayw	aIn + (aLPF*kFdbk)

aMix 	ntrpol 	aIn, aVar, kDryWet
				
		outs	aMix, aMix

		endin


</CsInstruments>
<CsScore>

i1 		0		z

</CsScore>
</CsoundSynthesizer>