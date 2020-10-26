namespace Lab4
{
    partial class Rate
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Rate));
            this.sendR = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.Nota = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // sendR
            // 
            this.sendR.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.sendR.Location = new System.Drawing.Point(391, 144);
            this.sendR.Name = "sendR";
            this.sendR.Size = new System.Drawing.Size(115, 43);
            this.sendR.TabIndex = 0;
            this.sendR.Text = "Enviar";
            this.sendR.UseVisualStyleBackColor = false;
            this.sendR.Click += new System.EventHandler(this.sendRate);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(527, 119);
            this.label1.TabIndex = 1;
            this.label1.Text = resources.GetString("label1.Text");
            // 
            // Nota
            // 
            this.Nota.Location = new System.Drawing.Point(15, 155);
            this.Nota.Name = "Nota";
            this.Nota.Size = new System.Drawing.Size(265, 22);
            this.Nota.TabIndex = 2;
            // 
            // Rate
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Lab4.Properties.Resources.nbq_c;
            this.ClientSize = new System.Drawing.Size(555, 199);
            this.Controls.Add(this.Nota);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.sendR);
            this.Name = "Rate";
            this.Text = "Rate";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button sendR;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox Nota;
    }
}