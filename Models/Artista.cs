public class Artistas{
    public int IdArtista{get;set;}
    public string nombre {get;set;}
    public string instagram{get;set;}
    public string twitter{get;set;}
    public string descripcion{get;set;}
    public string fotoArtista{get;set;}
    public string fotoDescripcion{get;set;}

    public Artistas(int idArt, string nom, string ig, string tw, string desc, string ftArt, string ftDesc){
        IdArtista = idArt;
        nombre = nom;
        instagram = ig;
        twitter = tw;
        descripcion = desc;
        fotoArtista = ftArt;
        fotoDescripcion = ftDesc;
    }
    
    public Artistas(){
        
    }
}