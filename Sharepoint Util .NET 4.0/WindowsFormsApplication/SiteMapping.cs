using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections;
using System.Windows.Forms;
using System.IO;

namespace KispSharePoint_PowerShell_Update
{
    static class SiteMapping
    {
        private static Dictionary<string, string> s_dicKeyValue = null;

        static SiteMapping()
        {
            s_dicKeyValue = new Dictionary<string, string>();
        }


        public static bool IsMosaicSilverSite(string strAddress)
        {
            string strSiteName = SiteMapping.WebAddressToWebName(strAddress);
            if(null == strSiteName)
            {
                strSiteName = SiteMapping.GetSiteName(strAddress);
                string strMessage = string.Format("There is a site cannot be found. The site name is '{0}'. The site address is '{1}'.", strSiteName, strAddress);
                MessageBox.Show(strMessage);

                throw new FileNotFoundException(strMessage); 
                
            }

            bool bResult = Configuration.IsMosaicSilver(strSiteName);
            return bResult;
        }

        private static string WebAddressToWebName(string strAddress)
        {
            string strName;
            if (!s_dicKeyValue.TryGetValue(strAddress, out strName))
            {
                return null;
            }

            return strName;
        }

        public static bool Init(ArrayList serverList)
        {
            s_dicKeyValue.Clear();
            foreach (string strWebAddress in serverList)
            {
                string strName;
                if (s_dicKeyValue.TryGetValue(strWebAddress, out strName))
                {
                    //MessageBox.Show("The site duplicated; Please check with the programmer first. The site address is: {0}. " + strWebAddress);
                    continue;
                }

                string strWebName = SiteMapping.GetSiteName(strWebAddress);
                s_dicKeyValue.Add(strWebAddress, strWebName);
            }

            return true;
        }


        private static string GetSiteName(string strWebAddress)
        {
            int nIndex = strWebAddress.LastIndexOf("/");
            string strSiteName = strWebAddress.Substring(nIndex + 1);
            return strSiteName;
        }
    }
}
