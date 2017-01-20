using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CursoBasicoASPNET
{
    public partial class pDataSources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string doUpper(string texto)
        {
            return texto.ToUpper();
        }
    }
}