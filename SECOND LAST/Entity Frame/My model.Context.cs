﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RADEETA_Entities : DbContext
    {
        public RADEETA_Entities()
            : base("name=RADEETA_Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AGENT> AGENTs { get; set; }
        public virtual DbSet<BON_PLEIN> BON_PLEIN { get; set; }
        public virtual DbSet<CARBURANT> CARBURANTs { get; set; }
        public virtual DbSet<CATEGORIE> CATEGORIEs { get; set; }
        public virtual DbSet<DETAIL_MISSION> DETAIL_MISSION { get; set; }
        public virtual DbSet<LOGIN> LOGINs { get; set; }
        public virtual DbSet<MISSION> MISSIONs { get; set; }
        public virtual DbSet<MODELE> MODELEs { get; set; }
        public virtual DbSet<PANNE> PANNEs { get; set; }
        public virtual DbSet<PROPRIETAIRE> PROPRIETAIREs { get; set; }
        public virtual DbSet<REPARATION> REPARATIONs { get; set; }
        public virtual DbSet<SERVICE> SERVICES { get; set; }
        public virtual DbSet<VEHICULE> VEHICULEs { get; set; }
    }
}