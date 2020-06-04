<Cabbage>  bounds(0, 0, 0, 0)

form    caption("Mod Delay") size(725,300), colour(50, 0, 50), pluginid("modDelay"), guirefresh(10)
groupbox bounds(100, 76, 220, 170), text("Dual Delays"), popup(1), colour(28, 69, 135), visible(0), identchannel("dualDelIdent") {
rslider bounds(10, 25, 100, 100), channel("delay1"), range(0, 4, 0, 0.5, 0.001), text("Delay 1"), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0)
rslider bounds(110, 25, 100, 100), channel("delay2"), range(0, 4, 0, 0.5, 0.001), text("Delay 2"), trackercolour(255, 0, 204, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0)
hslider bounds(60, 140, 110, 20), channel("ABfader"), range(-1, 1, 0, 1, 0.001)
}

;Controles de BPM, tiempo libre y botón de sincronización de tempo:
button  bounds(15, 35, 90, 90), channel("tap"), text("NICO"), channel("tap"), latched(1), colour:1(40, 0, 40), colour:0(90, 70, 90)
label   bounds(15, 130, 90, 16), text("Tap")
label   bounds(15, 220, 90, 40), text("Dilet"), fontcolour("white")
button  bounds(275, 10, 40, 20), channel("tape"), text("Tape"), colour:1(0, 160, 160), colour:0(90, 70, 90), tofront(1)
rslider bounds(335, 190, 100, 100), channel("BPM"), range(20, 200, 125, 1, 1), text("BPM"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(110, 10, 170, 170), channel("outline"), identchannel("outlineIdent"), range(0.001, 4, 0.5, 0.5, 0.001), text("Time"), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), textcolour(0,0,0,0), trackeroutsideradius(1), markercolour(0,0,0,0)
rslider bounds(110, 10, 170, 170), channel("time"), range(0.001, 4, 0.5, 0.5, 0.001), text("Time"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0), trackeroutsideradius(0.95), colour(50, 0, 50)
rslider bounds(480, 10, 170, 170), channel("feedback"), range(0, 1, 0.33, 1, 0.01), text("Feedback"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
button bounds(275, 160, 40, 20), channel("BPMManual"), text("BPM", "BPM"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0) , radiogroup("1")
button bounds(317, 160, 40, 20), channel("BPMHost"), text("Host", "Host"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90),  outlinecolour(0, 0, 0, 0) , radiogroup("1")
button bounds(359, 160, 40, 20), channel("freeTime"), text("ms", "ms"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90),  outlinecolour(0, 0, 0, 0),  radiogroup("1"), value(1)
button  bounds(401, 160, 40, 20), channel("msTap"), text("Tap"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0,0,0,0), radiogroup("1")
button  bounds(443, 160, 42, 20), channel("samples"), text("SR"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), radiogroup("1")
nslider bounds(275, 35, 210, 100), colour(25, 0, 25), fontcolour(204, 255, 0, 255), channel("timeDisp"), identchannel("timeDispIdent"), range(1, 4000, 500, 0.5, 1)

;Botones de subdivisión de tiempo:
button bounds(275, 140, 28, 18), channel("whole"), text("W", "W"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(305, 140, 28, 18), channel("half"), text("H", "H"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(335, 140, 28, 18), channel("quarter"), text("Q", "Q"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(365, 140, 28, 18), channel("eighth"), text("E", "E"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(395, 140, 28, 18), channel("sixteenth"), text("S", "S"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(425, 140, 28, 18), channel("dot"), text(".", "."), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), 
button bounds(455, 140, 30, 18), channel("triplet"), text("3", "3"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), 

;Botones de forma de LFO:
rslider bounds(110, 190, 100, 100), channel("rate"), range(0, 20, 4, 1, 0.01), text("Rate"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(190, 190, 100, 100), channel("depth"), range(0, 1, 0, 1, 0.001), text("Depth"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
button bounds(280, 190, 20, 18), channel("sine"), value(1), text("s", "s"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 210, 20, 18), channel("triangle"), text("t", "t"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 230, 20, 18), channel("sawUp"), text("u", "u"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 260, 20, 20), channel("showDual"), text("d"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90), outlinecolour(0, 0, 0, 0)
label bounds(315, 190, 60, 12), text("LFO Shape"), align("left"), fontcolour(255, 255, 255, 255), rotate(1.5708, 0, 0)


;Perilla para efecto analógico:
rslider bounds(635, 195, 90, 90), channel("analogKnob"), range(0, 1, 0, 1, 0.01), text("Anlg"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)

;Controles para el filtro y efecto de LoFi:
rslider bounds(440, 190, 100, 100), channel("HPF"), identchannel("HPFident"), text("HPF"), range(20, 20000, 20, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(550, 190, 100, 100), channel("LPF"), identchannel("LPFident"), text("LPF"), range(20, 20000, 20000, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
encoder bounds(515, 210, 60, 60), channel("filterLink"), text("link"), increment(1), trackercolour(0, 0, 0), colour(90, 70, 90)
button  bounds(30, 160, 60, 25), text("LoFi"), channel("lofi"), colour:1(0,160,160), colour:0(90, 70, 90)

;Controles para ping-pong:
button bounds(340, 10, 80, 20), channel("pingPong"), text("Ping-Pong"), imgfile("Off", "pingPongOff.svg"), colour:1(0, 160, 160, 255), outlinecolour(0, 0, 0, 0), colour:0(90, 70, 90)
button bounds(317, 10, 21, 20), channel("invLeft"), text("L"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90, 255), outlinecolour(0, 0, 0, 0)
button bounds(422, 10, 21, 20), channel("invRight"), text("R"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90, 255), outlinecolour(0, 0, 0, 0)
button bounds(445, 10, 40, 20), channel("about"), text("About"), colour:1(0, 160, 160, 255), colour:0(90, 70, 90, 255), outlinecolour(0, 0, 0, 0)

;Perilla de relación entre efecto y señal original, así como ganancia de salida:
rslider bounds(635, 10, 90, 90), channel("dryWet"), range(0, 1, 0.5, 1, 0.01), text("D/W"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(635, 95, 90, 90), channel("output"), range(0, 50, 50, 1, 1), text("Out"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50), textboxoutlinecolour(0, 0, 0, 0)



</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-b128 -B12 -m96 
</CsOptions>
<CsInstruments>

ksmps   = 32
nchnls  = 2
0dbfs   = 1


#define SYNCFACTOR 	#60#
#define TRIPLET     #0.6666#
#define DOT         #1.5#
#define ACCEL       #2#         ;Factor de aceleración para la perilla de vínculo entre filtros.
#define LOWTHRESH   #20#        ;Límite inferior para las perillas de filtro.
#define HITHRESH    #20000#     ;Límite superior para las perillas de filtro.
#define MS          #1000#      ;Para convertir de segundos a milisegundos en el visualizador de tiempo.


#include    "BPMCalc.txt"
#include    "analogJitter.txt"
#include    "saturator.txt"
#include    "filters.txt"
#include    "pingPong.txt"
#include    "tape.txt"
#include    "lofi.txt"
#include    "subdivision.txt"
#include    "taps.txt"
#include    "timeLFO.txt"
#include    "sampleDelay.txt"
#include    "samplePing.txt"
#include    "pitchShift.txt"


instr		ModDelay


	aIn     inch 	1 		;Entrada de audio del plugin.

	;Controles para el opcode "vdelayxw". 
	aDelL 	init 	0		;Inicializar output de retraso para retroalimentación.
	aDelR 	init 	0		;Inicializar output de retraso para retroalimentación.
	
	kFdbk	chnget	"feedback" 	;Perilla de retroalimentación (0-1).
	iMax 	=		2001 	;Tiempo de retraso máximo.
	iWindow =		1 	;Ventana, en muestras, para procesamiento de retraso.

    ;Para obtener los valores de las perillas de la interfaz gráfica:
    
    kBPMManual      chnget  "BPMManual"
    kBPMHost        chnget  "BPMHost"
    kFreeButt       chnget  "freeTime"
    kTapMsButton    chnget  "msTap"
    
	kClick          chnget  "MOUSE_DOWN_LEFT"
	        
	kTimeDisp       chnget  "timeDisp"
    kTimeDispChange changed kTimeDisp
    kSampButt   chnget  "samples"
    
    
    /*Esto es para que la perilla de tiempo deje de funcionar cada que el mouse hace click.
      Así, se previenen problemas de artefactos cuando se mueve la perilla de tiempo.*/
    if  kClick=1    then
    
        kDisp   chnget  "time"
                chnset  kDisp*$MS, "timeDisp"
        
    elseif  kClick=0 then
    
            kFree           chnget  "time" 
            
       if  kTimeDispChange=1 then
            chnset  kTimeDisp/$MS, "time"
       endif
         
    endif 
    
    
    ;Si está encendido el botón "BPM Sync"...
    if      kBPMManual==1   then   
    
            kBPM            chnget  "BPM"
            
            kTap            chnget  "tap"
            kPrevTime       init    0
            kTapTempo       init    120
               
            kTapped     changed kTap
            
            if  kTapped==1  then
                kCurrTime   timeinsts
                kTimeDiff   =   kCurrTime-kPrevTime
                kTwoTaps    =   $SYNCFACTOR/kTimeDiff
                kPrevTime   timeinsts
            endif
            
            kTapTempo   taps    kTwoTaps, kBPM
            
            if      kTimeDiff<3 then
                chnset  kTapTempo, "BPM"
            endif
            
            
    
    elseif  kBPMHost==1 then
            
            kBPM        chnget  "HOST_BPM"
            
    endif
    
    if  kBPMManual==1 || kBPMHost==1    then
    
        aTime   subdivision     kFree, kBPM
            
    elseif  kFreeButt==1  || kSampButt==1   then
    
            aTime   =   kFree
            
    elseif  kTapMsButton==1 then

            kTap        chnget  "tap"
            kPrevTime   init    0
            kTapMs      init    0
            kTaps[]     init    8
            
            kTapped     changed kTap
            
            if  kTapped==1  then
                kCurrTime   timeinsts
                kTimeDiff   =   kCurrTime-kPrevTime
                kPrevTime   timeinsts
            endif
            
            kTapMs  taps    kTimeDiff, kFree
            
            if  kTimeDiff<3 then
                chnset  kTapMs, "time"
            endif 
            
            aTime   =   kTapMs
        
    endif


    kTape       chnget  "tape"
    
    if  kTape==1    then
    
        aTime   tape    aTime
    
    endif
                
    kDepth      init    0
    kDepth 	    chnget 	"depth"		;Intensidad de la modulación (0-1).
    
    if  kDepth=0    then
        chnset  "active(0)","outlineIdent"
        chnset  "visible(0)", "outlineIdent"
        aVar    =   aTime
    endif
    
    
    if  kDepth>0    then
        
        aVar    timeLFO aTime, kDepth
       
        chnset  k(aVar), "outline"

    endif 



	/*Para Jitter Spline, opcode de variación al azar.
	Jitter Spline se aplica al tempo del delay para generar un efecto de cinta vintage.*/
	kAnaKnob    chnget  "analogKnob"
	
	kLoFi       chnget  "lofi"
	
	
	if  kAnaKnob>0 then    ;Botón para apagar o encender Jitter.	        
	    aVar    analogJitter    aVar, kAnaKnob
	endif
	
	kSawUp      chnget  "sawUp"
	kShowDual   chnget  "showDual"
	
    kPing       chnget       "pingPong"

	if      kPing==0  &&  kSampButt==0 && kDepth>0 && kSawUp==1 then
	        aDelL, aDelR    pitchShift  aIn, aIn, kFdbk, aVar, iMax, iWindow    
	    if  kShowDual==1    then
        	chnset "visible(1)", "dualDelIdent"
        else
            chnset  "visible(0)", "dualDelIdent"
        endif
    elseif  kPing==0  &&  kSampButt==0  then
            aDelL, aDelR   vdelayxws	aIn + aDelL*kFdbk, aIn + aDelL*kFdbk, aVar, iMax, iWindow
            chnset "visible(0)", "dualDelIdent"
    elseif  kPing==0  &&  kSampButt==1  then
            aDelL, aDelR   sampleDelay aIn + aDelL*kFdbk, aIn + aDelR*kFdbk, aVar, iMax, iWindow
            chnset "visible(0)", "dualDelIdent"
	elseif  kPing==1  &&  kSampButt==0  then
	        aDelL, aDelR   pingPong    aIn, kFdbk, aVar, iMax, iWindow
	        chnset "visible(0)", "dualDelIdent"
    elseif  kPing==1  &&  kSampButt==1  then
            aDelL, aDelR   samplePing  aIn, kFdbk, aVar, iMax, iWindow
            chnset "visible(0)", "dualDelIdent"
    endif
    
    if  kLoFi==1    then
        aDelL, aDelR    lofi    aDelL, aDelR
    endif
	
	if  kAnaKnob>0 then ;Botón para apagar o encender Jitter.	        
	        aDelL, aDelR     saturator       aDelL, aDelR, kAnaKnob
	endif
	
	kFiltLink   chnget  "filterLink"
	kHPCf	    chnget  "HPF"       ;Perilla de frecuencia de corte para filtro de paso alto.
    kLPCf	    chnget 	"LPF" 	    ;Perilla de frecuencia de corte para filtro de paso bajo.
	
    if  kHPCf>$LOWTHRESH || kLPCf<$HITHRESH  then
	        aDelL, aDelR filters aDelL, aDelR, kFiltLink, kHPCf, kLPCf
	endif

	kDryWet chnget  "dryWet"							

	aMixL 	ntrpol 	aIn, aDelL, kDryWet 
	aMixR 	ntrpol 	aIn, aDelR, kDryWet 
       
    kOutput chnget  "output"
    
    kInvL    chnget  "invLeft"
    kInvR   chnget  "invRight"
    
    if  kInvL==1    then
        kPolL   =   -1
    else
        kPolL   =   1
    endif
    
    if  kInvR==1    then
        kPolR   =   -1
    else
        kPolR   =   1
    endif    
      		
	outs	aMixL*kOutput*kPolL, aMixR*kOutput*kPolR	;Salidas del plugin.

endin 


</CsInstruments>
<CsScore>

;Corre el instrumento "Mod Delay" infinitamente.
i 	"ModDelay" 	0 	z 

</CsScore>
</CsoundSynthesizer>