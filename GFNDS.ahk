Started := true
Min := 30000 ;минимальный порог времени 30 сек
Max := 60000 ;максимальный порог времени 1 мин

start(Trusted)
{
    end(false)
    if (Trusted) {
        ToolTip, GFNDS, 100, 100 ;открытие тултипа
    }
    
    Random, Time, Min, Max ;генерация времени срабатывания
    
    Sleep, Time ;остановка скрипта на сгенерированное время
    
    if(Started) {
        MouseMin := -100 ;минимальное смещение
        MouseMax := 100 ;максимальное смещение
        Random, diff, MouseMin, MouseMax ;генерация смещения
        MouseGetPos, mouseX, mouseY ;получение позиции мыши
        mouseX -= diff ;новая позиция мыши по x
        Random, diff, MouseMin, MouseMax ;генерация смещения
        mouseY -= diff ;новая позиция мыши по y
        
        MouseMove, mouseX, mouseY ;применение параметров к мыши
        start(false) ;повтор
    }
    return
}
end(Trusted)
{
    if (Trusted) {
        ToolTip
        Started = false
    }
    return
}

^j::start(true)
^+j::end(true)
return
