public class Albumes{
    public int IdAlbum{get;set;}
    public string nombreAlbum{get;set;}
    public string fotoAlbum{get;set;}
    public int IdArtista{get;set;}

    public Albumes(int idAlb, string nomAlb, string ftAlb, int idArt){
        IdAlbum = idAlb;
        nombreAlbum = nomAlb;
        fotoAlbum = ftAlb;
        IdArtista = idArt;
    }

    public Albumes(){
        
    }
}