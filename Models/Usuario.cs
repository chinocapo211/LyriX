public class Usuarios{
    public int IdUsuario{get;set;}
    public string nombreUser{get;set;}
    public string contrasenia{get;set;}
    public DateTime fechaNacimiento{get;set;}
    public string mail{get;set;}
    public string fotoUsuario{get;set;}
    public string descripcion{get;set;}
    public string instagramUser{get;set;}
    public string twitterUser{get;set;}


    public Usuarios(string nomUs, string contra, DateTime fn, string Mail, string fotoUs, string desc, string igUser, string twUser){
        nombreUser = nomUs;
        contrasenia = contra;
        fechaNacimiento = fn;
        mail = Mail;
        fotoUsuario = fotoUs;
        descripcion = desc;
        instagramUser = igUser;
        twitterUser = twUser;
    }

    public Usuarios(){
        
    }
}