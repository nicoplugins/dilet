<Cabbage>

form    caption("BPM Test") size(350,225), colour(50,50,50), pluginid("BPMCalc")

;Perillas de BPM, tiempo libre y botón de sincronización de tempo:
rslider bounds(10, 10, 100, 100), channel("BPM"), range(20, 200, 125, 1, 1), text("BPM"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
rslider bounds(10, 110, 100, 100), channel("time"), range(0.001, 2, 0.5, 1, 0.001), text("Time"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
button bounds(120, 10, 80, 40), channel("BPMSync"), text("BPM Sync"), colour:0("black"), colour:1("red"), outlinecolour(0,0,0,0), fontcolour:0("white")

;Botones de subdivisión de tiempo:
button bounds(120, 80, 40, 40), channel("whole"), text("W"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(160, 80, 40, 40), channel("half"), text("H"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(200, 80, 40, 40), channel("quarter"), text("Q"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(240, 80, 40, 40), channel("eighth"), text("E"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(280, 80, 40, 40), channel("sixteenth"), text("S"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(120, 140, 40, 40), channel("dot"), text("."), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(160, 140, 40, 40), channel("triplet"), text("3"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-odac0 -iadc1 -b128 -B12 -m96 
</CsOptions>
<CsInstruments>

sr      = 44100
ksmps   = 1
nchnls  = 2
0dbfs   = 1


#define SYNCFACTOR 	#60#
#define TRIPLET     #0.6666#
#define DOT         #1.5#


opcode  BPMCalc, k, kk

    kBPM, kSubDiv       xin

	kQuarter 	= 		$SYNCFACTOR/kBPM 	;Cálculo de relación entre BPM y subdivisión de 1/4.
	
	;Subdivisiones rítmicas básicas.
	if  kSubDiv==1    then 
	    kSync   =   kQuarter*4 	;Calcula un redonda.
	elseif  kSubDiv==2    then
	    kSync   = 	kQuarter*2 	;Calcula una blanca.
	elseif  kSubDiv==3    then
	    kSync   =   kQuarter    ;Equivale a una negra.
	elseif  kSubDiv==4    then
	    kSync 	=	kQuarter*0.5 	;Calcula una corchea.
	elseif  kSubDiv==5    then
	    kSync	= 	kQuarter*0.25 	;Calcula una semicorchea.
	
	elseif  kSubDiv==6    then
	    kSync   =   kQuarter*$TRIPLET*4 ;Calcula tresillo de compás.
	elseif  kSubDiv==7    then
	    kSync   =   kQuarter*$TRIPLET*2 ;Calcula tresillo de blanca.
	elseif  kSubDiv==8    then
	    kSync   =   kQuarter*$TRIPLET   ;Calcula tresillo de negra.
	elseif  kSubDiv==9    then
	    kSync   =   kQuarter*$TRIPLET*0.5   ;Calcula tresillo de corchea.
	elseif  kSubDiv==10   then
	    kSync   =   kQuarter*$TRIPLET*0.25  ;Calcula tresillo de semicorchea.
	
	elseif  kSubDiv==11   then
	    kSync   =   kQuarter*$DOT*4 ;Calcula compás con puntillo.
	elseif  kSubDiv==12   then
	    kSync   =   kQuarter*$DOT*2 ;Calcula blanca con puntillo.
	elseif  kSubDiv==13   then
	    kSync   =   kQuarter*$DOT   ;Calcula negra con puntillo.
	elseif  kSubDiv==14   then
	    kSync   =   kQuarter*$DOT*0.5   ;Calcula corchea con puntillo.
	elseif  kSubDiv==15   then
	    kSync   =   kQuarter*$DOT*0.25  ;Calcula semicorchea con puntillo.
	endif
	
    xout   kSync
	
endop	


instr		ModDelay

	aIn     inch 	1 		;Entrada de audio del plugin.

	;Controles para el opcode "vdelayxw". 
	aDelL 	init 	0		;Inicializar output de retraso para retroalimentación.
	aDelR 	init 	0		;Inicializar output de retraso para retroalimentación.
	kFdbk	=		0.33 	;Perilla de retroalimentación (0-1).
	iMax 	=		10000 	;Tiempo de retraso máximo.
	iWindow =		1024 	;Ventana, en muestras, para procesamiento de retraso.

    ;Para obtener los valores de las perillas de la interfaz gráfica:
    kBPM        chnget  "BPM"
    kBPMSync    chnget  "BPMSync"
    kFree       chnget  "time"    
    
    ;Si está encendido el botón "BPM Sync"...
    if  kBPMSync ==  1   then   
    
            kWhole      chnget  "whole"
            kHalf       chnget  "half"
            kQuarter    chnget  "quarter"
            k8th        chnget  "eighth"
            k16th       chnget  "sixteenth"
            
            kDot        chnget  "dot"
            kTriplet    chnget  "triplet"
            
            kSubDiv =   (kWhole*1)+(kHalf*2)+(kQuarter*3)+(k8th*4)+(k16th*5)+(kTriplet*5)+(kDot*10)
            
            if  kSubDiv==0  then
                    kTime   =   kFree
            else          
                    kSync   BPMCalc kBPM, kSubDiv
                    kTime   =       kSync
            endif
    else
            kTime   =   kFree
            
    endif

	;Controles para filtro de paso bajo.
	kType 	= 	1 		;Selección de tipo de filtro (1-4).
	kCf		=	2500 	;Perilla de frecuencia de corte para filtro.
	kQ 		= 	0.5 	;Factor Q del filtro.
	iOver 	= 	4 		;Selección de oversampling para el filtro.
	iStor 	= 	1 		;Habilita si el filtro guarda la información previa o no (0 ó 1).

	;Oscilador de frecuencia baja.
	kRate	=	6 		;Frecuencia del oscilador en Hz.
	kDepth 	= 	0		;Intensidad de la modulación (0-1).
	iWave   =   0 		;Forma de onda del oscilador.
	kMod 	= 	kTime*kDepth 		;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
	aLFO	lfo	kMod, kRate, iWave 	;Oscilador de frecuencia baja.
	aVar 	= 	kTime + aLFO 	;Conexión entre perilla de tiempo y oscilador.

	/* 
	Formas de onda del oscilador:
	0 		=			Sinusoidal
	1 		=			Triángulo
	2 		= 			Cuadro bipolar
	3 		= 			Cuadro unipolar
	4 		= 			Sierra hacia arriba
	5 		= 			Sierra hacia abajo
	*/

	/*Para Jitter Spline, opcode de variación al azar.
	Jitter Spline se aplica al tempo del delay para generar un efecto de cinta vintage.*/
	kJitBut 	= 	0 		;Botón para apagar o encender Jitter.

	kJitDepth 	=	0
	kHzMin 		= 	2 	;Tasa de variación mínima en Hertz.
	kHzMax 		=	16 	;Tasa de variación máxima en Hertz.
	kJitAmp		=	kTime*kJitDepth

	kJit 	jspline kJitAmp, kHzMin, kHzMax ;Opcode jspline (Jitter Spline).
	aJit 	= 		kJit
	;Inclusión de Jitter para variable de tiempo
	aVarJit = 		aVar + aJit

	;Botón de ping-pong.
	kPing 	=	0
	
	;"vdelayxw" es un opcode de retraso de alta calidad.
	;Botón de ping-pong apagado.
	if 	kPing==0 	then 
		aDelL 		vdelayxw	aIn + aDelL*kFdbk, aVarJit, iMax, iWindow
		aDelR 		vdelayxw	aIn + aDelR*kFdbk, aVarJit, iMax, iWindow
		;Botón de ping-pong encendido.
		elseif 	kPing==1 	then 
			aDelL 	vdelayxw	aIn + aDelR*kFdbk, aVarJit, iMax, iWindow
			aDelR 	vdelayxw	aDelL*kFdbk, aVarJit, iMax, iWindow
	endif

	;Filtro de estado variable. 	
	aHPFL, aLPFL, aBPFL, aBRFL 	statevar 	aDelL,  kCf, kQ, iOver, iStor
	aHPFR, aLPFR, aBPFR, aBRFR 	statevar 	aDelR,  kCf, kQ, iOver, iStor 			
	kDryWet =   0.5 	;Perilla para relación entre efecto y señal inicial.

	;Selección de filtro de paso bajo.
	if 	kType==1 	then 	
		aMixL 		ntrpol 		aIn, aLPFL, kDryWet 
		aMixR 		ntrpol 		aIn, aLPFR, kDryWet 
		;Selección de filtro de paso alto.
		elseif 		kType==2 	then 	
			aMixL 	ntrpol 		aIn, aHPFL, kDryWet
			aMixR 	ntrpol 		aIn, aHPFR, kDryWet
		;Selección de filtro de paso de banda. 
		elseif 		kType==3 	then 	
			aMixL 	ntrpol 		aIn, aBPFL, kDryWet 	
			aMixR 	ntrpol 		aIn, aBPFR, kDryWet 	
		;Selección de filtro de rechazo de banda.
		elseif 		kType==4 	then 
			aMixL 	ntrpol 		aIn, aBRFL, kDryWet
			aMixR 	ntrpol 		aIn, aBRFR, kDryWet
	endif 
			
	outs	aMixL, aMixR 	;Salidas del plugin.

endin


</CsInstruments>
<CsScore>

;Corre el instrumento "Mod Delay" infinitamente.
i 	"ModDelay" 	0 	z 

</CsScore>
</CsoundSynthesizer>