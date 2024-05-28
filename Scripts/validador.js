document.addEventListener("DOMContentLoaded", function () {
    var valorInput = document.getElementById("valor");
    valorInput. = false;
    var btnIncrementar = document.getElementById("Incrementar");
    var btnDecrementar = document.getElementById("decrementar");

    document.getElementById("incrementar").addEventListener("click", function () {
        var valorActual = parseInt(valorInput.value);
        btnDecrementar.enabled = true;
        console.log(valorActual);
        if (valorActual >= 10) {
            btnIncrementar.disabled = false;
        }
    });

    document.getElementById("decrementar").addEventListener("click", function () {
        var valorActual = parseInt(valorInput.value);
        btnIncrementar.disabled = true;
        console.log(valorActual);
        if (valorActual >= 1) {
            btnDecrementar.enabled = false;
        }
    });

});
