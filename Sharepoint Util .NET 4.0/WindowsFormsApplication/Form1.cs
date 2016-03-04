using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Collections;
using System.IO;

namespace KispSharePoint_PowerShell_Update
{
    public partial class Form1 : Form
    {
        private PowerShell ps;
        private ArrayList ServerList;
        private int counter;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ServerList = new ArrayList();
            ps = PowerShell.Create();
            string script =
            @"Add-PsSnapin Microsoft.SharePoint.PowerShell
                foreach ($webapp in Get-SPWebApplication)
                {
                    foreach ($SPSite in $webapp.Sites)
                    {
	                    echo $SPSite.url
                    }
                }";
            ps.AddScript(script);
            foreach (string s in ps.Invoke<string>())
            {
                ServerList.Add(s);
            }
            ps.Dispose();
            
#if DEBUG

            ServerList.Add("https://ra.kisp.com/Schneider");
            ServerList.Add("https://ra.kisp.com/Test1");
            ServerList.Add("https://ra.kisp.com/Test2");
            ServerList.Add("https://ra.kisp.com/testtt");
            ServerList.Add("https://ra.kisp.com/test3");
            //ServerList.Add("https://ra.kisp.com/test4");
            //ServerList.Add("https://ra.kisp.com/test5");
            //ServerList.Add("https://ra.kisp.com/test6");
            //ServerList.Add("https://ra.kisp.com/test7");
            //ServerList.Add("https://ra.kisp.com/test8");
            //ServerList.Add("https://ra.kisp.com/test9");
            //ServerList.Add("https://ra.kisp.com/test10");
#endif

            this.checkedListBox1.DataSource = ServerList;

            SiteMapping.Init(ServerList);
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Run Script
            if (this.tabControl1.SelectedIndex == 0)
            {
                ServerList = new ArrayList();
                ps = PowerShell.Create();
                string script =
                @"Add-PsSnapin Microsoft.SharePoint.PowerShell
                foreach ($webapp in Get-SPWebApplication)
                {
	                foreach ($SPSite in $webapp.Sites)
                    {
	                    echo $SPSite.url
                    }
                }";
                ps.AddScript(script);
                foreach (string s in ps.Invoke<string>())
                {
                    ServerList.Add(s);
                }
                ps.Dispose();
                this.checkedListBox1.DataSource = ServerList;
                SiteMapping.Init(ServerList);
            } //New Web Application
            else if (this.tabControl1.SelectedIndex == 1)
            {
                ArrayList PoolList = new ArrayList();
                ps = PowerShell.Create();
                string script =
                @"Add-PsSnapin Microsoft.SharePoint.PowerShell
                foreach ($webapp in Get-SPWebApplication)
                {
                    echo $webapp.ApplicationPool.Name 
                }";
                ps.AddScript(script);
                foreach (string s in ps.Invoke<string>())
                {
                    if (!PoolList.Contains(s))
                    {
                        PoolList.Add(s);
                    }
                }
                ps.Dispose();
                this.comboBoxApplicationPool.DataSource = PoolList;

                ps = PowerShell.Create();
                script =
                @"Add-PsSnapin Microsoft.SharePoint.PowerShell
                [System.Net.Dns]::GetHostName()";
                ps.AddScript(script);
                foreach (string s in ps.Invoke<string>())
                {
                    this.txbxDatabaseServer.Text = s;
                }
                ps.Dispose();

                ArrayList PoolAccountList = new ArrayList();
                ps = PowerShell.Create();
                script =
                @"Add-PsSnapin Microsoft.SharePoint.PowerShell
                foreach ($acc in Get-SPManagedAccount)
                {
                    echo $acc.UserName 
                }";
                ps.AddScript(script);
                foreach (string s in ps.Invoke<string>())
                {
                    if (!PoolAccountList.Contains(s))
                    {
                        PoolAccountList.Add(s);
                    }
                }
                ps.Dispose();
                this.comboBoxAppPoolAccount.DataSource = PoolAccountList;
            }
        }

        #region run script
        private void button1_Click(object sender, EventArgs e)
        {
            progressBar1.Value = 0;
            this.textBox1.Text = "";
            if (this.txbxFilePath.Text == "")
            {
                this.textBox1.Text = "please open a script file.";
            }
            else if (this.checkedListBox1.CheckedItems.Count == 0)
            {
                this.textBox1.Text = "please select a server to run script on.";
            }
            else 
            {
                //get script text
                string file = openFileDialog1.FileName;
                string filescript = "";
                try
                {
                    filescript = File.ReadAllText(file);
                }
                catch (IOException)
                {
                }
                progressBar1.Increment(1);
                //run script on each selected server
                int precent = int.Parse(Math.Ceiling(decimal.Divide(99, decimal.Parse(this.checkedListBox1.CheckedItems.Count.ToString()))).ToString());
                for (int i = 0; i < this.checkedListBox1.CheckedItems.Count; i++)
                {
                    this.textBox1.Text += "*** Running script on " + this.checkedListBox1.CheckedItems[i] + "\r\n";
                    ps = PowerShell.Create();
                    ps.AddScript(@"Add-PsSnapin Microsoft.SharePoint.PowerShell");
                    ps.AddScript("$Error.clear()");
                    //ps.AddScript("$webapp = Get-SPWebApplication -Identity " + this.checkedListBox1.CheckedItems[i]);
                    ps.AddScript("$SPSite = Get-SPSite -Identity " + this.checkedListBox1.CheckedItems[i]);
                    ps.AddScript("try {" + filescript + "} catch { } finally { $Error }");
                    foreach (string s in ps.Invoke<string>())
                    {
                        this.textBox1.Text += s + "\r\n";
                    }
                    ps.Dispose();

                    textBox1.SelectionStart = textBox1.Text.Length;
                    textBox1.ScrollToCaret();
                    progressBar1.Increment(precent);
                }
                this.textBox1.Text += "*** ALL DONE ***";
                textBox1.SelectionStart = textBox1.Text.Length;
                textBox1.ScrollToCaret();

                this.radioButton4.Checked = true;
                for (int i = 0; i < this.checkedListBox1.Items.Count; i++)
                {
                    this.checkedListBox1.SetItemChecked(i, false);
                }
                this.txbxFilePath.Text = "";
                progressBar1.Value = 100;
            }
        }

        private void btnOpenFile_Click(object sender, EventArgs e)
        {
            // Show the dialog and get result.
            DialogResult result = openFileDialog1.ShowDialog();
            if (result == DialogResult.OK) // Test result.
            {
                this.txbxFilePath.Text += openFileDialog1.FileName + "\r\n"; 
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                for (int i = 0; i < this.checkedListBox1.Items.Count; i++)
                {
                    this.checkedListBox1.SetItemChecked(i, true);
                }
            }
        }

        /*private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
            {
                for (int i = 0; i < this.checkedListBox1.Items.Count; i++)
                {
                    if (checkedListBox1.Items[i].ToString() == "https://portalsp.kisp.com/" ||
                        checkedListBox1.Items[i].ToString() == "https://sp.kisp.com/")
                    {
                        this.checkedListBox1.SetItemChecked(i, false);
                    }
                    else
                    {
                        this.checkedListBox1.SetItemChecked(i, true);
                    }
                }
            }
        }*/

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton3.Checked)
            {
                for (int i = 0; i < this.checkedListBox1.Items.Count; i++)
                {
                    this.checkedListBox1.SetItemChecked(i, false);
                }
            }
        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            radioButton4.Checked = true;
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            //custom no need to do anything
        }

        #endregion 

        #region new web app
        string pool = "";
        string poolAccount = "";
        private void txbxVRoot_TextChanged(object sender, EventArgs e)
        {
            this.txbxHostHeader.Text = this.txbxVRoot.Text + "sp.kisp.com";
            this.txbxPath.Text = @"C:\inetpub\wwwroot\wss\VirtualDirectories\" + this.txbxHostHeader.Text;
            this.txbxUrl.Text = @"https://" + this.txbxHostHeader.Text;
            this.txbxDatabaseName.Text = "WSS_Content_" + this.txbxVRoot.Text;
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            this.txbxNewWebAppResult.Text = "";
            pool = this.comboBoxApplicationPool.Text.Trim();
            backgroundWorker1.RunWorkerAsync();
        }

        public void AppendTextBox(string value)
        {
            if (InvokeRequired)
            {
                this.Invoke(new Action<string>(AppendTextBox), new object[] { value });
                return;
            }
            txbxNewWebAppResult.Text += value;
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            backgroundWorker1.ReportProgress(1);

            ps = PowerShell.Create();
            string ApplicationPoolAccount = this.comboBoxApplicationPool.Items.Contains(pool) ?  "" : " -ApplicationPoolAccount (Get-SPManagedAccount $WebAppAppPoolAccount)";
            string CustomLogin = this.txbxCustomSignInPage.Text == "" ? "" : " -SignInRedirectURL '" + this.txbxCustomSignInPage.Text + "'";
            string script =
            @"Add-PsSnapin Microsoft.SharePoint.PowerShell
            $VRoot = '" + this.txbxVRoot.Text + @"'
            $WebAppName = '" + this.txbxHostHeader.Text + @"'
            $WebAppHostHeader = '" + this.txbxHostHeader.Text + @"'
            $WebAppUrl = '" + this.txbxUrl.Text + @"'
            $WebAppPort = " + this.txbxPort.Text + @"
            $WebAppAppPool = '" + pool + @"'
            $WebAppAppPoolAccount = '" + poolAccount + @"'
            $WebAppDatabaseName = '" + this.txbxDatabaseName.Text + @"'
            $WebAppDatabaseServerUser = '" + this.txbxSQLaccount.Text + @"'
            $WebAppDatabaseServerPassword = '" + this.txbxSQLpassword.Text + @"'
            $WebAppDatabaseServer = '" + this.txbxDatabaseServer.Text + @"'
            $MembershipProvider = '" + this.txbxMembership.Text + @"'
            $RoleProvider = '" + this.txbxRole.Text + @"'
            $SiteCollectionName = 'Home'
            $SiteCollectionURL = ('https://' + $WebAppHostHeader)
            $SiteCollectionTemplate = 'STS#0'
            $SiteCollectionOwner = 'i:0#.f|' + $MembershipProvider + '|system'
            $ap = New-SPAuthenticationProvider -ASPNETMembershipProvider $MembershipProvider -ASPNETRoleProviderName $RoleProvider 
            $secpasswd = ConvertTo-SecureString $WebAppDatabaseServerPassword  -AsPlainText -Force
            $cred = New-Object System.Management.Automation.PSCredential ($WebAppDatabaseServerUser , $secpasswd)

            $webapp = New-SPWebApplication -AllowAnonymousAccess -Name $WebAppName -Port $WebAppPort -HostHeader $WebAppHostHeader -URL $WebAppUrl -SecureSocketsLayer -ApplicationPool $WebAppAppPool"
            + ApplicationPoolAccount + " -DatabaseName $WebAppDatabaseName -DatabaseServer $WebAppDatabaseServer -AuthenticationProvider $ap -DatabaseCredentials $cred " + CustomLogin + @" 
            if ($webapp -ne $null)
            {
                $webapp
                New-SPSite -URL ($webapp.url) -OwnerAlias $SiteCollectionOwner -Template $SiteCollectionTemplate -Name $SiteCollectionName

                $webapp.BrowserFileHandling = 'Permissive'
                $webapp.update()

                stsadm -o setproperty -propertyname peoplepicker-onlysearchwithinsitecollection -propertyvalue Yes -url $webapp.url
            }
            ";
            ps.AddScript("try {" + script + "} catch { } finally { $Error }");
            foreach (string s in ps.Invoke<string>())
            {
                this.AppendTextBox(s + "\r\n");
            }
            this.AppendTextBox("*** done\r\n");
            ps.Dispose();
        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            progressBar2.Style = ProgressBarStyle.Marquee;
            progressBar2.MarqueeAnimationSpeed = 20;
            counter = 0;
            this.lbltime.Text = "00:00:00";
            this.timer1.Interval = 1000;
            this.timer1.Start();
        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e) //call back method
        {
            progressBar2.Style = ProgressBarStyle.Blocks;
            progressBar2.Value = progressBar2.Maximum;
            this.timer1.Stop();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            counter++;
            TimeSpan span = new TimeSpan(0, 0, counter);
            this.lbltime.Text = span.ToString();
        }
        #endregion

        private void SetCheckMosaicSilverSitesStatus(bool bStatus)
        {
            int nCount = this.checkedListBox1.Items.Count;
            for (int i = 0; i < nCount; i++ )
            {
                object item = this.checkedListBox1.Items[i];
                string strWebAddress = this.checkedListBox1.GetItemText(item);
                int nIndex = this.checkedListBox1.Items.IndexOf(item);
                if (SiteMapping.IsMosaicSilverSite(strWebAddress))
                {
                    bool bChecked = false;
                    if (bStatus)
                    {
                        bChecked = true;
                    }
                    this.checkedListBox1.SetItemChecked(nIndex, bChecked);
                }
                else
                {
                    bool bChecked = false;
                    if (!bStatus)
                    {
                        bChecked = true;
                    }
                    this.checkedListBox1.SetItemChecked(nIndex, bChecked);
                }
            }
            
        }

        private void radioMosaicSilverSites_CheckedChanged(object sender, EventArgs e)
        {
            if (radioMosaicSilverSites.Checked)
            {
                SetCheckMosaicSilverSitesStatus(true);
            }
        }

        private void radioAllOtherSites_CheckedChanged(object sender, EventArgs e)
        {
            if (radioAllOtherSites.Checked)
            {
                SetCheckMosaicSilverSitesStatus(false);
            }
        }



    }
}
