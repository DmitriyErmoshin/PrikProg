using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RadioOwner
{
    public class RadioSt
    {
        int id;
        string name;
        int type_id;
        string type_name;
        int available_song;
        int available_months;
        DateTime fromdate;
        int user_id;

        public RadioSt()
        {
            id = 0;
            name = String.Empty;
            type_id = 0;
            type_name = String.Empty;
            available_song = 0;
            available_months = 0;
            fromdate = DateTime.Today;
            user_id = 0;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public int Type_id
        {
            get { return type_id; }
            set { type_id = value; }
        }
        public string Type_name
        {
            get { return type_name; }
            set { type_name = value; }
        }
        public int Available_song
        {
            get { return available_song; }
            set { available_song = value; }
        }
        public int Available_months
        {
            get { return available_months; }
            set { available_months = value; }
        }
        public DateTime Fromdate
        {
            get { return fromdate; }
            set { fromdate = value; }
        }
        public int User_id
        {
            get { return user_id; }
            set { user_id = value; }
        }
    }
}
