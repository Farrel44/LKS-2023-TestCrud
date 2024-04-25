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
using System.Globalization;
using System.Text.RegularExpressions;
using System.IO;

namespace LKS2023_AMINN
{
    public partial class Home : Form
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-8HBSV8M\SQLEXPRESS;Initial Catalog=CRUD;Integrated Security=True;Encrypt=True;TrustServerCertificate=True");
        public Home()
        {
            InitializeComponent();
        }
        string Jenis_kelamin;
        string imgloc = "";
        SqlCommand cmd;

        private void button3_Click(object sender, EventArgs e)
        {
            byte[] images = null;
            FileStream stream = new FileStream(imgloc, FileMode.Open, FileAccess.Read);
            BinaryReader brs = new BinaryReader(stream);
            images = brs.ReadBytes((int)stream.Length);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into [Siswa] (NIS, Nama, Kelas, Jurusan, Tempat_Lahir, Tanggal_Lahir, Jenis_Kelamin, Alamat, Foto) values ('" + textBox1.Text + "','" + textBox2 + "','" + textBox3 + "','" + textBox5 + "','" + textBox4 + "','" + dateTimePicker1.Text + "','" + Jenis_kelamin + "','" + textBox6.Text + "',@images)";
            cmd.Parameters.Add(new SqlParameter("@images", images));
            cmd.ExecuteNonQuery();
            conn.Close();
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
            textBox4.Text = "";
            textBox5.Text = "";
            textBox6.Text = "";
            radioButton1.Checked = false;
            radioButton2.Checked = false;
            dateTimePicker1.Value = DateTime.Now;
            pictureBox1.ImageLocation = null;
            MessageBox.Show("Data has been successfully inserted!");
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Jenis_kelamin = "Pria";
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Jenis_kelamin = "Wanita";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "png files(*.png)|*.png|jpg files(*.jpg)|*.jpg|All files(*.*)|*.*";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                imgloc = dialog.FileName.ToString();
                pictureBox1.ImageLocation = imgloc;
            }
        }

        public void displaydata()
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from [Siswa]";
            cmd.ExecuteNonQuery();
            DataTable data = new DataTable();
            SqlDataAdapter sqladp = new SqlDataAdapter(cmd);
            sqladp.Fill(data);
            dataGridView1.DataSource = data;
            conn.Close();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            displaydata();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text; 
            cmd.CommandText = "delete from [Siswa] where NIS = '" + textBox8.Text + "'";
            cmd.ExecuteNonQuery();
            conn.Close();
            textBox8.Text = "";
            MessageBox.Show("Data deleted successfully");

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
