namespace KispSharePoint_PowerShell_Update
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.btnSubmit = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.checkedListBox1 = new System.Windows.Forms.CheckedListBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.btnOpenFile = new System.Windows.Forms.Button();
            this.txbxFilePath = new System.Windows.Forms.TextBox();
            this.lblScriptFile = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.radioButton4 = new System.Windows.Forms.RadioButton();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.comboBoxAppPoolAccount = new System.Windows.Forms.ComboBox();
            this.lblAppPoolAccount = new System.Windows.Forms.Label();
            this.lbltime = new System.Windows.Forms.Label();
            this.txbxNewWebAppResult = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.progressBar2 = new System.Windows.Forms.ProgressBar();
            this.btnCreate = new System.Windows.Forms.Button();
            this.comboBoxApplicationPool = new System.Windows.Forms.ComboBox();
            this.lblCustomSignInPage = new System.Windows.Forms.Label();
            this.txbxCustomSignInPage = new System.Windows.Forms.TextBox();
            this.lblVRoot = new System.Windows.Forms.Label();
            this.txbxVRoot = new System.Windows.Forms.TextBox();
            this.lblSQLpassword = new System.Windows.Forms.Label();
            this.txbxSQLpassword = new System.Windows.Forms.TextBox();
            this.lblSQLaccount = new System.Windows.Forms.Label();
            this.txbxSQLaccount = new System.Windows.Forms.TextBox();
            this.lblDatabaseName = new System.Windows.Forms.Label();
            this.txbxDatabaseName = new System.Windows.Forms.TextBox();
            this.lblDatabaseServer = new System.Windows.Forms.Label();
            this.txbxDatabaseServer = new System.Windows.Forms.TextBox();
            this.lblApplicationPool = new System.Windows.Forms.Label();
            this.lblUrl = new System.Windows.Forms.Label();
            this.txbxUrl = new System.Windows.Forms.TextBox();
            this.lblRole = new System.Windows.Forms.Label();
            this.txbxRole = new System.Windows.Forms.TextBox();
            this.lblMembership = new System.Windows.Forms.Label();
            this.txbxMembership = new System.Windows.Forms.TextBox();
            this.lblPath = new System.Windows.Forms.Label();
            this.txbxPath = new System.Windows.Forms.TextBox();
            this.lblHostHeader = new System.Windows.Forms.Label();
            this.txbxHostHeader = new System.Windows.Forms.TextBox();
            this.lblPort = new System.Windows.Forms.Label();
            this.txbxPort = new System.Windows.Forms.TextBox();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.radioMosaicSilverSites = new System.Windows.Forms.RadioButton();
            this.radioAllOtherSites = new System.Windows.Forms.RadioButton();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnSubmit
            // 
            this.btnSubmit.Location = new System.Drawing.Point(381, 462);
            this.btnSubmit.Name = "btnSubmit";
            this.btnSubmit.Size = new System.Drawing.Size(75, 23);
            this.btnSubmit.TabIndex = 0;
            this.btnSubmit.Text = "Submit";
            this.btnSubmit.UseVisualStyleBackColor = true;
            this.btnSubmit.Click += new System.EventHandler(this.button1_Click);
            // 
            // textBox1
            // 
            this.textBox1.BackColor = System.Drawing.Color.White;
            this.textBox1.Location = new System.Drawing.Point(23, 280);
            this.textBox1.MaxLength = 999999;
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox1.Size = new System.Drawing.Size(433, 172);
            this.textBox1.TabIndex = 1;
            // 
            // checkedListBox1
            // 
            this.checkedListBox1.CheckOnClick = true;
            this.checkedListBox1.FormattingEnabled = true;
            this.checkedListBox1.Location = new System.Drawing.Point(23, 129);
            this.checkedListBox1.Name = "checkedListBox1";
            this.checkedListBox1.ScrollAlwaysVisible = true;
            this.checkedListBox1.Size = new System.Drawing.Size(433, 124);
            this.checkedListBox1.Sorted = true;
            this.checkedListBox1.TabIndex = 2;
            this.checkedListBox1.SelectedIndexChanged += new System.EventHandler(this.checkedListBox1_SelectedIndexChanged);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // btnOpenFile
            // 
            this.btnOpenFile.Location = new System.Drawing.Point(381, 66);
            this.btnOpenFile.Name = "btnOpenFile";
            this.btnOpenFile.Size = new System.Drawing.Size(75, 23);
            this.btnOpenFile.TabIndex = 4;
            this.btnOpenFile.Text = "Open";
            this.btnOpenFile.UseVisualStyleBackColor = true;
            this.btnOpenFile.Click += new System.EventHandler(this.btnOpenFile_Click);
            // 
            // txbxFilePath
            // 
            this.txbxFilePath.BackColor = System.Drawing.Color.White;
            this.txbxFilePath.Location = new System.Drawing.Point(23, 66);
            this.txbxFilePath.Name = "txbxFilePath";
            this.txbxFilePath.ReadOnly = true;
            this.txbxFilePath.Size = new System.Drawing.Size(352, 20);
            this.txbxFilePath.TabIndex = 5;
            this.txbxFilePath.WordWrap = false;
            // 
            // lblScriptFile
            // 
            this.lblScriptFile.AutoSize = true;
            this.lblScriptFile.Location = new System.Drawing.Point(20, 50);
            this.lblScriptFile.Name = "lblScriptFile";
            this.lblScriptFile.Size = new System.Drawing.Size(56, 13);
            this.lblScriptFile.TabIndex = 6;
            this.lblScriptFile.Text = "Script File:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 264);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(40, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "Result:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 95);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Servers:";
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(23, 462);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(352, 23);
            this.progressBar1.TabIndex = 9;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(491, 539);
            this.tabControl1.TabIndex = 10;
            this.tabControl1.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.radioAllOtherSites);
            this.tabPage1.Controls.Add(this.radioMosaicSilverSites);
            this.tabPage1.Controls.Add(this.radioButton4);
            this.tabPage1.Controls.Add(this.radioButton3);
            this.tabPage1.Controls.Add(this.radioButton1);
            this.tabPage1.Controls.Add(this.lblScriptFile);
            this.tabPage1.Controls.Add(this.progressBar1);
            this.tabPage1.Controls.Add(this.btnSubmit);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.textBox1);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.checkedListBox1);
            this.tabPage1.Controls.Add(this.txbxFilePath);
            this.tabPage1.Controls.Add(this.btnOpenFile);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(483, 513);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Run Script";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // radioButton4
            // 
            this.radioButton4.AutoSize = true;
            this.radioButton4.Location = new System.Drawing.Point(126, 111);
            this.radioButton4.Name = "radioButton4";
            this.radioButton4.Size = new System.Drawing.Size(60, 17);
            this.radioButton4.TabIndex = 14;
            this.radioButton4.TabStop = true;
            this.radioButton4.Text = "Custom";
            this.radioButton4.UseVisualStyleBackColor = true;
            this.radioButton4.CheckedChanged += new System.EventHandler(this.radioButton4_CheckedChanged);
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Location = new System.Drawing.Point(69, 111);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(51, 17);
            this.radioButton3.TabIndex = 13;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "None";
            this.radioButton3.UseVisualStyleBackColor = true;
            this.radioButton3.CheckedChanged += new System.EventHandler(this.radioButton3_CheckedChanged);
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(27, 111);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(36, 17);
            this.radioButton1.TabIndex = 11;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "All";
            this.radioButton1.UseVisualStyleBackColor = true;
            this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.comboBoxAppPoolAccount);
            this.tabPage2.Controls.Add(this.lblAppPoolAccount);
            this.tabPage2.Controls.Add(this.lbltime);
            this.tabPage2.Controls.Add(this.txbxNewWebAppResult);
            this.tabPage2.Controls.Add(this.label3);
            this.tabPage2.Controls.Add(this.progressBar2);
            this.tabPage2.Controls.Add(this.btnCreate);
            this.tabPage2.Controls.Add(this.comboBoxApplicationPool);
            this.tabPage2.Controls.Add(this.lblCustomSignInPage);
            this.tabPage2.Controls.Add(this.txbxCustomSignInPage);
            this.tabPage2.Controls.Add(this.lblVRoot);
            this.tabPage2.Controls.Add(this.txbxVRoot);
            this.tabPage2.Controls.Add(this.lblSQLpassword);
            this.tabPage2.Controls.Add(this.txbxSQLpassword);
            this.tabPage2.Controls.Add(this.lblSQLaccount);
            this.tabPage2.Controls.Add(this.txbxSQLaccount);
            this.tabPage2.Controls.Add(this.lblDatabaseName);
            this.tabPage2.Controls.Add(this.txbxDatabaseName);
            this.tabPage2.Controls.Add(this.lblDatabaseServer);
            this.tabPage2.Controls.Add(this.txbxDatabaseServer);
            this.tabPage2.Controls.Add(this.lblApplicationPool);
            this.tabPage2.Controls.Add(this.lblUrl);
            this.tabPage2.Controls.Add(this.txbxUrl);
            this.tabPage2.Controls.Add(this.lblRole);
            this.tabPage2.Controls.Add(this.txbxRole);
            this.tabPage2.Controls.Add(this.lblMembership);
            this.tabPage2.Controls.Add(this.txbxMembership);
            this.tabPage2.Controls.Add(this.lblPath);
            this.tabPage2.Controls.Add(this.txbxPath);
            this.tabPage2.Controls.Add(this.lblHostHeader);
            this.tabPage2.Controls.Add(this.txbxHostHeader);
            this.tabPage2.Controls.Add(this.lblPort);
            this.tabPage2.Controls.Add(this.txbxPort);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(483, 513);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "New Web App";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // comboBoxAppPoolAccount
            // 
            this.comboBoxAppPoolAccount.FormattingEnabled = true;
            this.comboBoxAppPoolAccount.Location = new System.Drawing.Point(108, 179);
            this.comboBoxAppPoolAccount.Name = "comboBoxAppPoolAccount";
            this.comboBoxAppPoolAccount.Size = new System.Drawing.Size(348, 21);
            this.comboBoxAppPoolAccount.TabIndex = 35;
            this.comboBoxAppPoolAccount.Visible = false;
            // 
            // lblAppPoolAccount
            // 
            this.lblAppPoolAccount.AutoSize = true;
            this.lblAppPoolAccount.Location = new System.Drawing.Point(20, 182);
            this.lblAppPoolAccount.Name = "lblAppPoolAccount";
            this.lblAppPoolAccount.Size = new System.Drawing.Size(87, 13);
            this.lblAppPoolAccount.TabIndex = 34;
            this.lblAppPoolAccount.Text = "AppPoolAccount";
            this.lblAppPoolAccount.Visible = false;
            // 
            // lbltime
            // 
            this.lbltime.AutoSize = true;
            this.lbltime.Location = new System.Drawing.Point(326, 488);
            this.lbltime.Name = "lbltime";
            this.lbltime.Size = new System.Drawing.Size(0, 13);
            this.lbltime.TabIndex = 32;
            this.lbltime.Visible = false;
            // 
            // txbxNewWebAppResult
            // 
            this.txbxNewWebAppResult.BackColor = System.Drawing.Color.White;
            this.txbxNewWebAppResult.Location = new System.Drawing.Point(23, 302);
            this.txbxNewWebAppResult.MaxLength = 999999;
            this.txbxNewWebAppResult.Multiline = true;
            this.txbxNewWebAppResult.Name = "txbxNewWebAppResult";
            this.txbxNewWebAppResult.ReadOnly = true;
            this.txbxNewWebAppResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txbxNewWebAppResult.Size = new System.Drawing.Size(433, 147);
            this.txbxNewWebAppResult.TabIndex = 30;
            this.txbxNewWebAppResult.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 286);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(40, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "Result:";
            this.label3.Visible = false;
            // 
            // progressBar2
            // 
            this.progressBar2.Location = new System.Drawing.Point(23, 462);
            this.progressBar2.Name = "progressBar2";
            this.progressBar2.Size = new System.Drawing.Size(352, 23);
            this.progressBar2.TabIndex = 29;
            this.progressBar2.Visible = false;
            // 
            // btnCreate
            // 
            this.btnCreate.Location = new System.Drawing.Point(381, 462);
            this.btnCreate.Name = "btnCreate";
            this.btnCreate.Size = new System.Drawing.Size(75, 23);
            this.btnCreate.TabIndex = 28;
            this.btnCreate.Text = "Create";
            this.btnCreate.UseVisualStyleBackColor = true;
            this.btnCreate.Visible = false;
            this.btnCreate.Click += new System.EventHandler(this.btnCreate_Click);
            // 
            // comboBoxApplicationPool
            // 
            this.comboBoxApplicationPool.FormattingEnabled = true;
            this.comboBoxApplicationPool.Location = new System.Drawing.Point(108, 152);
            this.comboBoxApplicationPool.Name = "comboBoxApplicationPool";
            this.comboBoxApplicationPool.Size = new System.Drawing.Size(348, 21);
            this.comboBoxApplicationPool.TabIndex = 27;
            this.comboBoxApplicationPool.Visible = false;
            // 
            // lblCustomSignInPage
            // 
            this.lblCustomSignInPage.AutoSize = true;
            this.lblCustomSignInPage.Location = new System.Drawing.Point(20, 260);
            this.lblCustomSignInPage.Name = "lblCustomSignInPage";
            this.lblCustomSignInPage.Size = new System.Drawing.Size(78, 13);
            this.lblCustomSignInPage.TabIndex = 26;
            this.lblCustomSignInPage.Text = "Custom Sign In";
            this.lblCustomSignInPage.Visible = false;
            // 
            // txbxCustomSignInPage
            // 
            this.txbxCustomSignInPage.Location = new System.Drawing.Point(108, 257);
            this.txbxCustomSignInPage.Name = "txbxCustomSignInPage";
            this.txbxCustomSignInPage.Size = new System.Drawing.Size(348, 20);
            this.txbxCustomSignInPage.TabIndex = 25;
            this.txbxCustomSignInPage.Visible = false;
            // 
            // lblVRoot
            // 
            this.lblVRoot.AutoSize = true;
            this.lblVRoot.Location = new System.Drawing.Point(20, 25);
            this.lblVRoot.Name = "lblVRoot";
            this.lblVRoot.Size = new System.Drawing.Size(37, 13);
            this.lblVRoot.TabIndex = 24;
            this.lblVRoot.Text = "VRoot";
            this.lblVRoot.Visible = false;
            // 
            // txbxVRoot
            // 
            this.txbxVRoot.Location = new System.Drawing.Point(108, 22);
            this.txbxVRoot.Name = "txbxVRoot";
            this.txbxVRoot.Size = new System.Drawing.Size(348, 20);
            this.txbxVRoot.TabIndex = 23;
            this.txbxVRoot.Text = "vroot";
            this.txbxVRoot.Visible = false;
            this.txbxVRoot.TextChanged += new System.EventHandler(this.txbxVRoot_TextChanged);
            // 
            // lblSQLpassword
            // 
            this.lblSQLpassword.AutoSize = true;
            this.lblSQLpassword.Location = new System.Drawing.Point(249, 234);
            this.lblSQLpassword.Name = "lblSQLpassword";
            this.lblSQLpassword.Size = new System.Drawing.Size(76, 13);
            this.lblSQLpassword.TabIndex = 22;
            this.lblSQLpassword.Text = "SQL password";
            this.lblSQLpassword.Visible = false;
            // 
            // txbxSQLpassword
            // 
            this.txbxSQLpassword.Location = new System.Drawing.Point(331, 231);
            this.txbxSQLpassword.Name = "txbxSQLpassword";
            this.txbxSQLpassword.Size = new System.Drawing.Size(125, 20);
            this.txbxSQLpassword.TabIndex = 21;
            this.txbxSQLpassword.Text = "~!password1!~";
            this.txbxSQLpassword.Visible = false;
            // 
            // lblSQLaccount
            // 
            this.lblSQLaccount.AutoSize = true;
            this.lblSQLaccount.Location = new System.Drawing.Point(20, 237);
            this.lblSQLaccount.Name = "lblSQLaccount";
            this.lblSQLaccount.Size = new System.Drawing.Size(70, 13);
            this.lblSQLaccount.TabIndex = 20;
            this.lblSQLaccount.Text = "SQL account";
            this.lblSQLaccount.Visible = false;
            // 
            // txbxSQLaccount
            // 
            this.txbxSQLaccount.Location = new System.Drawing.Point(108, 231);
            this.txbxSQLaccount.Name = "txbxSQLaccount";
            this.txbxSQLaccount.Size = new System.Drawing.Size(134, 20);
            this.txbxSQLaccount.TabIndex = 19;
            this.txbxSQLaccount.Text = "sa";
            this.txbxSQLaccount.Visible = false;
            // 
            // lblDatabaseName
            // 
            this.lblDatabaseName.AutoSize = true;
            this.lblDatabaseName.Location = new System.Drawing.Point(232, 208);
            this.lblDatabaseName.Name = "lblDatabaseName";
            this.lblDatabaseName.Size = new System.Drawing.Size(56, 13);
            this.lblDatabaseName.TabIndex = 18;
            this.lblDatabaseName.Text = "DB Name ";
            this.lblDatabaseName.Visible = false;
            // 
            // txbxDatabaseName
            // 
            this.txbxDatabaseName.Location = new System.Drawing.Point(291, 205);
            this.txbxDatabaseName.Name = "txbxDatabaseName";
            this.txbxDatabaseName.Size = new System.Drawing.Size(165, 20);
            this.txbxDatabaseName.TabIndex = 17;
            this.txbxDatabaseName.Text = "WSS_Content_vroot";
            this.txbxDatabaseName.Visible = false;
            // 
            // lblDatabaseServer
            // 
            this.lblDatabaseServer.AutoSize = true;
            this.lblDatabaseServer.Location = new System.Drawing.Point(20, 208);
            this.lblDatabaseServer.Name = "lblDatabaseServer";
            this.lblDatabaseServer.Size = new System.Drawing.Size(87, 13);
            this.lblDatabaseServer.TabIndex = 16;
            this.lblDatabaseServer.Text = "Database Server";
            this.lblDatabaseServer.Visible = false;
            // 
            // txbxDatabaseServer
            // 
            this.txbxDatabaseServer.Location = new System.Drawing.Point(108, 205);
            this.txbxDatabaseServer.Name = "txbxDatabaseServer";
            this.txbxDatabaseServer.Size = new System.Drawing.Size(118, 20);
            this.txbxDatabaseServer.TabIndex = 15;
            this.txbxDatabaseServer.Visible = false;
            // 
            // lblApplicationPool
            // 
            this.lblApplicationPool.AutoSize = true;
            this.lblApplicationPool.Location = new System.Drawing.Point(20, 155);
            this.lblApplicationPool.Name = "lblApplicationPool";
            this.lblApplicationPool.Size = new System.Drawing.Size(82, 13);
            this.lblApplicationPool.TabIndex = 14;
            this.lblApplicationPool.Text = "Application pool";
            this.lblApplicationPool.Visible = false;
            // 
            // lblUrl
            // 
            this.lblUrl.AutoSize = true;
            this.lblUrl.Location = new System.Drawing.Point(20, 77);
            this.lblUrl.Name = "lblUrl";
            this.lblUrl.Size = new System.Drawing.Size(29, 13);
            this.lblUrl.TabIndex = 12;
            this.lblUrl.Text = "URL";
            this.lblUrl.Visible = false;
            // 
            // txbxUrl
            // 
            this.txbxUrl.Location = new System.Drawing.Point(108, 74);
            this.txbxUrl.Name = "txbxUrl";
            this.txbxUrl.Size = new System.Drawing.Size(348, 20);
            this.txbxUrl.TabIndex = 11;
            this.txbxUrl.Text = "https://vrootsp.kisp.com";
            this.txbxUrl.Visible = false;
            // 
            // lblRole
            // 
            this.lblRole.AutoSize = true;
            this.lblRole.Location = new System.Drawing.Point(278, 133);
            this.lblRole.Name = "lblRole";
            this.lblRole.Size = new System.Drawing.Size(29, 13);
            this.lblRole.TabIndex = 10;
            this.lblRole.Text = "Role";
            this.lblRole.Visible = false;
            // 
            // txbxRole
            // 
            this.txbxRole.Location = new System.Drawing.Point(313, 126);
            this.txbxRole.Name = "txbxRole";
            this.txbxRole.Size = new System.Drawing.Size(143, 20);
            this.txbxRole.TabIndex = 9;
            this.txbxRole.Text = "FBARoleProvider";
            this.txbxRole.Visible = false;
            // 
            // lblMembership
            // 
            this.lblMembership.AutoSize = true;
            this.lblMembership.Location = new System.Drawing.Point(20, 129);
            this.lblMembership.Name = "lblMembership";
            this.lblMembership.Size = new System.Drawing.Size(64, 13);
            this.lblMembership.TabIndex = 8;
            this.lblMembership.Text = "Membership";
            this.lblMembership.Visible = false;
            // 
            // txbxMembership
            // 
            this.txbxMembership.Location = new System.Drawing.Point(108, 126);
            this.txbxMembership.Name = "txbxMembership";
            this.txbxMembership.Size = new System.Drawing.Size(152, 20);
            this.txbxMembership.TabIndex = 7;
            this.txbxMembership.Text = "FBAMembershipProvider";
            this.txbxMembership.Visible = false;
            // 
            // lblPath
            // 
            this.lblPath.AutoSize = true;
            this.lblPath.Location = new System.Drawing.Point(20, 103);
            this.lblPath.Name = "lblPath";
            this.lblPath.Size = new System.Drawing.Size(29, 13);
            this.lblPath.TabIndex = 6;
            this.lblPath.Text = "Path";
            this.lblPath.Visible = false;
            // 
            // txbxPath
            // 
            this.txbxPath.Location = new System.Drawing.Point(108, 100);
            this.txbxPath.Name = "txbxPath";
            this.txbxPath.Size = new System.Drawing.Size(348, 20);
            this.txbxPath.TabIndex = 5;
            this.txbxPath.Text = "C:\\inetpub\\wwwroot\\wss\\VirtualDirectories\\vrootsp.kisp.com";
            this.txbxPath.Visible = false;
            // 
            // lblHostHeader
            // 
            this.lblHostHeader.AutoSize = true;
            this.lblHostHeader.Location = new System.Drawing.Point(20, 54);
            this.lblHostHeader.Name = "lblHostHeader";
            this.lblHostHeader.Size = new System.Drawing.Size(67, 13);
            this.lblHostHeader.TabIndex = 4;
            this.lblHostHeader.Text = "Host Header";
            this.lblHostHeader.Visible = false;
            // 
            // txbxHostHeader
            // 
            this.txbxHostHeader.Location = new System.Drawing.Point(108, 48);
            this.txbxHostHeader.Name = "txbxHostHeader";
            this.txbxHostHeader.Size = new System.Drawing.Size(217, 20);
            this.txbxHostHeader.TabIndex = 3;
            this.txbxHostHeader.Text = "vrootsp.kisp.com";
            this.txbxHostHeader.Visible = false;
            // 
            // lblPort
            // 
            this.lblPort.AutoSize = true;
            this.lblPort.Location = new System.Drawing.Point(335, 51);
            this.lblPort.Name = "lblPort";
            this.lblPort.Size = new System.Drawing.Size(26, 13);
            this.lblPort.TabIndex = 2;
            this.lblPort.Text = "Port";
            this.lblPort.Visible = false;
            // 
            // txbxPort
            // 
            this.txbxPort.Location = new System.Drawing.Point(367, 48);
            this.txbxPort.Name = "txbxPort";
            this.txbxPort.Size = new System.Drawing.Size(89, 20);
            this.txbxPort.TabIndex = 1;
            this.txbxPort.Text = "443";
            this.txbxPort.Visible = false;
            // 
            // backgroundWorker1
            // 
            this.backgroundWorker1.WorkerReportsProgress = true;
            this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
            this.backgroundWorker1.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker1_ProgressChanged);
            this.backgroundWorker1.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker1_RunWorkerCompleted);
            // 
            // timer1
            // 
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // radioMosaicSilverSites
            // 
            this.radioMosaicSilverSites.AutoSize = true;
            this.radioMosaicSilverSites.Location = new System.Drawing.Point(193, 111);
            this.radioMosaicSilverSites.Name = "radioMosaicSilverSites";
            this.radioMosaicSilverSites.Size = new System.Drawing.Size(114, 17);
            this.radioMosaicSilverSites.TabIndex = 15;
            this.radioMosaicSilverSites.TabStop = true;
            this.radioMosaicSilverSites.Text = "Mosaic Silver Sites";
            this.radioMosaicSilverSites.UseVisualStyleBackColor = true;
            this.radioMosaicSilverSites.CheckedChanged += new System.EventHandler(this.radioMosaicSilverSites_CheckedChanged);
            // 
            // radioAllOtherSites
            // 
            this.radioAllOtherSites.AutoSize = true;
            this.radioAllOtherSites.Location = new System.Drawing.Point(313, 111);
            this.radioAllOtherSites.Name = "radioAllOtherSites";
            this.radioAllOtherSites.Size = new System.Drawing.Size(91, 17);
            this.radioAllOtherSites.TabIndex = 16;
            this.radioAllOtherSites.TabStop = true;
            this.radioAllOtherSites.Text = "All Other Sites";
            this.radioAllOtherSites.UseVisualStyleBackColor = true;
            this.radioAllOtherSites.CheckedChanged += new System.EventHandler(this.radioAllOtherSites_CheckedChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(515, 563);
            this.Controls.Add(this.tabControl1);
            this.Name = "Form1";
            this.Text = "KispSharePoint PowerShell Update";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnSubmit;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.CheckedListBox checkedListBox1;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.Button btnOpenFile;
        private System.Windows.Forms.TextBox txbxFilePath;
        private System.Windows.Forms.Label lblScriptFile;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label lblUrl;
        private System.Windows.Forms.TextBox txbxUrl;
        private System.Windows.Forms.Label lblRole;
        private System.Windows.Forms.TextBox txbxRole;
        private System.Windows.Forms.Label lblMembership;
        private System.Windows.Forms.TextBox txbxMembership;
        private System.Windows.Forms.Label lblPath;
        private System.Windows.Forms.TextBox txbxPath;
        private System.Windows.Forms.Label lblHostHeader;
        private System.Windows.Forms.TextBox txbxHostHeader;
        private System.Windows.Forms.Label lblPort;
        private System.Windows.Forms.TextBox txbxPort;
        private System.Windows.Forms.Label lblSQLpassword;
        private System.Windows.Forms.TextBox txbxSQLpassword;
        private System.Windows.Forms.Label lblSQLaccount;
        private System.Windows.Forms.TextBox txbxSQLaccount;
        private System.Windows.Forms.Label lblDatabaseName;
        private System.Windows.Forms.TextBox txbxDatabaseName;
        private System.Windows.Forms.Label lblDatabaseServer;
        private System.Windows.Forms.TextBox txbxDatabaseServer;
        private System.Windows.Forms.Label lblApplicationPool;
        private System.Windows.Forms.Label lblVRoot;
        private System.Windows.Forms.TextBox txbxVRoot;
        private System.Windows.Forms.ComboBox comboBoxApplicationPool;
        private System.Windows.Forms.Label lblCustomSignInPage;
        private System.Windows.Forms.TextBox txbxCustomSignInPage;
        private System.Windows.Forms.ProgressBar progressBar2;
        private System.Windows.Forms.Button btnCreate;
        private System.Windows.Forms.TextBox txbxNewWebAppResult;
        private System.Windows.Forms.Label label3;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Label lbltime;
        private System.Windows.Forms.RadioButton radioButton4;
        private System.Windows.Forms.RadioButton radioButton3;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.Label lblAppPoolAccount;
        private System.Windows.Forms.ComboBox comboBoxAppPoolAccount;
        private System.Windows.Forms.RadioButton radioMosaicSilverSites;
        private System.Windows.Forms.RadioButton radioAllOtherSites;
    }
}

