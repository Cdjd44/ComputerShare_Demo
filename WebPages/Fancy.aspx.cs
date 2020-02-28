using Sssh.FileManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComputerShare_Demo.WebPages
{
    public partial class Fancy : System.Web.UI.Page
    {
        private IFileHelper file1Helper = new FileHelper();
        private IFileHelper file2Helper = new FileHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoadFile1_Click(object sender, EventArgs e)
        {
            try
            {
                lblFile1ModalBody.Text = "";
                IDictionary<int, double> file1 = new Dictionary<int, double>();
                file1 = loadFileFromDll("ChallengeSampleDataSet1.txt");

                if (file1.Count > 0)
                {
                    lblFile1ModalBody.Text += "<div class='row'>";
                    foreach (KeyValuePair<int, double> kvp in file1)
                    {
                        lblFile1ModalBody.Text += "<div class='col-3'>";
                            lblFile1ModalBody.Text += kvp.Key + ": " + kvp.Value;
                        lblFile1ModalBody.Text += "</div>";
                        //lblFile1ModalBody.Text += "<br/>" + kvp.Key + ": " + kvp.Value;
                    }
                    lblFile1ModalBody.Text += "</div>";
                }
            }
            catch (Exception ex)
            {

            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        private IDictionary<int, double> loadFileFromDll(string fileName)
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\" + fileName;
            IDictionary<int, double> month = new Dictionary<int, double>();

            try
            {
                if (fileName.Substring(fileName.Length - 5, 1).Contains("1"))
                {
                    month = file1Helper.loadFile(filePath);
                    Session["file1Helper"] = file1Helper;
                }
                else
                {
                    month = file2Helper.loadFile(filePath);
                    Session["file2Helper"] = file2Helper;
                }
            }
            catch (Exception ex)
            {

            }

            return month;
        }
    }
}