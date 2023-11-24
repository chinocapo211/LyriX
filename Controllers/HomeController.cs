using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LyriX.Models;

namespace LyriX.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.listaArtistas = BD.ObtenerArtistas();
        foreach(Artistas Artis in ViewBag.listaArtistas){
            ViewBag.listaAlbumes += BD.ObtenerAlbumesPorArtista(Artis.IdArtista);
        }
        return View("Index");
    }

    public IActionResult Login()
    {
        return View("Login");
    }
    public IActionResult ingresoLogin(string nom, string con)
    {
        Usuarios us;
        us = BD.IniciarSesion(nom, con);
        if(us.nombreUser == nom && us.contrasenia == con){
            return View("Home");
        }
        else{
            ViewBag.msjError = "Usuario y/o contraseña incorrecto/a";
            return View("Login");
        }
       
    }
    public IActionResult Home(string nom, string con)
    {
        return View("Home");
    }

    public IActionResult Perfil(int IdUsuario)
    {
        ViewBag.User = BD.ObtenerInfoUser(IdUsuario);
        return View("Perfil");
    }
    public IActionResult Registro()
    {
        return View("Registro");
    }
    public IActionResult Privacy()
    {
        return View();
    }

    [HttpPost] public IActionResult insertarUser(string nom, string ma , DateTime fn, string con)
    {
        BD.InsertarUsuario(nom,ma,fn,con);
        return View("Registro");
    }

    public IActionResult insertarDesc(string desc, int IdUsuario)
    {
        BD.InsertarDescripcion(desc,IdUsuario);
        return View("Perfil");
    }

    public IActionResult insertarInsta(string insta, int IdUsuario)
    {
        BD.InsertarInstagram(insta,IdUsuario);
        return View("Perfil");
    }

    public IActionResult insertarTwit(string twit, int IdUsuario)
    {
        BD.InsertarTwitter(twit,IdUsuario);
        return View("Perfil");
    }
    public IActionResult Home(){
        ViewBag.listaCanciones = BD.ObtenerCancionesCarrusel();
        ViewBag.listaArtistas = BD.ObtenerArtistas();
        ViewBag.listaAlbumes = BD.ObtenerAlbumesCarrusel();
        return View("Home");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
