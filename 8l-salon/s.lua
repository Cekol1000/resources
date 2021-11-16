local cyganpojazdyid ={
{404,"perennial",1300},
{418,"moonbeam",900}
}

local cyganpojazdygp ={
{-883.92670, 1556.92224, 25.61807},
{-903.60736, 1554.98877, 25.7945},
{-883.20245, 1545.31079, 25.91406},
{-906.59149, 1535.35046, 25.91406}
}
local cyganwiadomosci ={
"Cygan: Kupuj tanio!, jeśli coś zostało bo ten w czarnym koszulku ciągle coś wykupuje.",
"Cygan: Co chcesz?!, kupuj auto i zjeżdżaj,to nie hotel!",
"Cygan: Mówili mi że przebiegu nie da się zmniejszyć... a jednak.",
"Cygan: Ledwo te wozy jeżdżą, ale jak chcesz to kupuj.",
"Cygan: W tym dużym,kiedyś mi policja przebiła opony.",
"Cygan: Po co taki biznesmen jak ty tu przychodzi?,no okej,nie mój interes.",
"Cygan: Czego tu szukasz?",
"Cygan: Takie nasze wiejskie 'otomoto'..",
"Cygan: Hm,kupiłeś coś?  na chleb potrzebuje..",
"Cygan: Z tego się nie da wyżyć",
"Cygan: 9lajt? uważaj na nich.. lepiej zaczynaj zmieniać hasła do innych portali.",
"Cygan: Auta, auta, tanie auta!",
"Cygan: Rosół w kotle mi się gotuje, ruszaj się!",
"Cygan: Odsuń się..",
"Cygan: Podobno Ci z 9lajt okradli ludzi...",
}

cyganczlowiek=createPed (162, -905.60358, 1543.17419, 25.91406 )
cyganmarkerczlowiek=createMarker (-905.60358, 1543.17419, 25.91406-1, "cylinder", 1.5, 255, 255, 0,0 )



function wyslijwiadomosc()
wiadomosc="nic"
if wiadomosc=="nic" then 
wiadomosc=math.random(1,15)
outputChatBox(cyganwiadomosci[wiadomosc],plr)
wiadomosc=nic
end 
end 
addEventHandler("onMarkerHit",cyganmarkerczlowiek,wyslijwiadomosc)

wybraneid1=math.random(1,2)
wybraneid2=math.random(1,2)
wybranegp1=math.random(1,4) 
wybranegp2=math.random(1,4)

local markerpojazdu1
local markerpojazdu2
local pojazd1
local pojazddodatkowy
local pojazd2
local pojazdpierwszy
local pojazd1status
local pojazd2status
function stworzpojazdy()
pojazd1=createVehicle(cyganpojazdyid[wybraneid1][1],cyganpojazdygp[wybranegp1][1],cyganpojazdygp[wybranegp1][2],cyganpojazdygp[wybranegp1][3],0,0,210)
markerpojazdu1=createMarker (cyganpojazdygp[wybranegp1][1],cyganpojazdygp[wybranegp1][2],cyganpojazdygp[wybranegp1][3]-1, "cylinder", 3.5, 255, 255, 0,0 )
setElementFrozen (pojazd1,true)
setVehicleLocked(pojazd1,true)  
addEventHandler("onMarkerHit",markerpojazdu1,function()
outputChatBox("* Jeśli chcesz kupić ten pojazd,użyj komendy /kuppojazd", plr)
pojazddodatkowy=false
pojazdpierwszy=true
pojazd2status="brak"
pojazd1status="obecny"
end)
if wybranegp1<wybranegp2 then
pojazd2=createVehicle(cyganpojazdyid[wybraneid2][1],cyganpojazdygp[wybranegp2][1],cyganpojazdygp[wybranegp2][2],cyganpojazdygp[wybranegp2][3],0,0,210)	
setVehicleLocked(pojazd2,true)  
markerpojazdu2=createMarker (cyganpojazdygp[wybranegp2][1],cyganpojazdygp[wybranegp2][2],cyganpojazdygp[wybranegp2][3]-1, "cylinder", 3.5, 255, 255, 0,0 )
setElementFrozen (pojazd2,true)
addEventHandler("onMarkerHit",markerpojazdu2,function()
outputChatBox("* Jeśli chcesz kupić ten pojazd,użyj komendy /kuppojazd", plr)
pojazd2status="obecny"
pojazddodatkowy=true
end)
end       
	end 
addEvent("resppojazd",true)
addEventHandler("resppojazd",root,stworzpojazdy)

nazwapojazdu1=getVehicleNameFromModel(wybraneid1)
nazwapojazdu2=getVehicleNameFromModel(wybraneid2) 
nazwapojazdu1=getVehicleNameFromModel (wybraneid1)
nazwapojazdu2=getVehicleNameFromModel (wybraneid2) 
function kuppojazd(plr)
	if  isElementWithinMarker (plr,markerpojazdu1) then 
	portfel=getPlayerMoney(plr)
	if portfel>1300 then
		outputChatBox("* Zakupiłeś pojazd"..nazwapojazdu1.. "za kwotę "..cyganpojazdyid[1][3].." EUR")
		takePlayerMoney(plr,1300)
	else 
		outputChatBox("Nie")
	end 
	end 
end
function kuppojazd(plr)
	if pojazddodatkowy==true  then 
		if isElementWithinMarker (plr,markerpojazdu2) then 
	nazwapojazdu1=cyganpojazdyid[wybraneid2][2]
		nazwapojazdu2=cyganpojazdyid[wybraneid2][2]
	portfel=getPlayerMoney(plr)
	if portfel>1300 then
		kwota2=cyganpojazdyid[2][3]
		outputChatBox("* Zakupiłeś pojazd "..nazwapojazdu2.. " za kwotę "..kwota2.. " EUR")
		pojazd2status="sprzedany"
		pojazddodatkowy=false
		warpPedIntoVehicle (plr,pojazd2) 
		setVehicleLocked(pojazd2,false)  
		setElementFrozen (pojazd2,false)
		takePlayerMoney(plr,900)
		destroyElement(markerpojazdu2)	
		outputChatBox("* Wciśnij lewy SHIFT aby uruchomić interakcje pojazdu")
	else 
		outputChatBox("* Nie posiadasz wystarczająco gotówki aby kupić ten pojazd!")
	end
	end 	
end 
if  isElementWithinMarker (plr,markerpojazdu1) then 
	    nazwapojazdu1=cyganpojazdyid[wybraneid1][2]
		nazwapojazdu2=cyganpojazdyid[wybraneid2][2]
	portfel=getPlayerMoney(plr)
	if portfel>1300 then
		kwota1=cyganpojazdyid[1][3]
		pojazdpierwszy=false
		destroyElement(markerpojazdu1)
		outputChatBox("* Zakupiłeś pojazd "..nazwapojazdu1.. " za kwotę "..kwota1.." EUR")
		warpPedIntoVehicle (plr,pojazd1) 
		setElementFrozen (pojazd1,false)
		setVehicleLocked(pojazd2,false)  
		takePlayerMoney(plr,1300)
		pojazd1status="sprzedany"	
			outputChatBox("* Wciśnij lewy SHIFT aby uruchomić interakcje pojazdu")
	else 
		outputChatBox("* Nie posiadasz wystarczająco gotówki aby kupić ten pojazd!")
	end 
	end 
	if pojazddodatkowy==false and pojazdpierwszy==false or pojazd2status=="sprzedany" and pojazd1status=="sprzedany" then 
wybraneid1=math.random(1,2)
wybraneid2=math.random(1,2)
wybranegp1=math.random(1,4) 
wybranegp2=math.random(1,4)
	setTimer(stworzpojazdy,math.random(30000,1000000),1) --od 30 sekund do 15 minut JEDNOSTKA W MILISEKUNDACH
end 

    end 

 addCommandHandler("kuppojazd",kuppojazd)
addEventHandler("onResourceStart",root,stworzpojazdy)


