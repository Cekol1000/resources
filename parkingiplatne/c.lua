parkingi_wlaczone = true --możesz włączać i wyłączać parkingi płatne z powodu np świąt taki o event 
cena_parkingu = 150 -- tutaj edytujesz cene 
local parkingspawn = createColCuboid(2409.16, 2312.35, 9.82, 8.33, 29.47, 5.01)
local parkingprzecho = createColCuboid(1960.21, 2408.53, 9.82, 51.63, 6.92, 5.32)
--ponizszy kod odpowiada za parking obok spawnu LV
localPlayer = getLocalPlayer ( )
oplata = 0 

function wjazdparking(theElement,matchingDimension)
 if ( theElement == localPlayer ) and isPlayerInVehicle ( localPlayer ) and parkingi_wlaczone == true then
 local portfel = getPlayerMoney ( )
  function naliczanie()
oplata = cena_parkingu
end
triggerEvent("notka",localPlayer,"Wjeżdzasz w strefe płatnego parkingu,będą naliczanie opłaty!")
function poczasie()
triggerEvent("notka",localPlayer,"Maksymalny czas darmowego postoju wynosi dwie minuty, po tym czasie zostanie naliczona dodatkowa opłata w wysokości: "..cena_parkingu.."$")
end 
setTimer(poczasie, 2000, 1) 
oplata = 0
 

setTimer(naliczanie, 120000, 1) 
end 
end 





function wyjazdparking(theElement,matchingDimension)
 if ( theElement == localPlayer ) and isPlayerInVehicle( localPlayer ) and parkingi_wlaczone == true  then
triggerEvent("notka",localPlayer,"Wyjeżdzasz ze strefy płatnego parkowania,opłaty zostały pobrane w wysokości: "..oplata.."$")
takePlayerMoney(oplata)
end 
end 


addEventHandler ("onClientColShapeHit", parkingspawn, wjazdparking)
addEventHandler("onClientColShapeLeave", parkingspawn, wyjazdparking)





--=====================================================================================================================






