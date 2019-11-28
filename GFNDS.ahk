^j:: ;включается ctrl + j
start()
{
    ;time
    Min := 150000 ;минимальный порог времени 2 минуты 3 секунд
    Max := 300000 ;максимальный порог времени 5 минут
    Random, Time, Min, Max ;генерация времени срабатывания
    
    ;mouse
    MouseMin := -100 ;минимальное смещение
    MouseMax := 100 ;максимальное смещение
    Random, diff, MouseMin, MouseMax ;генерация смещения
    MouseGetPos, mouseX, mouseY ;получение позиции мыши
    mouseX -= diff ;новая позиция мыши по x
    Random, diff, MouseMin, MouseMax ;генерация смещения
    mouseY -= diff ;новая позиция мыши по y

    ;process
    Sleep, Time ;остановка скрипта на сгенерированное время
    MouseMove, mouseX, mouseY ;применение параметров к мыши
    start()
    return
}
return
Esc::Reload  ;выключается esc