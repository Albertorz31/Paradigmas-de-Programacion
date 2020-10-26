namespace Lab4
{
    partial class Usuario
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.Seed = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.botonComenzar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Seed
            // 
            this.Seed.Location = new System.Drawing.Point(12, 76);
            this.Seed.Name = "Seed";
            this.Seed.Size = new System.Drawing.Size(176, 22);
            this.Seed.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Lucida Sans Unicode", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(11, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(177, 23);
            this.label1.TabIndex = 1;
            this.label1.Text = "Ingrese semilla:";
            // 
            // botonComenzar
            // 
            this.botonComenzar.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.botonComenzar.Location = new System.Drawing.Point(210, 76);
            this.botonComenzar.Name = "botonComenzar";
            this.botonComenzar.Size = new System.Drawing.Size(90, 40);
            this.botonComenzar.TabIndex = 2;
            this.botonComenzar.Text = "Comenzar";
            this.botonComenzar.UseVisualStyleBackColor = false;
            this.botonComenzar.Click += new System.EventHandler(this.botonComenzar_Click);
            // 
            // Usuario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImage = global::Lab4.Properties.Resources.nbq_c;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(312, 128);
            this.Controls.Add(this.botonComenzar);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Seed);
            this.DoubleBuffered = true;
            this.MaximizeBox = false;
            this.Name = "Usuario";
            this.Text = "Chatbot Mr. Ham";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox Seed;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button botonComenzar;
    }
}

