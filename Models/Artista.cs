public class Artistas{
    public int IdArtista{get;set;}
    string nombre {get;set;}
    string instagram{get;set;}
    string twitter{get;set;}
    string descripcion{get;set;}
    string fotoArtista{get;set;}
    string fotoDescripcion{get;set;}

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