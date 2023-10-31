class cancion{
    int IdCancion{get;set;}
    string nombreCancion{get;set;}
    string audio{get;set;}
    string fotoCancion{get;set;}
    int IdArtista{get;set;}
    int IdAlbum{get;set;}

    public cancion(int idCan, string nom, string aud, string ftCan, int idArt, int idAlb){
        IdCancion = idCan;
        nombreCancion = nom;
        audio = aud;
        fotoCancion = ftCan;
        IdArtista = idArt;
        IdAlbum = idAlb;
    }
}