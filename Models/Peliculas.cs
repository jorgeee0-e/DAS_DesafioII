//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Desafio2_DAS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Peliculas
    {
        public Peliculas()
        {
            this.rate_per_user = new HashSet<rate_per_user>();
            this.rates = new HashSet<rates>();
        }
    
        public int id_pelicula { get; set; }
        public string titulo { get; set; }
        public string sinopsis { get; set; }
        public string poster_url { get; set; }
        public int id_director { get; set; }
        public int id_genero { get; set; }
    
        public virtual Directores Directores { get; set; }
        public virtual Generos Generos { get; set; }
        public virtual Puntuaciones Puntuaciones { get; set; }
        public virtual ICollection<rate_per_user> rate_per_user { get; set; }
        public virtual ICollection<rates> rates { get; set; }
    }
}