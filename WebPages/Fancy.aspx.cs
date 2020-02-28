using Sssh.FileManagement;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;

namespace ComputerShare_Demo.WebPages
{
    public partial class Fancy : System.Web.UI.Page
    {
        private IFileHelper file1Helper = new FileHelper();
        private IFileHelper file2Helper = new FileHelper();
        private Page page;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (Session["file1Helper"] != null)
                {
                    file1Helper = Session["file1Helper"] as FileHelper;
                    btnBestBuyAndSellFile1.Visible = true;
                }
                else
                {
                    btnBestBuyAndSellFile1.Visible = false;
                }

                if (Session["file2Helper"] != null)
                {
                    file2Helper = Session["file2Helper"] as FileHelper;
                    btnBestBuyAndSellFile2.Visible = true;
                }
                else
                {
                    btnBestBuyAndSellFile2.Visible = false;
                }
            }
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
                    }
                    lblFile1ModalBody.Text += "</div>";
                    btnBestBuyAndSellFile1.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFile1RawModal();", true);
        }

        protected void btnLoadFile2_Click(object sender, EventArgs e)
        {
            try
            {
                lblFile2ModalBody.Text = "";
                IDictionary<int, double> file1 = new Dictionary<int, double>();
                file1 = loadFileFromDll("ChallengeSampleDataSet2.txt");

                if (file1.Count > 0)
                {
                    lblFile2ModalBody.Text += "<div class='row'>";
                    foreach (KeyValuePair<int, double> kvp in file1)
                    {
                        lblFile2ModalBody.Text += "<div class='col-3'>";
                        lblFile2ModalBody.Text += kvp.Key + ": " + kvp.Value;
                        lblFile2ModalBody.Text += "</div>";
                    }
                    lblFile1ModalBody.Text += "</div>";
                    btnBestBuyAndSellFile2.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFile2RawModal();", true);
        }


        
        protected void btnBestBuyAndSellFile1_Click(object sender, EventArgs e)
        {
            string data = file1Helper.GetDaysForMaxProfit(file1Helper.Data);

            string[] delim = { "<br/>" };
            string[] split = data.Split(delim, StringSplitOptions.None);
            string[] buySplit = split[3].Split(':');
            string[] sellSplit = split[4].Split(':');
            string buyDay = "#MainBody_f1Li" + buySplit[1].Trim();
            string sellDay = "#MainBody_f1Li" + sellSplit[1].Trim();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "setBuy", "setBuyingDay('" + buyDay + "');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "setSell", "setSellingDay('" + sellDay + "');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFile1Modal();", true);
        }

       
        protected void btnBestBuyAndSellFile2_Click(object sender, EventArgs e)
        {
            string data = file2Helper.GetDaysForMaxProfit(file2Helper.Data);

            string[] delim = { "<br/>" };
            string[] split = data.Split(delim, StringSplitOptions.None);
            string[] buySplit = split[3].Split(':');
            string[] sellSplit = split[4].Split(':');
            string buyDay = "#MainBody_f2Li" + buySplit[1].Trim();
            string sellDay = "#MainBody_f2Li" + sellSplit[1].Trim();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "setBuy", "setBuyingDay('" + buyDay + "');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "setSell", "setSellingDay('" + sellDay + "');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openFile2Modal();", true);
        }
    }
}