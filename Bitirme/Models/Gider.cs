//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bitirme.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Gider
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Gider()
        {
            this.Maliyet = new HashSet<Maliyet>();
        }
    
        public int GiderId { get; set; }
        public string HesapKodu { get; set; }
        public string HesapAd { get; set; }
        public Nullable<decimal> Tutar { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Maliyet> Maliyet { get; set; }
    }
}
