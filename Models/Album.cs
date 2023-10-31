class album{
    int IdAlbum{get;set;}
    string nombreAlbum{get;set;}
    string fotoAlbum{get;set;}
    int IdArtista{get;set;}

    public album(int idAlb, string nomAlb, string ftAlb, int idArt){
        IdAlbum = idAlb;
        nombreAlbum = nomAlb;
        fotoAlbum = ftAlb;
        IdArtista = idArt;
    }
}