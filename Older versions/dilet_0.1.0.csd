<Cabbage>

form    caption("Mod Delay") size(450,450), colour(28,69,135), pluginid("modDelay")

;Controles de BPM, tiempo libre y botón de sincronización de tempo:
rslider bounds(10, 10, 100, 100), channel("BPM"), range(20, 200, 125, 1, 1), text("BPM"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
rslider bounds(10, 110, 100, 100), channel("time"), range(0.001, 2, 0.5, 0.5, 0.001), text("Time"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
nslider bounds(40, 190, 40, 20), channel("timeBox"), range(0.001, 2, 0.5, 0.5, 0.001)
rslider bounds(10, 210, 100, 100), channel("feedback"), range(0, 1, 0.33, 1, 0.01), text("Feedback"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
button bounds(120, 10, 66, 40), channel("BPMManual"), text("Manual BPM"), colour:0("black"), colour:1("red"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(186, 10, 66, 40), channel("BPMHost"), text("Host BPM"), colour:0("black"), colour:1("red"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1)
button bounds(252, 10, 66, 40), channel("freeTime"), text("Free"), colour:0("black"), colour:1("red"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(1), value(1)

;Botones de subdivisión de tiempo:
button bounds(120, 60, 40, 40), channel("whole"), text("W"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(160, 60, 40, 40), channel("half"), text("H"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(200, 60, 40, 40), channel("quarter"), text("Q"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(240, 60, 40, 40), channel("eighth"), text("E"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(280, 60, 40, 40), channel("sixteenth"), text("S"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white"), radiogroup(2)
button bounds(120, 100, 40, 40), channel("dot"), text("."), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white")
button bounds(160, 100, 40, 40), channel("triplet"), text("3"), colour:0("black"), colour:1("blue"), outlinecolour(0,0,0,0), fontcolour:0("white")

;Botones de forma de LFO:
rslider bounds(10, 330, 100, 100), channel("rate"), range(0, 20, 4, 1, 0.01), text("LFO Rate"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
rslider bounds(110, 330, 100, 100), channel("depth"), range(0, 1, 0, 0.25, 0.001), text("LFO Depth"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
button bounds(220, 330, 40, 40), channel("sine"), value(1), text("Sine"), colour:O("black"), colour:1("blue"), outlinecolour(0,0,0,0), radiogroup(3)
button bounds(260, 330, 40, 40), channel("triangle"), text("Tri"), colour:O("black"), colour:1("blue"), outlinecolour(0,0,0,0), radiogroup(3)
button bounds(220, 370, 40, 40), channel("sawUp"), text("Up"), colour:O("black"), colour:1("blue"), outlinecolour(0,0,0,0), radiogroup(3)
button bounds(260, 370, 40, 40), channel("sawDown"), text("D"), colour:O("black"), colour:1("blue"), outlinecolour(0,0,0,0), radiogroup(3)
label bounds(160, 415, 130, 12), text("LFO Shape"), align("center"), fontcolour("white")

;Perilla para efecto analógico:
rslider bounds(340, 110, 100, 100), channel("analogKnob"), range(0, 1, 0, 1, 0.01), text("Analog"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
button  bounds(300, 120, 40, 40), channel("analogButton"), text("Anlg"), colour:0("black"), colour:1("red"), outlinecolour(0,0,0,0), fontcolour:0("white")

;Controles para el filtro:
button bounds(185, 170, 40, 40), channel("filter"), text("Filter"), colour:0("black"), colour:1("orange"), outlinecolour(0,0,0,0), fontcolour:0("white")
rslider bounds(110, 210, 100, 100), channel("HPF"), text("HPF"), range(0, 20000, 0, 0.25, 1), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")
rslider bounds(200, 210, 100, 100), channel("LPF"), text("LPF"), range(0, 20000, 20000, 0.25, 1), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")

;Controles para ping-pong:
button bounds(350, 220, 80, 40), channel("pingPong"), text("Ping-Pong"), colour:0("black"), colour:1("orange"), outlinecolour(0,0,0,0), textcolour("white")

;Perilla de relación entre efecto y señal original:
rslider bounds(340, 10, 100, 100), channel("dryWet"), range(0, 1, 0.5, 1, 0.01), text("Dry/Wet"), trackercolour(204,255,0), outlinecolour(0,0,0,0), textcolour("white")




</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-odac0 -iadc1 -b128 -B12 -m96 
</CsOptions>
<CsInstruments>

ksmps   = 32
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
	
	elseif  kSubDiv==16   then
	    kSync   =   kQuarter*$DOT*$TRIPLET*4 ;Calcula compás con puntillo.
	elseif  kSubDiv==17   then
	    kSync   =   kQuarter*$DOT*$TRIPLET*2 ;Calcula blanca con puntillo.
	elseif  kSubDiv==18   then
	    kSync   =   kQuarter*$DOT*$TRIPLET   ;Calcula negra con puntillo.
	elseif  kSubDiv==19   then
	    kSync   =   kQuarter*$DOT*$TRIPLET*0.5   ;Calcula corchea con puntillo.
	elseif  kSubDiv==20   then
	    kSync   =   kQuarter*$DOT*$TRIPLET*0.25  ;Calcula semicorchea con puntillo.
	
	endif
	
    xout   kSync
	
endop


opcode  analogJitter, a, a

    aTime   xin
    
    kKnob   chnget  "analogKnob"

	kHzMin 	= 	2 	;Tasa de variación mínima en Hertz.
	kHzMax 	=	16 	;Tasa de variación máxima en Hertz.
	kJitAmp	=	aTime*(kKnob*0.0035)

	kJit 	jspline kJitAmp, kHzMin, kHzMax ;Opcode jspline (Jitter Spline).
	aJit 	= 		kJit
	;Inclusión de Jitter para variable de tiempo
	aOut    = 		aTime + aJit
	
	        xout    aOut

endop


opcode  saturator, a, a

    aIn     xin
    
    kKnob   chnget  "analogKnob"
    
    iFunc   =       1
    iStart  =       0
    iSize   =       65537
   	kSat 	= 		kKnob*0.5
	iTan 	= 		1
	
	kThresh =       0
	kLoKnee =       48
	kHiKnee =       60
	kRatio  =       kKnob*4+1
	kAtt    =       0.015
	kRel    =       160
	iLook   =       0.05
	kMakeUp =       kKnob*ampdbfs(15)+1	
	
	kHPCf   =       kKnob*300
	kLPCf   =       kKnob*14000+6000

	iTrans 	ftgen 	    iFunc, iStart, iSize, "tanh", -iTan, iTan

	aShape 	distort	    aIn, kSat, iTrans
	aComp   compress    aShape, aShape, kThresh, kLoKnee, kHiKnee, kRatio, kAtt, kRel, iLook
	aHPF    atonex      aComp*kMakeUp, kHPCf, 3
	aLPF    tonex       aHPF, kLPCf, 3
     		xout 	    aLPF

endop


opcode  filters, a, a

    aIn     xin

	;Controles para filtro de paso bajo.
	kHPCf	chnget  "HPF"   ;Perilla de frecuencia de corte para filtro de paso alto.
	kLPCf	chnget 	"LPF" 	;Perilla de frecuencia de corte para filtro de paso bajo.
	iPoles  =       3

	;Filtro de estado variable. 	
	aHPF 	atonex 	aIn,  kHPCf, iPoles
	aLPF 	tonex 	aHPF,  kLPCf, iPoles
	        xout    aLPF

endop


opcode  pingPong, aa, akaii

    aDelL   init        0
    aDelR   init        0
    
    aIn, kFdbk, aVar, iMax, iWindow      xin
    
    aDelL 	vdelayxw	aIn + aDelR*kFdbk*0.5, aVar, iMax, iWindow
	aDelR 	vdelayxw	aDelL*kFdbk*1.5, aVar, iMax, iWindow
	
	        xout        aDelL, aDelR

endop





instr		ModDelay


	aIn     inch 	1 		;Entrada de audio del plugin.

	;Controles para el opcode "vdelayxw". 
	aDelL 	init 	0		;Inicializar output de retraso para retroalimentación.
	aDelR 	init 	0		;Inicializar output de retraso para retroalimentación.
	
	kFdbk	chnget	"feedback" 	;Perilla de retroalimentación (0-1).
	iMax 	=		2001 	;Tiempo de retraso máximo.
	iWindow =		1024 	;Ventana, en muestras, para procesamiento de retraso.

    ;Para obtener los valores de las perillas de la interfaz gráfica:
    
    kBPMManual  chnget  "BPMManual"
    kBPMHost    chnget  "BPMHost"
    kFreeButt   chnget  "freeTime"
    
	kClick  chnget  "MOUSE_DOWN_LEFT"
    
    /*Esto es para que la perilla de tiempo deje de funcionar cada que el mouse hace click.
      Así, se previenen problemas de artefactos cuando se mueve la perilla de tiempo.*/
    if  kClick==1 then
   
    else
        kFree       chnget  "time" 
                         
    endif
    
       
    
    kFilt       chnget  "filter"
    
    ;Si está encendido el botón "BPM Sync"...
    if  kBPMManual==1   then   
    
            kBPM        chnget  "BPM"
    
            kWhole      chnget  "whole"
            kHalf       chnget  "half"
            kQuarter    chnget  "quarter"
            k8th        chnget  "eighth"
            k16th       chnget  "sixteenth"
            
            kDot        chnget  "dot"
            kTriplet    chnget  "triplet"
            
            kSubDiv =   (kWhole*1)+(kHalf*2)+(kQuarter*3)+(k8th*4)+(k16th*5)+(kTriplet*5)+(kDot*10)
            
            if  kSubDiv==0  then
                    aTime   =   kFree
            else          
                    kSync   BPMCalc kBPM, kSubDiv
                    aTime   =       kSync
            endif
    elseif  kBPMHost==1     then
    
            kBPM        chnget  "HOST_BPM"
    
            kWhole      chnget  "whole"
            kHalf       chnget  "half"
            kQuarter    chnget  "quarter"
            k8th        chnget  "eighth"
            k16th       chnget  "sixteenth"
            
            kDot        chnget  "dot"
            kTriplet    chnget  "triplet"
            
            kSubDiv =   (kWhole*1)+(kHalf*2)+(kQuarter*3)+(k8th*4)+(k16th*5)+(kTriplet*5)+(kDot*10)
            
            if  kSubDiv==0  then
                    aTime   =   kFree
            else          
                    kSync   BPMCalc kBPM, kSubDiv
                    aTime   =       kSync
            endif 
    elseif  kFreeButt==1    then
            aTime   =   kFree
    endif


    
	;Oscilador de frecuencia baja.
	kRate	    chnget  "rate" 		;Frecuencia del oscilador en Hz.
	kDepth 	    chnget 	"depth"		;Intensidad de la modulación (0-1).
	kSine       chnget  "sine"
	kTri        chnget  "triangle"
	kSqBi       chnget  "squareBi"
	kSqUni      chnget  "squareUni"
	kSawUp      chnget  "sawUp"
	kSawDown    chnget  "sawDown"
	
	kWave   =   (kSine*1)+(kTri*2)+(kSawUp*3)+(kSawDown*4)	;Forma de onda del oscilador.
	kMod 	= 	aTime*(kDepth*0.2) 		;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
	
	if      kWave=1     then
	    aLFO    lfo	kMod, kRate, 0 	;Oscilador de frecuencia baja en sinusoidal.
	elseif  kWave=2     then
	    aLFO	lfo	kMod, kRate, 1 	;Oscilador de frecuencia baja en triángulo.
	elseif  kWave=3     then
	    aLFO	lfo	kMod, kRate, 4 	;Oscilador de frecuencia baja en sierra hacia arriba.
	elseif  kWave=4     then
	    aLFO	lfo	kMod, kRate, 5 	;Oscilador de frecuencia baja en sierra hacia abajo.
	endif	    			
	
	aVar 	= 	aTime + aLFO 	;Conexión entre perilla de tiempo y oscilador.

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
	kAnaButt    chnget  "analogButton"
	kFiltButt   chnget  "filter"
	kPing       chnget  "pingPong"
	
	if  kAnaButt==1 then;Botón para apagar o encender Jitter.
	        aVar    analogJitter    aVar 
	        aIn     saturator       aIn
	endif
	
    if  kFiltButt==1  then
	        aIn filters aIn
	endif
	
	if  kPing==1    then
	        aDelL, aDelR    pingPong    aIn, kFdbk, aVar, iMax, iWindow
    elseif  kPing==0    then
            aDelL   vdelayxw	aIn + aDelL*kFdbk, aVar, iMax, iWindow
		    aDelR 	vdelayxw	aIn + aDelR*kFdbk, aVar, iMax, iWindow 
    endif
	
	kDryWet chnget  "dryWet"							

	aMixL 	ntrpol 	aIn, aDelL, kDryWet 
	aMixR 	ntrpol 	aIn, aDelR, kDryWet 
        		
	outs	aMixL, aMixR 	;Salidas del plugin.

endin


</CsInstruments>
<CsScore>

;Corre el instrumento "Mod Delay" infinitamente.
i 	"ModDelay" 	0 	z 

</CsScore>
</CsoundSynthesizer>