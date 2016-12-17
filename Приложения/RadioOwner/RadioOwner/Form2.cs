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
    public partial class Form2 : Form
    {
        public User tekUser;
        RadioSt[] radio;

        private void refreshRadioSt()
        {
            string resultQuery = Class1.POST("http://localhost/team/radiost.php", "select=1");
            int count = 0;
            string[] str = new string[] { "\n" };
            string[] resultArray = resultQuery.Split(str, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 7; i < resultArray.Length; i += 9)
            {
                if (Convert.ToInt32(Program.FindInfo(resultArray[i])) == tekUser.User_id)
                {
                    count++;
                }
            }
            radio = new RadioSt[count];
            int index = 0;
            for (int i = 0; i < resultArray.Length; i += 9)
            {
                if (Convert.ToInt32(Program.FindInfo(resultArray[i + 7])) == tekUser.User_id)
                {
                    radio[index] = new RadioSt();
                    radio[index].Id = Convert.ToInt32(Program.FindInfo(resultArray[i]));
                    radio[index].Name = Program.FindInfo(resultArray[i + 1]);
                    radio[index].Type_id = Convert.ToInt32(Program.FindInfo(resultArray[i + 2]));
                    radio[index].Type_name = Program.FindInfo(resultArray[i + 3]);
                    radio[index].Available_song = Convert.ToInt32(Program.FindInfo(resultArray[i + 4]));
                    radio[index].Available_months = Convert.ToInt32(Program.FindInfo(resultArray[i + 5]));
                    string date = Program.FindInfo(resultArray[i + 6]);
                    if (date == "")
                        radio[index].Fromdate = Convert.ToDateTime(null);
                    else
                        radio[index].Fromdate = Convert.ToDateTime(date);
                    radio[index].User_id = Convert.ToInt32(Program.FindInfo(resultArray[i + 7]));
                    index++;
                }
            }
        }

        public Form2()
        {
            InitializeComponent();
            tekUser = new User();
        }


        private void Form2_Load(object sender, EventArgs e)
        {
            label9.Text += "\n" + tekUser.User_id + " " + tekUser.Login + " ";
            label9.Text += tekUser.Password + " " + tekUser.FIO + " " + tekUser.Role_id;
            refreshRadioSt();
            foreach (RadioSt r in radio)
            {
                listBox1.Items.Add(r.Name);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int itemIndex = listBox1.SelectedIndex;
            label2.Text = "Название: " + radio[itemIndex].Name;
            label3.Text = "Вид доступа: " + radio[itemIndex].Type_name;
            //label4.Text = "Кол-во слушателей: " + radio[itemIndex].Name;
            //label5.Text = "Кол-во оценок: " + radio[itemIndex].Name;
            //label6.Text = "Средняя оценка: " + radio[itemIndex].Name;
        }
    }
}
