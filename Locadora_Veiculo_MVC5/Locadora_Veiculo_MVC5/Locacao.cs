//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Locadora_Veiculo_MVC5
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class Locacao
    {
        [Display(Name="C�digo Loca��o")]
        [Required(ErrorMessage = "Campo obrigatorio")]
        public int LocacaoID { get; set; }

        //[Display(Name="C�digo Automovel")]
        [Required(ErrorMessage = "Campo obrigatorio")]
        public Nullable<int> AutomovelID { get; set; }

        //[Display(Name="C�digo do Cliente")]
        [Required(ErrorMessage = "Campo obrigatorio")]
        public Nullable<int> ClienteID { get; set; }

        [Required(ErrorMessage = "Campo obrigatorio")]
        [DataType(DataType.Date, ErrorMessage = "Formato de data invalido ! - Formato correto dd/mm/aaaa")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name="Data de Loca��o")]
        public Nullable<System.DateTime> DataLocacao { get; set; }

        [Required(ErrorMessage = "Campo obrigatorio")]
        [DataType(DataType.Date, ErrorMessage = "Formato de data invalido ! - Formato correto dd/mm/aaaa")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name="Data de Devolu��o")]
        public Nullable<System.DateTime> DataDevolucao { get; set; }
    
        public virtual Automovel Automovel { get; set; }
        public virtual Cliente Cliente { get; set; }
    }
}