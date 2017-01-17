using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RadioOwner
{
    public class User
    {
        private int user_id;
        private string login;
        private string password;
        private string fio;
        private int role_id;
        private int balance;

        public User()
        {
            user_id = 0;
            login = String.Empty;
            password = String.Empty;
            fio = String.Empty;
            role_id = 0;
            balance = 0;
        }

        public int User_id 
        {
            get { return user_id; }
            set { user_id = value; }
        }
        public string Login
        {
            get { return login; }
            set { login = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string FIO
        {
            get { return fio; }
            set { fio = value; }
        }
        public int Role_id
        {
            get { return role_id; }
            set { role_id = value; }
        }
        public int Balance
        {
            get { return balance; }
            set { balance = value; }
        }
    }
}
