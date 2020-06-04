<Cabbage>  bounds(0, 0, 0, 0)

form    caption("Mod Delay") size(725,300), colour(28,69,135), pluginid("modDelay"), guirefresh(10)
groupbox bounds(100, 76, 220, 170), text("Dual Delays"), popup(1), colour(28, 69, 135), visible(0), identchannel("dualDelIdent") {
rslider bounds(10, 25, 100, 100), channel("delay1"), range(0, 4, 0, 0.5, 0.001), text("Delay 1"), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0)
rslider bounds(110, 25, 100, 100), channel("delay2"), range(0, 4, 0, 0.5, 0.001), text("Delay 2"), trackercolour(255, 0, 204, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0)
hslider bounds(60, 140, 110, 20), channel("ABfader"), range(-1, 1, 0, 1, 0.001)
}

;Controles de BPM, tiempo libre y botón de sincronización de tempo:
button  bounds(15, 35, 90, 90), channel("tap"), text("NICO"), channel("tap"), latched(1), colour:0(0,0,0), colour:1(0,0,0)
label   bounds(15, 130, 90, 16), text("Tap")
label   bounds(15, 220, 90, 40), text("Dilet")
button  bounds(275, 10, 40, 20), channel("tape"), text("Tape"), colour:1(255, 0, 0), colour:0(0, 0, 0), tofront(1)
rslider bounds(335, 190, 100, 100), channel("BPM"), range(20, 200, 125, 1, 1), text("BPM"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
rslider bounds(110, 10, 170, 170), channel("outline"), identchannel("outlineIdent"), range(0.001, 4, 0.5, 0.5, 0.001), text("Time"), trackercolour(0, 204, 255, 255), outlinecolour(0, 0, 0, 0), textcolour(0,0,0,0), trackeroutsideradius(1), markercolour(0,0,0,0)
rslider bounds(110, 10, 170, 170), channel("time"), range(0.001, 4, 0.5, 0.5, 0.001), text("Time"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), markercolour(0, 0, 0, 0), trackeroutsideradius(0.95)
rslider bounds(480, 10, 170, 170), channel("feedback"), range(0, 1, 0.33, 1, 0.01), text("Feedback"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
button bounds(275, 160, 42, 20), channel("BPMManual"), text("BPM", "BPM"), , colour:1(255, 0, 0, 255), outlinecolour(0, 0, 0, 0) , radiogroup("1")
button bounds(317, 160, 42, 20), channel("BPMHost"), text("Host", "Host"), , colour:1(255, 0, 0, 255), outlinecolour(0, 0, 0, 0) , radiogroup("1")
button bounds(359, 160, 42, 20), channel("freeTime"), text("ms", "ms"), , colour:1(255, 0, 0, 255), outlinecolour(0, 0, 0, 0),  radiogroup("1"), value(1)
button  bounds(401, 160, 42, 20), channel("msTap"), text("Tap"), colour:1(0, 0, 255), colour:0(0,0,0), outlinecolour(0,0,0,0), radiogroup("1")
button  bounds(443, 160, 42, 20), channel("samples"), text("SR"), colour:1(0, 255, 0), colour:0(0, 0, 0), outlinecolour(0, 0, 0, 0), radiogroup("1")
nslider bounds(275, 35, 210, 100), colour(28, 69, 135), fontcolour(204, 255, 0, 255), channel("timeDisp"), identchannel("timeDispIdent"), range(1, 4000, 500, 0.5, 1)

;Botones de subdivisión de tiempo:
button bounds(275, 140, 30, 20), channel("whole"), text("W", "W"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(305, 140, 30, 20), channel("half"), text("H", "H"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(335, 140, 30, 20), channel("quarter"), text("Q", "Q"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(365, 140, 30, 20), channel("eighth"), text("E", "E"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(395, 140, 30, 20), channel("sixteenth"), text("S", "S"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), , radiogroup("2")
button bounds(425, 140, 30, 20), channel("dot"), text(".", "."), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), 
button bounds(455, 140, 30, 20), channel("triplet"), text("3", "3"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), 

;Botones de forma de LFO:
rslider bounds(110, 190, 100, 100), channel("rate"), range(0, 20, 4, 1, 0.01), text("LFO Rate"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
rslider bounds(190, 190, 100, 100), channel("depth"), range(0, 1, 0, 1, 0.001), text("LFO Depth"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
button bounds(280, 190, 20, 20), channel("sine"), value(1), text("s", "s"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 210, 20, 20), channel("triangle"), text("t", "t"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 230, 20, 20), channel("sawUp"), text("u", "u"), , colour:1(0, 0, 255, 255), outlinecolour(0, 0, 0, 0), radiogroup("3")
button bounds(280, 260, 20, 20), channel("showDual"), text("d"), colour:1(0, 255, 0, 255), outlinecolour(0, 0, 0, 0)
label bounds(315, 190, 60, 12), text("LFO Shape"), align("left"), fontcolour(255, 255, 255, 255), rotate(1.5708, 0, 0)


;Perilla para efecto analógico:
rslider bounds(635, 195, 90, 90), channel("analogKnob"), range(0, 1, 0, 1, 0.01), text("Analog"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)

;Controles para el filtro y efecto de LoFi:
rslider bounds(440, 190, 100, 100), channel("HPF"), identchannel("HPFident"), text("HPF"), range(20, 20000, 20, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
rslider bounds(550, 190, 100, 100), channel("LPF"), identchannel("LPFident"), text("LPF"), range(20, 20000, 20000, 0.375, 1), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
encoder bounds(515, 210, 60, 60), channel("filterLink"), text("link"), increment(1)
button  bounds(30, 160, 60, 25), text("LoFi"), channel("lofi"), colour:1(255,0,0), colour:0(0,0,0)

;Controles para ping-pong:
button bounds(340, 10, 80, 20), channel("pingPong"), text("Ping-Pong", "Ping-Pong"), colour:1(255, 165, 0, 255), outlinecolour(0, 0, 0, 0)
button bounds(317, 10, 21, 20), channel("invLeft"), text("L"), colour:1(0, 255, 0, 255), colour:0(0, 0, 0, 255), outlinecolour(0, 0, 0, 0)
button bounds(422, 10, 21, 20), channel("invRight"), text("R"), colour:1(0, 255, 0, 255), colour:0(0, 0, 0, 255), outlinecolour(0, 0, 0, 0)

;Perilla de relación entre efecto y señal original, así como ganancia de salida:
rslider bounds(635, 10, 90, 90), channel("dryWet"), range(0, 1, 0.5, 1, 0.01), text("Dry/Wet"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)
rslider bounds(635, 95, 90, 90), channel("output"), range(0, 50, 50, 1, 1), text("Output"), trackercolour(204, 255, 0, 255), outlinecolour(0, 0, 0, 0), textcolour(255, 255, 255, 255), valuetextbox(1), markercolour(0, 0, 0, 0)



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


opcode  analogJitter, a, ak

    aTime, kKnob    xin

	kHzMin 	= 	2 	;Tasa de variación mínima en Hertz.
	kHzMax 	=	16 	;Tasa de variación máxima en Hertz.
	kJitAmp	=	aTime*(kKnob*0.0035)

	kJit 	jspline kJitAmp, kHzMin, kHzMax ;Opcode jspline (Jitter Spline).
	aJit 	= 		kJit
	;Inclusión de Jitter para variable de tiempo
	aOut    = 		aTime + aJit
	
	        xout    aOut

endop


opcode  saturator, aa, aak

    aInL, aInR, kKnob        xin
    
    iFunc   =       1
    iStart  =       0
    iSize   =       65537
   	kSat 	= 		kKnob*0.25
	iTan 	= 		0.5
	iPoles  =       3
	
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

	aShapeL 	distort	    aInL, kSat, iTrans
	aShapeR 	distort	    aInR, kSat, iTrans
	aCompL      compress    aShapeL, aShapeL, kThresh, kLoKnee, kHiKnee, kRatio, kAtt, kRel, iLook
	aCompR      compress    aShapeR, aShapeR, kThresh, kLoKnee, kHiKnee, kRatio, kAtt, kRel, iLook
	aHPFL       atonex      aCompL*kMakeUp, kHPCf, iPoles
	aHPFR       atonex      aCompR*kMakeUp, kHPCf, iPoles
	aLPFL       tonex       aHPFL, kLPCf, iPoles
	aLPFR       tonex       aHPFR, kLPCf, iPoles
     		    xout 	    aLPFL, aLPFR

endop


opcode  filters, aa, aakkk

    aInL, aInR, kFiltLink, kHPCf, kLPCf  xin    
    
    kChange     changed kFiltLink
    kComp[]     init    2
    kComp[1]    =       kComp[0]
    kComp[0]    =       kFiltLink
      
    kHPAbs          =       abs(kHPCf)
    kLPAbs          =       abs(kLPCf)
    kHPLinkPlus     =       kHPAbs+(sqrt(kHPAbs)*$ACCEL)
    kHPLinkMinus    =       kHPAbs-(sqrt(kHPAbs)*$ACCEL)
    kLPLinkPlus     =       kLPAbs+(sqrt(kLPAbs)*$ACCEL)
    kLPLinkMinus    =       kLPAbs-(sqrt(kLPAbs)*$ACCEL)
    kHPLimitPlus    limit   kHPLinkPlus, $LOWTHRESH, $HITHRESH
    kLPLimitPlus    limit   kLPLinkPlus, $LOWTHRESH, $HITHRESH
    kHPLimitMinus   limit   kHPLinkMinus, $LOWTHRESH, $HITHRESH
    kLPLimitMinus   limit   kLPLinkMinus, $LOWTHRESH, $HITHRESH
    
    if  kChange==1    then
        if      (kLPCf=$HITHRESH && kComp[0]>kComp[1])  ||  \
                (kHPCf=$LOWTHRESH && kComp[0]<kComp[1]) ||  \
                (kHPCf=$HITHRESH && kComp[0]>kComp[1])  ||  \
                (kLPCf=$LOWTHRESH && kComp[0]<kComp[1]) then
        
        elseif  (kLPCf=$HITHRESH && kComp[0]<kComp[1])  ||  \
                (kHPCf=$HITHRESH && kComp[0]<kComp[1])  ||  \
                (kComp[0]<kComp[1])                     then
        
            chnset  kHPLimitMinus, "HPF"
            chnset  kLPLimitMinus, "LPF"
        
        elseif  (kHPCf=$LOWTHRESH && kComp[0]>kComp[1]) ||  \
                (kLPCf=$LOWTHRESH && kComp[0]>kComp[1]) ||  \
                (kComp[0]>kComp[1])                     then
        
            chnset  kHPLimitPlus, "HPF"
            chnset  kLPLimitPlus, "LPF"
            
        endif           
    endif
	
	iPoles  =       3

	;Filtro de estado variable. 	
	aHPFL 	atonex 	aInL,  kHPCf, iPoles
	aHPFR 	atonex 	aInR,  kHPCf, iPoles
	aLPFL 	tonex 	aHPFL,  kLPCf, iPoles
	aLPFR 	tonex 	aHPFR,  kLPCf, iPoles
	        xout    aLPFL, aLPFR

endop


opcode  pingPong, aa, akaii

    aDelL   init        0
    aDelR   init        0
    
    aIn, kFdbk, aVar, iMax, iWindow      xin
    
    aDelL 	vdelayxw	aIn + aDelR*kFdbk*0.5, aVar, iMax, iWindow
	aDelR 	vdelayxw	aDelL*kFdbk*1.5, aVar, iMax, iWindow
	
	        xout        aDelL, aDelR

endop


opcode  tape,    a, a

    setksmps    1
    
    aTime       xin
    
    kTimeOut    port    k(aTime), 0.06, -1
    
                xout    a(kTimeOut)

endop


opcode  lofi,    aa, aa

    aInL, aInR  xin
    
    kCf     =   5000
    iPoles  =   6
    
    aOutL    tonex  aInL, kCf, iPoles
    aOutR    tonex  aInR, kCf, iPoles
    
    
            xout    aOutL, aOutR
   
endop


opcode      subdivision, a, kk 

            kFree, kBPM       xin
            
            iDump       init    0
            
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
            
            chnset  k(aTime)*1000, "timeDisp" 
            
                    xout    aTime

endop


opcode  taps,    k, kk

    kTwoTaps, kBPM    xin
    
    kTempoChange    changed kTwoTaps
            
            kTaps[]         init    8
             
            if  kTempoChange==1 then
                kTaps[7]    =   kTaps[6]
                kTaps[6]    =   kTaps[5]
                kTaps[5]    =   kTaps[4]
                kTaps[4]    =   kTaps[3]
                kTaps[3]    =   kTaps[2]
                kTaps[2]    =   kTaps[1]
                kTaps[1]    =   kTaps[0]
            endif
            
                kTaps[0]    =   kTwoTaps
            
            if      kTaps[0]=0  then
                kTapTempo   =   kBPM
            elseif  kTaps[1]=0  then
                kTapTempo   =   kTaps[0]
            elseif  kTaps[2]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1])/2
            elseif  kTaps[3]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1]+kTaps[2])/3
            elseif  kTaps[4]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1]+kTaps[2]+kTaps[3])/4
            elseif  kTaps[5]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1]+kTaps[2]+kTaps[3]+kTaps[4])/5
            elseif  kTaps[6]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1]+kTaps[2]+kTaps[3]+kTaps[4] \
                                +kTaps[5])/6
            elseif  kTaps[7]=0  then
                kTapTempo   =   (kTaps[0]+kTaps[1]+kTaps[2]+kTaps[3]+kTaps[4] \
                                +kTaps[5]+kTaps[6])/7
            elseif  kTaps[7]!=0     then
                kTapTempo   =   (kTaps[7]+kTaps[6]+kTaps[5]+kTaps[4]+kTaps[3] \
                                +kTaps[2]+kTaps[1]+kTaps[0])/8
            endif

                        xout    kTapTempo

endop


opcode  timeLFO, a, ak


        aTime, kDepth       xin
        
        chnset  "active(1)", "outlineIdent"
        chnset  "visible(1)", "outlineIdent"
        ;Oscilador de frecuencia baja.
        kRate	    chnget  "rate" 		;Frecuencia del oscilador en Hz.
        kSine       chnget  "sine"
        kTri        chnget  "triangle"
        kSqBi       chnget  "squareBi"
        kSqUni      chnget  "squareUni"
        kSawUp      chnget  "sawUp"
        kSawDown    chnget  "sawDown"
	
        kWave   =   (kSine*1)+(kTri*2)+(kSawUp*3)	;Forma de onda del oscilador.
        kMod 	= 	aTime*(kDepth*0.5) 		;Toma el tiempo y lo duplica (máximo) o divide (mínimo).
	
        if      kWave=1     then
            aLFO    lfo	kMod, kRate, 0 	;Oscilador de frecuencia baja en sinusoidal.
        elseif  kWave=2     then
            aLFO	lfo	kMod, kRate, 1 	;Oscilador de frecuencia baja en triángulo.
        elseif  kWave=3     then
            aLFO	lfo	kMod, kRate, 4 	;Oscilador de frecuencia baja en sierra hacia arriba.
        endif	    			
	
        aVar 	= 	aTime + aLFO 	;Conexión entre perilla de tiempo y oscilador.
        
                    xout    aVar
                    
        /*
        Formas de onda del oscilador:
        0 		=			Sinusoidal
        1 		=			Triángulo
        2 		= 			Cuadro bipolar
        3 		= 			Cuadro unipolar
        4 		= 			Sierra hacia arriba
        5 		= 			Sierra hacia abajo
	    */

endop



opcode  sampleDelay, aa, aaaii

    

    aInL, aInR, aVar, iMax, iWindow  xin

    aDel    =   1/sr
    aTime   =   aVar*1000
 
    aDelL, aDelR    vdelayxws	aInL, aInR, aDel*aTime, iMax, iWindow
      
                    xout    aDelL, aDelR


endop


opcode  samplePing, aa, akaii

    aIn, kFdbk, aVar, iMax, iWindow  xin
    
    aDelL   init    0
    aDelR   init    0

    aDel    =   1/sr
    aTime   =   aVar*1000
 
    aDelL    vdelayxw	aIn + aDelR*kFdbk*0.5, aDel*aTime, iMax, iWindow
    aDelR    vdelayxw	aDelL*kFdbk*1.5, aDel*aTime, iMax, iWindow
      
                    xout    aDelL, aDelR


endop


opcode 	pitchShift, aa, aakaii
	
	setksmps	1
																				
	aInL, aInR, kFdbk, aVar, iMax, iWin	xin
	
	kRate       chnget  "rate"
	
	iWindow     ftgen   1, 0, 16384, 20, 3
	iTriangle   ftgen   2, 0, 257, 7, 1, 128, -1, 128, 1
	
	aMixL       init    0
	aMixR       init    0

	kDelRate 	=		(kRate-1)/aVar

	avDel1		phasor 	-kDelRate
	avDel2		phasor	-kDelRate, 0.5
	aFade1		tablei	avDel1, iWindow, 1, 0, 1
	aFade2		tablei	avDel2, iWindow, 1, 0, 1
				
    aDel1L, aDel1R    vdelayxws  aInL+aMixL*(kFdbk*0.5), aInR+aMixR*(kFdbk*0.5), avDel1*aVar, iMax, iWin
    chnset  k(avDel1*aVar), "delay1"
    aDel2L, aDel2R    vdelayxws  aInR+aMixR*(kFdbk*0.5), aInR+aMixR*(kFdbk*0.5), avDel2*aVar, iMax, iWin
    chnset  k(avDel2*aVar), "delay2"
    aMixL       =       aDel1L*aFade1+aDel2L*aFade2
    aMixR       =       aDel1R*aFade1+aDel2R*aFade2
    
    
    kFadeLFO    oscil   1, kDelRate, iTriangle
    
    chnset  kFadeLFO, "ABfader"
    																			
				xout	aMixL, aMixR
							
endop


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