using System.Data.SqlClient;
using Dapper;
namespace LyriX.Models;
public static class BD{
    private static string _connectionString = @"Server=localhost;DataBase=BD_LyriX;Trusted_Connection=True;";
    public static List<Album> ObtenerAlbumesPorArtista(int IdArtista){
        string sql = "SELECT * FROM Album WHERE IdArtista = @pIdArtista";
        List<Album> listaA = new List<Album>{};
        using(SqlConnection db = new SqlConnection(_connectionString)){
            listaA = db.Query<Album>(sql, new {pIdArtista = IdArtista}).ToList();
        }
        return listaA;
    }
    public static List<Cancion> ObtenerCancionesPorAlbum(int IdAlbum){
        string sql = "SELECT * FROM Cancion WHERE IdCancion = @pIdCancion";
        List<Cancion> listaC = new List<Cancion>{};
        using(SqlConnection db = new SqlConnection(_connectionString)){
            listaC = db.Query<Cancion>(sql, new {pIdAlbum = IdAlbum}).ToList();
        }
        return listaC;
    }
    public static Artista ObtenerInfoArtista(int IdArtista){
        string sql = "SELECT * FROM Artista WHERE IdArtista = @pIdArtista";
        Artista devolver;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            devolver = db.QueryFirstOrDefault(sql, new {pIdArtista = IdArtista});
        }
        return devolver;
    }
    public static Usuario ObtenerInfoUser(int IdUsuario){
        string sql = "SELECT * FROM Usuario WHERE IdUsuario = @pIdUsuario";
        Usuario devolver;
        using(SqlConnection db = new SqlConnection(_connectionString)){
            devolver = db.QueryFirstOrDefault(sql, new {pIdUsuario = IdUsuario});
        }
        return devolver;
    }
    public static void InsertarUsuario(string nom, string ma , DateTime fn, string con){
        string sql = "exec sp_CrearUsuario @nom, @ma, @fn, @con";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {@nom = nom, @ma = ma, @fn = fn, @con = con});
        }
    }
    public static void InsertarDescripcion(string desc, int IdUsuario){
        string sql = "UPDATE Usuario SET Descripcion = @desc WHERE IdUsuario = @pIdUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {@desc = desc, @pIdUsuario = IdUsuario});
        }
    }
    public static void InsertarInstagram(string insta, int IdUsuario){
        insta = "instagram.com/" + insta;
        string sql = "UPDATE Usuario SET Instaram = @insta WHERE IdUsuario = @pIdUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {@insta = insta, @pIdUsuario = IdUsuario});
        }
    }
    public static void InsertarTwitter(string twit, int IdUsuario){
        insta = "twitter.com/" + twit;
        string sql = "UPDATE Usuario SET Twitter = @twit WHERE IdUsuario = @pIdUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString)){
            db.Execute(sql, new {@twit = twit, @pIdUsuario = IdUsuario});
        }
    }
}
