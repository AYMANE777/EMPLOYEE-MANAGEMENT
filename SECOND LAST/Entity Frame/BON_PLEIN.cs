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
    
    public partial class BON_PLEIN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BON_PLEIN()
        {
            this.CARBURANTs = new HashSet<CARBURANT>();
        }
    
        public int ID_BON { get; set; }
        public System.DateTime DATE_BON { get; set; }
        public decimal PRIX_LITRE { get; set; }
        public double NBR_LITRE { get; set; }
        public double KILOMETRAGE { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CARBURANT> CARBURANTs { get; set; }
    }
}
