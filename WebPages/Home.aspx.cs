using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Sssh.FileManagement;

namespace ComputerShare_Demo.WebPages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void loadFile1()
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\ChallengeSampleDataSet1.txt";
            string rawContent = string.Empty;
            int count = 1;
            IDictionary<int, string> month1 = new Dictionary<int, string>();

            using (StreamReader sr = new StreamReader(filePath))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    rawContent = line;
                }
            }

            string[] split = rawContent.Split(',');

            foreach (string s in split)
            {
                month1.Add(count, s);
                count++;
            }

            string stop = "";
        }

        private void loadFile2()
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\ChallengeSampleDataSet2.txt";
            string rawContent = string.Empty;
            int count = 1;
            IDictionary<int, string> month1 = new Dictionary<int, string>();

            using (StreamReader sr = new StreamReader(filePath))
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    rawContent = line;
                }
            }

            string[] split = rawContent.Split(',');

            foreach (string s in split)
            {
                month1.Add(count, s);
                count++;
            }

            string stop = "";
        }

        private IDictionary<int,string> loadFileFromDll(string fileName)
        {
            IFileHelper fileHelper = new FileHelper();
            string filePath = Server.MapPath("~/") + "DemoFiles\\" + fileName;
            IDictionary<int, string> month1 = new Dictionary<int, string>();

            try
            {
                month1 = fileHelper.loadFile(filePath);
            }
            catch (Exception ex)
            {

            }

            return month1;
        }

        protected void btnLoadFile1_Click(object sender, EventArgs e)
        {
            IDictionary<int, string> file1 = new Dictionary<int, string>();
            lblFile1RawData.Text = "Results: ";

            try
            {
                file1 = loadFileFromDll("ChallengeSampleDataSet1.txt");
            }
            catch (Exception ex)
            {

            }

            if(file1.Count > 0)
            {
                foreach(KeyValuePair<int,string> kvp in file1)
                {
                    lblFile1RawData.Text += kvp.Key + ": " + kvp.Value + Environment.NewLine;
                }

                pnlFile1RawResults.Update();
            }
        }

        protected void btnBestBuyAndSell_Click(object sender, EventArgs e)
        {

        }
    }
}