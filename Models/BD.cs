using System.Data.SqlClient;
using Dapper;
namespace LyriX.Models;
public static class BD{
    private static string _connectionString = @"Server=localhost;DataBase=BD_LyriX;Trusted_Connection=True;";
    public static List<Album> ObtenerAlbumesPorArtista(int IdArtista){
        string sql = "SELECT * FROM Album WHERE IdArtista = @IdArtista";
        List<Album> listaA = new List<Album>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           listaA = db.Query<Album>(sql, new {IdArtista = IdArtista}).ToList();
        }
        return listaA;
    }
    public static List<Cancion> ObtenerCancionesPorAlbum(int IdAlbum){
        string sql = "SELECT * FROM Cancion WHERE IdAlbum = @IdAlbum";
        List<Cancion> listaC = new List<Cancion>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           listaC = db.Query<Cancion>(sql, new {IdAlbum = IdAlbum}).ToList();
        }
        return listaC;
    }
    public static Artista ObtenerInfoArtista(int IdArtista){
        string sql = "SELECT * FROM Artista WHERE IdArtista = @IdArtista"; 
        Artista devolverArti;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           devolverArti = db.QueryFirstOrDefault<Artista>(sql, new {IdArtista = IdArtista});
        }
        return devolverArti;
    }
    public static Usuario ObtenerInfoUsuario(int IdUsuario){
        string sql = "SELECT * FROM Usuario WHERE IdUsuario = @IdUsuario"; 
        Usuario devolverUser;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           devolverUser = db.QueryFirstOrDefault<Usuario>(sql, new {IdUsuario = IdUsuario});
        }
        return devolverUser;
    }
}
