using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Win32;
using System.Windows.Forms;
using System.IO;

namespace KispSharePoint_PowerShell_Update
{
    static class Configuration
    {
        private static Dictionary<string, int> s_dicKeyValue = null;

        public static bool IsMosaicSilver(string strWebSiteName)
        {
            strWebSiteName = strWebSiteName.ToLower();

            int nValue = 0;
            if (!s_dicKeyValue.TryGetValue(strWebSiteName, out nValue))
            {
                string strMessage = string.Format("There is a site didn't configure correctly in registry entry. Make sure the key name of registry is the suffix of web address. The site name is '{0}'. ", strWebSiteName);
                MessageBox.Show(strMessage);

                throw new FileNotFoundException(strMessage);                 
            }

            if(0 == nValue)
            {
                return false;
            }

            return true;
            
        }

        static Configuration()
        {
            s_dicKeyValue = new Dictionary<string, int>();
            string strParentKey = @"SOFTWARE\Wow6432Node\Kisp\SIS\SharePointType";
            RegistryKey key = Registry.LocalMachine.OpenSubKey(strParentKey);
            if(null == key)
            {
                string strMessage = string.Format("Cannot find key '{0}' in registry entry.", strParentKey);
                MessageBox.Show(strMessage);
                return;
            }

            string[] arrSubKeys = key.GetSubKeyNames();
            foreach (var v in arrSubKeys)
            {
                RegistryKey productKey = key.OpenSubKey(v);
                if(null == productKey)
                {
                    continue;
                }

                string strWebSiteName = Convert.ToString(v);
                strWebSiteName = strWebSiteName.ToLower();
                int nMosaicSilver = Convert.ToInt32(productKey.GetValue("MosaicSilver"));

                s_dicKeyValue.Remove(strWebSiteName);
                s_dicKeyValue.Add(strWebSiteName, nMosaicSilver);
            }            
        }
    }
}
