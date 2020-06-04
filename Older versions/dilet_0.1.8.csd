<Cabbage>  bounds(0, 0, 0, 0)

form    caption("dilet") size(725,300), colour(50, 0, 50), pluginid("dilt"), guirefresh(10), bundle("./Assets", "./Opcodes", "modDelay_1.1.8.snaps"), titlebarcolour(50, 0, 50)
groupbox bounds(100, 76, 220, 170), text("Dual Delays"), popup(1), colour(50, 0, 50), visible(0), identchannel("dualDelIdent") {
image   bounds(37, 60, 45, 25), file("Assets/delay1.png")
image   bounds(137, 60, 45, 25), file("Assets/delay2.png")
rslider bounds(10, 25, 100, 100), channel("delay1"), range(0, 4, 0, 0.5, 0.001), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0)
rslider bounds(110, 25, 100, 100), channel("delay2"), range(0, 4, 0, 0.5, 0.001), trackercolour(255, 0, 204, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0)
hslider bounds(60, 140, 110, 20), channel("ABfader"), range(-1, 1, 0, 1, 0.001), trackercolour(204, 255, 0, 255)
}

label bounds(30, 205, 60, 15), text("Beta 0.1")
;Controles de BPM, tiempo libre y botón de sincronización de tempo:
button  bounds(15, 35, 90, 90), channel("tap"), latched(1), text(""), imgfile("Off", "Assets/nicoOff.png"), imgfile("On", "Assets/nicoOn.png")
label   bounds(15, 130, 90, 16), text("Tap")
image   bounds(28, 130, 65, 16), file("Assets/tap.png") 
image   bounds(8, 220, 100, 50), file("Assets/logo.png")
image   bounds(153, 70, 80, 40), file("Assets/time.png")
image   bounds(527, 75, 80, 20), file("Assets/feedback.png")
image   bounds(135, 216, 40, 20), file("Assets/rate.png")
image   bounds(215, 216, 40, 20), file("Assets/depth.png")
image   bounds(362, 220, 45, 25), file("Assets/BPM.png")
image   bounds(465, 216, 40, 20), file("Assets/HPF.png")
image   bounds(575, 216, 40, 20), file("Assets/LPF.png")
image   bounds(662, 215, 40, 20), file("Assets/analog.png")
image   bounds(661, 119, 40, 20), file("Assets/out.png")
image   bounds(662, 33, 40, 20), file("Assets/dryWet.png")
combobox    bounds(120, 165, 70, 20), channel("combobox"), populate("*.snaps")
filebutton  bounds(195, 165, 70, 20), channel("filebutton"), text("Save preset"), mode("snapshot"), svgfile("Off", "savePresetOff.svg"), svgfile("On", "savePresetOn.svg")
button  bounds(275, 10, 40, 20), channel("tape"), text(""), imgfile("Off", "Assets/tapeOff.png"), imgfile("On", "Assets/tapeOn.png")
rslider bounds(335, 190, 100, 100), channel("BPM"), range(20, 200, 120, 1, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(110, 10, 165, 165), channel("outline"), identchannel("outlineIdent"), range(0.001, 4, 0.5, 0.5, 0.001), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), trackeroutsideradius(1), markercolour(0,0,0,0), colour(50, 0, 50, 0)
rslider bounds(110, 10, 165, 165), channel("time"), range(0.001, 4, 0.5, 0.5, 0.001), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), markercolour(0, 0, 0, 0), trackeroutsideradius(0.95), colour(50, 0, 50, 0)
rslider bounds(485, 10, 165, 165), channel("feedback"), range(0, 1, 0.33, 1, 0.01), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
button bounds(275, 160, 40, 20), channel("BPMManual"), text(""), imgfile("Off", "Assets/BPMoff.png"), imgfile("On", "Assets/BPMon.png"), radiogroup("1")
button bounds(317, 160, 40, 20), channel("BPMHost"), text("") imgfile("Off", "Assets/hostOff.png"), imgfile("On", "Assets/hostOn.png"), radiogroup("1")
button bounds(359, 160, 40, 20), channel("freeTime"), text(""), imgfile("Off", "Assets/msOff.png"), imgfile("On", "Assets/msOn.png"),  radiogroup("1"), value(1)
button  bounds(401, 160, 40, 20), channel("msTap"), text(""), imgfile("Off", "Assets/tapOff.png"), imgfile("On", "Assets/tapOn.png"), radiogroup("1")
button  bounds(443, 160, 42, 20), channel("samples"), text(""), imgfile("Off", "Assets/sampleOff.png"), imgfile("On", "Assets/sampleOn.png"), radiogroup("1")
nslider bounds(275, 35, 210, 100), colour(25, 0, 25), fontcolour(204, 255, 0, 255), channel("timeDisp"), identchannel("timeDispIdent"), range(1, 4000, 500, 0.5, 1)

;Botones de subdivisión de tiempo:
button bounds(275, 140, 28, 18), channel("whole"), text(""), imgfile("Off", "Assets/wholeNoteOff.png"), imgfile("On", "Assets/wholeNoteOn.png"), radiogroup("2")
button bounds(305, 140, 28, 18), channel("half"), text(""), imgfile("Off", "Assets/halfNoteOff.png"), imgfile("On", "Assets/halfNoteOn.png"), radiogroup("2")
button bounds(335, 140, 28, 18), channel("quarter"), text(""), imgfile("Off", "Assets/quarterNoteOff.png"), imgfile("On", "Assets/quarterNoteOn.png"), radiogroup("2")
button bounds(365, 140, 28, 18), channel("eighth"), text(""), imgfile("Off", "Assets/eighthNoteOff.png"), imgfile("On", "Assets/eighthNoteOn.png"), radiogroup("2")
button bounds(395, 140, 28, 18), channel("sixteenth"), text(""), imgfile("Off", "Assets/sixteenthNoteOff.png"), imgfile("On", "Assets/sixteenthNoteOn.png"), radiogroup("2")
button bounds(425, 140, 28, 18), channel("dot"), text(""), imgfile("Off", "Assets/dottedOff.png"), imgfile("On", "Assets/dottedOn.png")
button bounds(455, 140, 30, 18), channel("triplet"), text(""), imgfile("Off", "Assets/tripletOff.png"), imgfile("On", "Assets/tripletOn.png")

;Botones de forma de LFO:
rslider bounds(110, 190, 90, 90), channel("rate"), range(0, 20, 0, 1, 0.01)trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(190, 190, 90, 90), channel("depth"), range(0, 1, 0, 0.5, 0.001), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
button bounds(280, 190, 20, 18), channel("sine"), value(1), text(""), imgfile("Off", "Assets/sineOff.png"), imgfile("On", "Assets/sineOn.png"), radiogroup("3")
button bounds(280, 210, 20, 18), channel("triangle"), text(""), imgfile("Off", "Assets/triangleOff.png"), imgfile("On", "Assets/triangleOn.png") , radiogroup("3")
button bounds(280, 230, 20, 18), channel("sawUp"), text(""), imgfile("Off", "Assets/sawOff.png"), imgfile("On", "Assets/sawOn.png"), radiogroup("3")
button bounds(280, 260, 20, 20), channel("showDual"), text(""), imgfile("Off", "Assets/dualOff.png"), imgfile("On", "Assets/dualOn.png")
label bounds(315, 190, 60, 12), text("LFO Shape"), align("left"), fontcolour(255, 255, 255, 255), rotate(1.5708, 0, 0)


;Perilla para efecto analógico:
rslider bounds(640, 190, 85, 85), channel("analogKnob"), range(0, 1, 0, 1, 0.01), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)

;Controles para el filtro y efecto de LoFi:
rslider bounds(440, 190, 90, 90), channel("HPF"), identchannel("HPFident"), range(20, 20000, 20, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(550, 190, 90, 90), channel("LPF"), identchannel("LPFident"), range(20, 20000, 20000, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
encoder bounds(510, 195, 60, 60), channel("filterLink"), text("Link"), increment(1), trackercolour(0, 0, 0), colour(90, 70, 90)
button  bounds(30, 160, 60, 25), text(""), channel("lofi"), imgfile("Off", "Assets/lofiOff.png"), imgfile("On", "Assets/lofiOn.png")

;Controles para ping-pong:
button bounds(340, 10, 80, 20), channel("pingPong"), text(""), imgfile("Off", "Assets/pingPongOff.png"), imgfile("On", "Assets/pingPongOn.png")
button bounds(317, 10, 21, 20), channel("invLeft"), text(""), imgfile("Off", "Assets/phaseOff.png"), imgfile("On", "Assets/phaseOn.png")
button bounds(422, 10, 21, 20), channel("invRight"), text(""), imgfile("Off", "Assets/phaseOff.png"), imgfile("On", "Assets/phaseOn.png")
button bounds(445, 10, 40, 20), channel("about"), text(""), imgfile("Off", "Assets/aboutOff.png"), imgfile("On", "Assets/aboutOn.png")

;Perilla de relación entre efecto y señal original, así como ganancia de salida:
rslider bounds(640, 10, 85, 85), channel("dryWet"), range(0, 1, 0.5, 1, 0.01), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)
rslider bounds(640, 95, 85, 85), channel("output"), range(0, 2, 2, 1, 0.01), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), valuetextbox(1), markercolour(0, 0, 0, 0), colour(50, 0, 50, 0), textboxoutlinecolour(0, 0, 0, 0)



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


#include    "Opcodes/BPMCalc.txt"
#include    "Opcodes/analogJitter.txt"
#include    "Opcodes/saturator.txt"
#include    "Opcodes/filters.txt"
#include    "Opcodes/pingPong.txt"
#include    "Opcodes/tape.txt"
#include    "Opcodes/lofi.txt"
#include    "Opcodes/subdivision.txt"
#include    "Opcodes/taps.txt"
#include    "Opcodes/timeLFO.txt"
#include    "Opcodes/sampleDelay.txt"
#include    "Opcodes/samplePing.txt"
#include    "Opcodes/pitchShift.txt"


instr		ModDelay


	aInL    inch 	1 		;Entrada de audio del plugin.
	aInR    inch 	2 		;Entrada de audio del plugin.

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
	        aDelL, aDelR    pitchShift  aInL, aInR, kFdbk, aVar, iMax, iWindow    
	    if  kShowDual==1    then
        	chnset "visible(1)", "dualDelIdent"
        else
            chnset  "visible(0)", "dualDelIdent"
        endif
        
    elseif  kPing==0  &&  kSampButt==0  then
            aDelL, aDelR   vdelayxws	aInL + aDelL*kFdbk, aInR + aDelR*kFdbk, aVar, iMax, iWindow
            chnset "visible(0)", "dualDelIdent"
    elseif  kPing==0  &&  kSampButt==1  then
            aDelL, aDelR   sampleDelay aInL + aDelL*kFdbk, aInR + aDelR*kFdbk, aVar, iMax, iWindow
            chnset "visible(0)", "dualDelIdent"
	elseif  kPing==1  &&  kSampButt==0  then
	        aDelL, aDelR   pingPong    aInL*0.5+aInR*0.5, kFdbk, aVar, iMax, iWindow
	        chnset "visible(0)", "dualDelIdent"
    elseif  kPing==1  &&  kSampButt==1  then
            aDelL, aDelR   samplePing  aInL*0.5+aInR*0.5, kFdbk, aVar, iMax, iWindow
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

	aMixL 	ntrpol 	aInL, aDelL, kDryWet 
	aMixR 	ntrpol 	aInR, aDelR, kDryWet 
       
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
;    outs    aInL, aInR

endin 


</CsInstruments>
<CsScore>

;Corre el instrumento "Mod Delay" infinitamente.
i 	"ModDelay" 	0 	z 

</CsScore>
</CsoundSynthesizer>