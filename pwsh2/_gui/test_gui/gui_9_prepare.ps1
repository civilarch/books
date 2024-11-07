














        System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        System.Windows.Forms.DataGridViewCheckBoxColumn Column2;

        this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
        this.Column2 = new System.Windows.Forms.DataGridViewCheckBoxColumn();

        this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
        this.Column1,
        this.Column2});

        this.Column1.HeaderText = "Column1";
        this.Column1.Name = "Column1";

        this.Column2.HeaderText = "Column2";
        this.Column2.Name = "Column2";
        
        
        
        
        
        
   //Add a CheckBox Column to the DataGridView at the first position.
    DataGridViewCheckBoxColumn checkBoxColumn = new DataGridViewCheckBoxColumn();
    checkBoxColumn.HeaderText = "";
    checkBoxColumn.Width = 30;
    checkBoxColumn.Name = "checkBoxColumn";
    dataGridView1.Columns.Insert(0, checkBoxColumn);        
        
        
        
        
        dg.Columns["Column1"].Visible = false;
dg.Columns["Column2"].Visible = false;
dg.Columns["Column3"].Visible = false;
dg.Columns["Column4"].Visible = false;
dg.Columns["Column5"].Visible = false;

dg.Column["Column6"].DisplayIndex = 1;
dg.Column["Column7"].DisplayIndex = 2;
dg.Column["Column8"].DisplayIndex = 3;
dg.Column["Column9"].DisplayIndex = 4;
dg.Column["Column10"].DisplayIndex = 5;
