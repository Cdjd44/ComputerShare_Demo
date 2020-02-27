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
        private IFileHelper file1Helper = new FileHelper();
        private IFileHelper file2Helper = new FileHelper();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private IDictionary<int, double> loadFile1()
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\ChallengeSampleDataSet1.txt";
            string rawContent = string.Empty;
            int count = 1;
            IDictionary<int, double> month1 = new Dictionary<int, double>();

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
                month1.Add(count, double.Parse(s));
                count++;
            }

            return month1;
        }

        private IDictionary<int, double> loadFile2()
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\ChallengeSampleDataSet2.txt";
            string rawContent = string.Empty;
            int count = 1;
            IDictionary<int, double> month2 = new Dictionary<int, double>();

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
                month2.Add(count, double.Parse(s));
                count++;
            }

            return month2;
        }

        private IDictionary<int, double> loadFileFromDll(string fileName)
        {
            string filePath = Server.MapPath("~/") + "DemoFiles\\" + fileName;
            IDictionary<int, double> month = new Dictionary<int, double>();

            try
            {
                //string test = fileName.Substring(fileName.Length - 5, 1);

                if (fileName.Substring(fileName.Length - 5, 1).Contains("1"))
                {
                    month = file1Helper.loadFile(filePath);
                }
                else
                {
                    month = file2Helper.loadFile(filePath);
                }

            }
            catch (Exception ex)
            {

            }

            return month;
        }

        protected void btnLoadFile1_Click(object sender, EventArgs e)
        {
            IDictionary<int, double> file1 = new Dictionary<int, double>();
            lblFile1RawData.Text = "Results: ";

            try
            {
                //file1 = loadFileFromDll("ChallengeSampleDataSet1.txt");
                file1 = loadFile1();
            }
            catch (Exception ex)
            {

            }

            if (file1.Count > 0)
            {
                foreach (KeyValuePair<int, double> kvp in file1)
                {
                    lblFile1RawData.Text += "<br/>" + kvp.Key + ": " + kvp.Value;
                }

                pnlFile1RawResults.Update();
            }
        }

        protected void btnLoadFile2_Click(object sender, EventArgs e)
        {
            IDictionary<int, double> file2 = new Dictionary<int, double>();
            lblFile2RawData.Text = "Results: ";

            try
            {
                //file1 = loadFileFromDll("ChallengeSampleDataSet1.txt");
                file2 = loadFile2();
            }
            catch (Exception ex)
            {

            }

            if (file2.Count > 0)
            {
                foreach (KeyValuePair<int, double> kvp in file2)
                {
                    lblFile2RawData.Text += "<br/>" + kvp.Key + ": " + kvp.Value;
                }

                pnlFile2RawResults.Update();
            }
        }


        protected void btnBestBuyAndSellFile1_Click(object sender, EventArgs e)
        {
            lblFile1Results.Text = BuySellLogic(loadFile1());

            pnlBuySellFile1.Update();
        }

        protected void btnBestBuyAndSellFile2_Click(object sender, EventArgs e)
        {
            lblFile2Results.Text = BuySellLogic(loadFile2());

            pnlBuySellFile2.Update();
        }

        public string BuySellLogic(IDictionary<int, double> dict)
        {
            int lowestDay = 0;
            double lowestPrice = 0;
            int highestDay = 0;
            double highestPrice = 0;

            foreach (KeyValuePair<int,double> kvp in dict)
            {
                if(kvp.Key == 1)
                {
                    lowestDay = kvp.Key;
                    lowestPrice = kvp.Value;
                    highestDay = kvp.Key;
                    highestPrice = kvp.Value;
                }
                else
                {
                    if(kvp.Value < lowestPrice)
                    {
                        lowestDay = kvp.Key;
                        lowestPrice = kvp.Value;
                    }
                    else if(kvp.Value > highestPrice)
                    {
                        highestDay = kvp.Key;
                        highestPrice = kvp.Value;
                    }
                }

            }

            return "<br/>BuyDay: " + lowestDay + ": " + lowestPrice + "<br/>sellDay: " + highestDay + ": " + highestPrice;
        }


       
    }

}