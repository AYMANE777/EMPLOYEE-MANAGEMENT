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
    
    public partial class PANNE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PANNE()
        {
            this.REPARATIONs = new HashSet<REPARATION>();
        }
    
        public int ID_PANNE { get; set; }
        public System.DateTime DATE_PANNE { get; set; }
        public int ID_VEHICULE { get; set; }
        public string DETAIL_PANNE { get; set; }
    
        public virtual VEHICULE VEHICULE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<REPARATION> REPARATIONs { get; set; }
    }
}