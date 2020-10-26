namespace Lab4
{
    partial class ChatbotOficial
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
            this.beginDialog = new System.Windows.Forms.Button();
            this.save = new System.Windows.Forms.Button();
            this.load = new System.Windows.Forms.Button();
            this.end = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.sendMsn = new System.Windows.Forms.Button();
            this.Pantalla = new System.Windows.Forms.TextBox();
            this.RespuestaUsr = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // beginDialog
            // 
            this.beginDialog.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.beginDialog.Location = new System.Drawing.Point(695, 56);
            this.beginDialog.Name = "beginDialog";
            this.beginDialog.Size = new System.Drawing.Size(185, 39);
            this.beginDialog.TabIndex = 0;
            this.beginDialog.Text = "Comenzar Conversación";
            this.beginDialog.UseVisualStyleBackColor = false;
            this.beginDialog.Click += new System.EventHandler(this.BeginDialog);
            // 
            // save
            // 
            this.save.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.save.Location = new System.Drawing.Point(695, 206);
            this.save.Name = "save";
            this.save.Size = new System.Drawing.Size(185, 40);
            this.save.TabIndex = 1;
            this.save.Text = "Guardar Log";
            this.save.UseVisualStyleBackColor = false;
            this.save.Click += new System.EventHandler(this.saveLog);
            // 
            // load
            // 
            this.load.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.load.Location = new System.Drawing.Point(695, 283);
            this.load.Name = "load";
            this.load.Size = new System.Drawing.Size(185, 40);
            this.load.TabIndex = 2;
            this.load.Text = "Cargar Log";
            this.load.UseVisualStyleBackColor = false;
            this.load.Click += new System.EventHandler(this.loadLog);
            // 
            // end
            // 
            this.end.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.end.Location = new System.Drawing.Point(695, 128);
            this.end.Name = "end";
            this.end.Size = new System.Drawing.Size(185, 44);
            this.end.TabIndex = 3;
            this.end.Text = "Terminar Conversacion";
            this.end.UseVisualStyleBackColor = false;
            this.end.Click += new System.EventHandler(this.endDialog);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(23, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(207, 29);
            this.label1.TabIndex = 5;
            this.label1.Text = "Chatbot Mr. Ham";
            // 
            // sendMsn
            // 
            this.sendMsn.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.sendMsn.Location = new System.Drawing.Point(536, 359);
            this.sendMsn.Name = "sendMsn";
            this.sendMsn.Size = new System.Drawing.Size(120, 41);
            this.sendMsn.TabIndex = 6;
            this.sendMsn.Text = "Enviar";
            this.sendMsn.UseVisualStyleBackColor = false;
            this.sendMsn.Click += new System.EventHandler(this.sendMessage);
            // 
            // Pantalla
            // 
            this.Pantalla.Location = new System.Drawing.Point(28, 56);
            this.Pantalla.Margin = new System.Windows.Forms.Padding(5);
            this.Pantalla.MaximumSize = new System.Drawing.Size(1000, 1000);
            this.Pantalla.Multiline = true;
            this.Pantalla.Name = "Pantalla";
            this.Pantalla.Size = new System.Drawing.Size(628, 280);
            this.Pantalla.TabIndex = 9;
            // 
            // RespuestaUsr
            // 
            this.RespuestaUsr.Location = new System.Drawing.Point(28, 368);
            this.RespuestaUsr.Name = "RespuestaUsr";
            this.RespuestaUsr.Size = new System.Drawing.Size(476, 22);
            this.RespuestaUsr.TabIndex = 10;
            // 
            // ChatbotOficial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Lab4.Properties.Resources.nbq_c;
            this.ClientSize = new System.Drawing.Size(910, 426);
            this.Controls.Add(this.RespuestaUsr);
            this.Controls.Add(this.Pantalla);
            this.Controls.Add(this.sendMsn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.end);
            this.Controls.Add(this.load);
            this.Controls.Add(this.save);
            this.Controls.Add(this.beginDialog);
            this.DoubleBuffered = true;
            this.MaximizeBox = false;
            this.Name = "ChatbotOficial";
            this.Text = "ChatbotOficial";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button beginDialog;
        private System.Windows.Forms.Button save;
        private System.Windows.Forms.Button load;
        private System.Windows.Forms.Button end;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button sendMsn;
        private System.Windows.Forms.TextBox Pantalla;
        private System.Windows.Forms.TextBox RespuestaUsr;
    }
}