using SECOND_LAST.Entity_Frame;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SECOND_LAST.Classes
{
    public class Service_Class
    {
        RADEETA_Entities entity = new RADEETA_Entities();

        public Service_Class() { }


        public void AddService(string nom,string description)
        {


            SERVICE services = new SERVICE();
            services.NOM_SERVICE = nom;
            services.DESCRIPTION = description;
            entity.SERVICES.Add(services);
            entity.SaveChanges();
            


        }






    }
}