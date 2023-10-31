public class Album{
    public int IdAlbum{get;set;}
    public string nombreAlbum{get;set;}
    public string fotoAlbum{get;set;}
    public int IdArtista{get;set;}

    public Album(int idAlb, string nomAlb, string ftAlb, int idArt){
        IdAlbum = idAlb;
        nombreAlbum = nomAlb;
        fotoAlbum = ftAlb;
        IdArtista = idArt;
    }
}