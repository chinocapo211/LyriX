function MostrarDescripcion(idArt){
    $.ajax({
        type: 'POST',
        dataType: 'JSON',
        url: '/Home/VerDescripcionJugador',
        data: {IdArtista : idArt},
        success:
            function (response){
                $('#NombreJugador').html(response.nombre);
                $('#Descripcion').html(response.descripcion);
                $('#FotoDescripcion').html(response.fotoDescripcion);
            }
    })
}

