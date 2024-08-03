using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLiCuaHang
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel1.Controls.Clear();
            ChietKhau chietKhau = new ChietKhau();
            panel1.Controls.Add(chietKhau);
            chietKhau.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel1.Controls.Clear();
            TTHang chietKhau = new TTHang();
            panel1.Controls.Add(chietKhau);
            chietKhau.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            panel1.Controls.Clear();
            TTMatHang chietKhau = new TTMatHang();
            panel1.Controls.Add(chietKhau);
            chietKhau.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            panel1.Controls.Clear();
            NhapHang chietKhau = new NhapHang();
            panel1.Controls.Add(chietKhau);
            chietKhau.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            panel1.Controls.Clear();
            BanHang chietKhau = new BanHang();
            panel1.Controls.Add(chietKhau);
            chietKhau.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form2 a = new Form2();
            a.Show();
        }
    }
}
