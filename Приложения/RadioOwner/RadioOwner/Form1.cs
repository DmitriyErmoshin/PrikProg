using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QueryServer;

namespace RadioOwner
{
    public partial class Form1 : Form
    {
        User[] Users;
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }


        private void refreshUser()
        {
            string resultQuery = Class1.POST("http://localhost/team/users.php", "select=1");
            int count = 0;
            string[] str = new string[] { "\n" };
            string[] resultArray = resultQuery.Split(str, StringSplitOptions.RemoveEmptyEntries);
            foreach (string str1 in resultArray)
            {
                if (str1 != "<hr>")
                    if (Program.FindInfo(str1) == "2")
                        count++;
            }
            Users = new User[count - 1];
            int index = 0;
            for (int i = 0; i < resultArray.Length; i = i + 6)
            {
                if (Convert.ToInt32(Program.FindInfo(resultArray[i + 4])) == 2)
                {

                    Users[index] = new User();
                    Users[index].User_id = Convert.ToInt32(Program.FindInfo(resultArray[i]));
                    Users[index].Login = Program.FindInfo(resultArray[i + 1]);
                    Users[index].Password = Program.FindInfo(resultArray[i + 2]);
                    Users[index].FIO = Program.FindInfo(resultArray[i + 3]);
                    Users[index].Role_id = Convert.ToInt32(Program.FindInfo(resultArray[i + 4]));
                    index++;
                }
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.Width = 450;
            this.Height = 400;

            refreshUser();
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string login = textBox1.Text;
                string password = textBox2.Text;
                foreach (User u in Users)
                {
                    if (u.Login == login)
                    {
                        if (u.Password == password)
                        {
                            MessageBox.Show("Вход в систему успешно выполнен!", "Выполнен вход", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            Form2 f = new Form2();
                            f.Text += u.FIO;
                            f.tekUser = u;
                            this.Hide();
                            f.ShowDialog();
                            this.Show();
                        }
                        else
                            MessageBox.Show("Неверный логин и пароль!!!", "ВНИМАНИЕ, ОШИБКА!!!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "ВНИМАНИЕ, ОШИБКА!!!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
