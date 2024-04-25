using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Runtime.Remoting.Contexts;
using System.Xml.Linq;

namespace LKS2023_AMINN
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-8HBSV8M\SQLEXPRESS;Initial Catalog=CRUD;Integrated Security=True");
            SqlDataAdapter sda = new SqlDataAdapter("select count (*) from Login_Crud where NamaUser = '" + textBox1.Text + "' and Password = '" + textBox2.Text + "'", conn);
            DataTable login_tb = new DataTable();
            sda.Fill(login_tb);
            if (login_tb.Rows[0][0].ToString() == "1")
            {
                this.Hide();
                Home home = new Home();
                home.Show();
            }
            else
            {
                MessageBox.Show("Password atau Username tidak cocok dengan akun mana pun!!", "Perhatian",MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
