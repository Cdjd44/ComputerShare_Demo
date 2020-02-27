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
            if (Page.IsPostBack)
            {
                if(Session["file1Helper"] != null)
                {
                    file1Helper = Session["file1Helper"] as FileHelper;
                }

                if (Session["file2Helper"] != null)
                {
                    file2Helper = Session["file2Helper"] as FileHelper;
                }
            }
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

        protected void btnBestBuyAndSellFile1_Click(object sender, EventArgs e)
        {
            //lblFile1Results.Text = BuySellLogic(loadFile1());
            lblFile1Results.Text = file1Helper.GetDaysForMaxProfit(file1Helper.Data);

            pnlBuySellFile1.Update();
        }

        protected void btnBestBuyAndSellFile2_Click(object sender, EventArgs e)
        {
            //lblFile2Results.Text = BuySellLogic(loadFile2());
            lblFile2Results.Text = file2Helper.GetDaysForMaxProfit(file2Helper.Data);

            pnlBuySellFile2.Update();
        }

        //protected void btnLoadFile1_Click(object sender, EventArgs e)
        //{
        //    IDictionary<int, double> file1 = new Dictionary<int, double>();
        //    lblFile1RawData.Text = "Results: ";
        //    try
        //    {
        //        file1 = loadFileFromDll("ChallengeSampleDataSet1.txt");
        //        //file1 = loadFile1();
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //    if (file1.Count > 0)
        //    {
        //        foreach (KeyValuePair<int, double> kvp in file1)
        //        {
        //            lblFile1RawData.Text += "<br/>" + kvp.Key + ": " + kvp.Value;
        //        }
        //        pnlFile1RawResults.Update();
        //    }
        //}

        //protected void btnLoadFile2_Click(object sender, EventArgs e)
        //{
        //    IDictionary<int, double> file2 = new Dictionary<int, double>();
        //    lblFile2RawData.Text = "Results: ";

        //    try
        //    {
        //        file2 = loadFileFromDll("ChallengeSampleDataSet2.txt");
        //        //file2 = loadFile2();
        //    }
        //    catch (Exception ex)
        //    {

        //    }

        //    if (file2.Count > 0)
        //    {
        //        foreach (KeyValuePair<int, double> kvp in file2)
        //        {
        //            lblFile2RawData.Text += "<br/>" + kvp.Key + ": " + kvp.Value;
        //        }

        //        pnlFile2RawResults.Update();
        //    }
        //}





        //public string BuySellLogic(IDictionary<int, double> dict)
        //{
        //    int lowestDay = 0, highestDay = 0, buyingDay = 0, sellingDay = 0;
        //    double lowestPrice = 0, highestPrice = 0, buyingPrice = 0, sellingPrice = 0, profit = 0;

        //    var keyOfMinValue = dict.Aggregate((x, y) => x.Value < y.Value ? x : y).Key;
        //    var keyOfMaxValue = dict.Aggregate((x, y) => x.Value > y.Value ? x : y).Key;

        //    if (keyOfMinValue < keyOfMaxValue)
        //    {
        //        buyingDay = lowestDay = keyOfMinValue;
        //        buyingPrice = lowestPrice = dict[keyOfMinValue];
        //        sellingDay = highestDay = keyOfMaxValue;
        //        sellingPrice = highestPrice = dict[keyOfMaxValue];
        //    }
        //    else
        //    {
        //        foreach (KeyValuePair<int, double> kvp in dict)
        //        {
        //            if (lowestPrice == 0 || kvp.Value < lowestPrice)
        //            {
        //                lowestDay = kvp.Key;
        //                lowestPrice = kvp.Value;
        //            }
        //            else if (highestPrice == 0 || kvp.Value > highestPrice)
        //            {
        //                highestDay = kvp.Key;
        //                highestPrice = kvp.Value;
        //            }

        //            if (buyingPrice == 0)
        //            {
        //                buyingDay = kvp.Key;
        //                buyingPrice = kvp.Value;
        //            }

        //            if (sellingPrice - kvp.Value > profit)
        //            {
        //                // miss last day for buying as cannot sell within the month
        //                if (kvp.Key < dict.Count)
        //                {
        //                    buyingDay = kvp.Key;
        //                    buyingPrice = kvp.Value;
        //                }
        //            }
        //            else
        //            {
        //                if(buyingDay > sellingDay)
        //                {
        //                    sellingDay = kvp.Key;
        //                    sellingPrice = kvp.Value;
        //                }

        //            }

        //            profit = sellingPrice - buyingPrice;

        //        }
        //    }

        //    profit = sellingPrice - buyingPrice;

        //    return "<br/>Lowest: " + lowestDay + ": " + lowestPrice +
        //        "<br/>Highest: " + highestDay + ": " + highestPrice +
        //        "<br/>Buy Day: " + buyingDay + ": " + buyingPrice +
        //            "<br/>Sell Day: " + sellingDay + ": " + sellingPrice +
        //            "<br/>Profit: " + profit;
        //}



    }

}