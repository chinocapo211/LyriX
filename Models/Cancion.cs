public class Canciones{
    public int IdCancion{get;set;}
    public string nombreCancion{get;set;}
    public string audio{get;set;}
    public string fotoCancion{get;set;}
    public int IdArtista{get;set;}
    public int IdAlbum{get;set;}

    public Canciones(int idCan, string nom, string aud, string ftCan, int idArt, int idAlb){
        IdCancion = idCan;
        nombreCancion = nom;
        audio = aud;
        fotoCancion = ftCan;
        IdArtista = idArt;
        IdAlbum = idAlb;
    }

    public Canciones(){
        
    }
}