function MostrarDescripcion(idArt){
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/VerDescripcionJugador',
        data: {IdArtista : idArt},
        success:
            function (response){
                $('#Descripcion').html(response.descripcion);
            }
    })
}

