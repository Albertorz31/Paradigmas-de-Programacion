namespace Lab4
{
    partial class GuardarArchivo
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
            this.guardar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.UbicacionText = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.NombreText = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // guardar
            // 
            this.guardar.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.guardar.Location = new System.Drawing.Point(131, 220);
            this.guardar.Name = "guardar";
            this.guardar.Size = new System.Drawing.Size(86, 33);
            this.guardar.TabIndex = 0;
            this.guardar.TabStop = false;
            this.guardar.Text = "Guardar";
            this.guardar.UseVisualStyleBackColor = false;
            this.guardar.Click += new System.EventHandler(this.saveArchive);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(226, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Escriba ubicacion del archivo:";
            // 
            // UbicacionText
            // 
            this.UbicacionText.Location = new System.Drawing.Point(24, 75);
            this.UbicacionText.Name = "UbicacionText";
            this.UbicacionText.Size = new System.Drawing.Size(193, 22);
            this.UbicacionText.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(9, 136);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(229, 17);
            this.label2.TabIndex = 3;
            this.label2.Text = "Escriba el nombre del archivo:";
            // 
            // NombreText
            // 
            this.NombreText.Location = new System.Drawing.Point(24, 169);
            this.NombreText.Name = "NombreText";
            this.NombreText.Size = new System.Drawing.Size(193, 22);
            this.NombreText.TabIndex = 4;
            // 
            // GuardarArchivo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Lab4.Properties.Resources.nbq_c;
            this.ClientSize = new System.Drawing.Size(246, 274);
            this.Controls.Add(this.NombreText);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.UbicacionText);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.guardar);
            this.Name = "GuardarArchivo";
            this.Text = "GuardarArchivo";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button guardar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox UbicacionText;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox NombreText;
    }
}