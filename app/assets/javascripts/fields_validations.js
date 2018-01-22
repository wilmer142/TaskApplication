$("#activity_hours").keydown(function (e) {
    // Permite las teclas: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
         // Permite las combinaciones: Ctrl+A, Command+A
        (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
         // permite los botones: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
             return;
    }
    // Valida que el caracter ingresado como codigo ascii se encuntre entre el rango permitido
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});