//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SECOND_LAST.Entity_Frame
{
    using System;
    using System.Collections.Generic;
    
    public partial class PROPRIETAIRE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PROPRIETAIRE()
        {
            this.VEHICULEs = new HashSet<VEHICULE>();
        }
    
        public int ID_PROPRIETAIRE { get; set; }
        public string INTITULER { get; set; }
        public string ADRESSE { get; set; }
        public string TELEPHONE { get; set; }
        public string EMAIL { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VEHICULE> VEHICULEs { get; set; }
    }
}
